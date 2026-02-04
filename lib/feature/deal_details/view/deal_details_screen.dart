import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/common/data_models/deal_details/deal_details.dart';
import 'package:flutteronimo/common/repositories/dependency_graph.dart';
import 'package:flutteronimo/feature/deal_details/vm/deal_details_vm.dart';
import 'package:flutteronimo/feature/deal_details/widget/details_header_image.dart';
import 'package:flutteronimo/gen/colors.gen.dart';
import 'package:flutteronimo/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../../common/factories/components_factory.dart';
import '../../../common/theme/app_decorator.dart';
import '../../../common/widgets/navigation_bar/app_navigation_bar.dart';
import '../widget/deal_details_card.dart';

@RoutePage()
class DealDetailsScreen extends StatefulWidget {
  final String dealId;

  const DealDetailsScreen({
    required this.dealId,
    Key? key,
  }) : super(key: key);

  @override
  _DealDetailsScreenState createState() => _DealDetailsScreenState();
}

class _DealDetailsScreenState extends State<DealDetailsScreen> {
  late DealDetailsVm _viewModel;
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    final dependencyGraph =
    Provider.of<DependencyGraph>(context, listen: false);

    _viewModel =
        DealDetailsVm(dealsRepository: dependencyGraph.getDealsRepository());

    _viewModel.loadScreenData(
      dealId: widget.dealId,
    );
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: _buildScreenContent(),
    );
  }

  Widget _buildScreenContent() {
    return StreamBuilder<DealDetails?>(
      stream: _viewModel.screenContentSubject.stream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data != null) {
          return CustomScrollView(
            slivers: [
              DetailsHeaderImage(game: game),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TitleRow(
                        title: game.name,
                        isWishlisted: isWishlisted,
                        onWishlistTap: onToggleWishlist,
                      ),
                      const SizedBox(height: 8),
                      _RatingsRow(game: game),
                      const SizedBox(height: 16),
                      _PriceCard(
                        salePrice: game.salePrice,
                        retailPrice: game.retailPrice,
                        cheapestEver: cheapestEver,
                        cheapestDate: cheapestDate,
                      ),
                      const SizedBox(height: 16),
                      _GameStatusSelector(
                        current: gameStatus,
                        onChanged: onStatusChanged,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Other stores',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList.separated(
                itemCount: otherStores.length,
                separatorBuilder: (_, __) => const Divider(
                  color: Colors.white12,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final store = otherStores[index];
                  return ListTile(
                    title: Text(
                      store.storeName,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$${store.salePrice}',
                          style: const TextStyle(
                            color: Color(0xFF5CD85A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (store.isBest)
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Best',
                              style: TextStyle(
                                color: Color(0xFF5CD85A),
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                    onTap: () {},
                  );
                },
              ),
            ],
          );
        } else {
          return Container(
            color: ColorName.safeAreaDark,
          );
        }
      },
    );
  }
}
