import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/common/theme/app_decorator.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';
import 'package:flutteronimo/common/widgets/navigation_bar/app_navigation_bar.dart';
import 'package:flutteronimo/feature/home/vm/home_vm.dart';
import 'package:flutteronimo/feature/home/widgets/deal_card.dart';
import 'package:flutteronimo/gen/colors.gen.dart';
import 'package:provider/provider.dart';

import '../../../common/data_models/deal_item/deal_item.dart';
import '../../../common/repositories/dependency_graph.dart';
import '../../../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeVm _viewModel;

  @override
  void initState() {
    final dependencyGraph =
        Provider.of<DependencyGraph>(context, listen: false);

    _viewModel = HomeVm(dealsRepository: dependencyGraph.getDealsRepository());

    _viewModel.loadScreenData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.safeAreaDark,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: AppDecorator.drawBackgroundGradient(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppNavigationBar(screenTitle: Texts.current.test_screen_message),
              Expanded(child: _buildGameList()),
            ],
          ),
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
          return GridView.count(
            crossAxisCount: 2,
            children: List.generate(data.length, (index) {
              return DealCard(dealItem: data[index]);
            }),
          );
        } else {

          return Container(
            color: ColorName.primaryDark,
          );
        }
      },
    );
  }
}
