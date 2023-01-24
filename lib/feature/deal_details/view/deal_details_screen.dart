import 'package:flutter/material.dart';
import 'package:flutteronimo/common/data_models/deal_details/deal_details.dart';
import 'package:flutteronimo/common/repositories/dependency_graph.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';
import 'package:flutteronimo/common/widgets/drawer/custom_drawer.dart';
import 'package:flutteronimo/feature/deal_details/vm/deal_details_vm.dart';
import 'package:flutteronimo/gen/colors.gen.dart';
import 'package:flutteronimo/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../../common/factories/components_factory.dart';
import '../../../common/theme/app_decorator.dart';
import '../../../common/widgets/navigation_bar/app_navigation_bar.dart';

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
      key: _scaffoldKey,
      backgroundColor: ColorName.safeAreaDark,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: AppDecorator.drawBackgroundGradient(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppNavigationBar(
                screenTitle: Texts.current.deal_details_screen_label,
                leadingButton: ComponentsFactory.createBackArrowButton(),
                onLeadingTap: () => _viewModel.closeScreen(context: context),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: _buildDealCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDealCard() {
    return StreamBuilder<DealDetails?>(
      stream: _viewModel.screenContentSubject.stream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data != null) {
          return Container(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 8.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              children: [
                Text(data.toString(), style: AppTextStyle.body()),
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
}
