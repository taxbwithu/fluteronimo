import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/common/data_models/deal_item/deal_item.dart';
import 'package:flutteronimo/common/repositories/dependency_graph.dart';
import 'package:flutteronimo/common/theme/app_decorator.dart';
import 'package:flutteronimo/common/widgets/base_screen/base_screen.dart';
import 'package:flutteronimo/common/widgets/base_screen/widgets/custom_loading_overlay.dart';
import 'package:flutteronimo/feature/home/subscreens/deals/view/deals_screen_navigation.dart';
import 'package:flutteronimo/feature/home/subscreens/deals/vm/deals_vm.dart';
import 'package:flutteronimo/feature/home/subscreens/deals/widgets/deal_card.dart';
import 'package:flutteronimo/feature/home/subscreens/deals/widgets/deals_header.dart';
import 'package:flutteronimo/gen/colors.gen.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DealsScreen extends StatefulWidget {
  const DealsScreen({Key? key}) : super(key: key);

  @override
  _DealsScreenState createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> with DealsScreenNavigation {
  late DealsVm _viewModel;
  late final ScrollController _scrollController;

  @override
  void initState() {
    final dependencyGraph =
        Provider.of<DependencyGraph>(context, listen: false);

    _viewModel = DealsVm(
      dealsRepository: dependencyGraph.getDealsRepository(),
      storesRepository: dependencyGraph.getStoresRepository(),
    );
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    _viewModel.loadScreenData();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      vm: _viewModel,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDecorator.drawBackgroundGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DealsHeader(),
            Expanded(child: _buildGameList()),
          ],
        ),
      ),
    );
  }

  Widget _buildGameList() {
    return StreamBuilder<List<DealItem>?>(
      stream: _viewModel.screenContentSubject.stream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data != null) {
          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: ColorName.safeAreaDark,
            onRefresh: () => _viewModel.loadScreenData(isRefreshing: true),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return DealCard(
                          deal: data[index],
                          onDealTap: () => openDealDetails(
                            context: context,
                            dealId: data[index].dealID,
                          ),
                        );
                      },
                      childCount: data.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.64,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: StreamBuilder<bool>(
                    stream: _viewModel.isLoadingNextPageStream,
                    builder: (context, snapshot) {
                      final isLoading = snapshot.data ?? false;
                      if (!isLoading) return const SizedBox.shrink();

                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: CustomLoadingOverlay(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            color: ColorName.safeAreaDark,
          );
        }
      },
    );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    const threshold = 300.0;

    if (position.pixels >= position.maxScrollExtent - threshold) {
      _viewModel.loadNextPage();
    }
  }
}
