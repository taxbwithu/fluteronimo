import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/common/data_models/deal_details/deal_details.dart';
import 'package:flutteronimo/common/data_models/game_info/status/game_status.dart';
import 'package:flutteronimo/common/repositories/dependency_graph.dart';
import 'package:flutteronimo/feature/deal_details/vm/deal_details_vm.dart';
import 'package:flutteronimo/feature/deal_details/widget/details_header_image.dart';
import 'package:flutteronimo/feature/deal_details/widget/details_price_card.dart';
import 'package:flutteronimo/feature/deal_details/widget/details_ratings_row.dart';
import 'package:flutteronimo/feature/deal_details/widget/details_title_row.dart';
import 'package:flutteronimo/feature/deal_details/widget/game_status_selector.dart';
import 'package:flutteronimo/gen/colors.gen.dart';
import 'package:provider/provider.dart';

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
              DetailsHeaderImage(game: data.gameInfo),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsTitleRow(
                        title: data.gameInfo.name ?? "",
                        isWishlisted: false,
                        onWishlistTap: () => print("handlewishist"),
                      ),
                      const SizedBox(height: 8),
                      DetailsRatingsRow(game: data.gameInfo),
                      const SizedBox(height: 16),
                      DetailsPriceCard(
                        salePrice: data.gameInfo.salePrice ?? "",
                        retailPrice: data.gameInfo.retailPrice ?? "",
                        cheapestEver: data.cheapestPrice.cheapestPrice ?? "",
                        cheapestDate: data.cheapestPrice.cheapestPriceDate.toString(),
                      ),
                      const SizedBox(height: 16),
                      GameStatusSelector(
                        current: GameStatus.playing,
                        onChanged: (status) => print("handleOnChanged"),
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
                itemCount: data.cheaperStores.length,
                separatorBuilder: (_, __) => const Divider(
                  color: Colors.white12,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final store = data.cheaperStores[index];
                  return ListTile(
                    title: Text(
                      store.storeID ?? "",
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
                        if (true)
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
