import 'package:flutter/cupertino.dart';
import 'package:flutteronimo/common/app_router/app_coordinator.dart';
import 'package:flutteronimo/common/data_models/deal_item/deal_item.dart';
import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';
import 'package:flutteronimo/common/repositories/stores/stores_repository.dart';
import 'package:flutteronimo/common/utils/rx/rx_extensions.dart';
import 'package:flutteronimo/common/widgets/base_screen/base_vm.dart';
import 'package:rxdart/rxdart.dart';

class DealsVm extends BaseVm {
  final DealsRepository dealsRepository;
  final StoresRepository storesRepository;
  final screenContentSubject = BehaviorSubject<List<DealItem>?>.seeded(null);
  final _isLoadingNextPageSubject = BehaviorSubject<bool>.seeded(false);
  final Map<String, List<DealItem>> _dealsByGame = {};

  bool _isLoadingNextPage = false;
  bool _hasMore = true;
  int currentPage = 0;

  DealsVm({
    required this.dealsRepository,
    required this.storesRepository,
  });

  Future loadScreenData({
    bool isRefreshing = false,
  }) async {
    await runSafe(
      () async {
        currentPage = 0;
        _dealsByGame.clear();
        final result =
            await dealsRepository.readDealList(currentPage: currentPage);
        await storesRepository.saveStoreList();
        if (result == null) return;
        addDealsFromPage(pageDeals: result);
      },
      showLoading: !isRefreshing,
    );
  }

  Future<void> loadNextPage() async {
    try {
      if (_isLoadingNextPage || !_hasMore) return;

      _isLoadingNextPage = true;
      _isLoadingNextPageSubject.add(true);
      currentPage = currentPage + 1;

      final nextPage =
          await dealsRepository.readDealList(currentPage: currentPage);

      if (nextPage == null || nextPage.isEmpty) {
        _hasMore = false;
      } else {
        addDealsFromPage(pageDeals: nextPage);
      }

      _isLoadingNextPage = false;
      _isLoadingNextPageSubject.add(false);
    } catch (error) {
      setError(error.toString());
    }
  }

  void addDealsFromPage({
    required List<DealItem> pageDeals,
  }) {
    for (final deal in pageDeals) {
      final key = _normalizeTitle(deal.title);

      _dealsByGame.putIfAbsent(key, () => []);
      _dealsByGame[key]!.add(deal);
    }

    _emitBestDeals();
  }

  void _emitBestDeals() {
    final bestDeals = _dealsByGame.values.map((deals) {
      return deals.reduce((a, b) {
        final priceA = _price(a);
        final priceB = _price(b);
        return priceA <= priceB ? a : b;
      });
    }).toList();

    screenContentSubject.add(bestDeals);
  }

  String _normalizeTitle(String title) => title
      .toLowerCase()
      .replaceAll(RegExp(r'[®™©]'), '')
      .replaceAll(RegExp(r'[:\-–—]'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .replaceAll(RegExp(r'\(.*?\)'), '')
      .replaceAll(RegExp(r'\[.*?\]'), '')
      .replaceAll(RegExp(r'edition|deluxe|ultimate|complete'), '')
      .trim();

  double _price(DealItem d) =>
      double.tryParse(d.salePrice.replaceAll('\$', '')) ?? double.infinity;

  Stream<bool> get isLoadingNextPageStream => _isLoadingNextPageSubject.stream;

  @override
  void dispose() {
    super.dispose();
    screenContentSubject.close();
    _isLoadingNextPageSubject.close();
  }
}
