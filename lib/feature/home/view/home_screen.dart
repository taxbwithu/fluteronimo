import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/common/theme/app_decorator.dart';
import 'package:flutteronimo/common/widgets/navigation_bar/app_navigation_bar.dart';
import 'package:flutteronimo/feature/home/vm/home_vm.dart';
import 'package:flutteronimo/gen/colors.gen.dart';
import 'package:provider/provider.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
