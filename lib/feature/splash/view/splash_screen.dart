import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/common/repositories/dependency_graph.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';
import 'package:flutteronimo/feature/splash/view/splash_screen_navigation.dart';
import 'package:flutteronimo/feature/splash/vm/splash_vm.dart';
import 'package:flutteronimo/gen/assets.gen.dart';
import 'package:flutteronimo/gen/colors.gen.dart';
import 'package:flutteronimo/generated/l10n.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashScreenNavigation {
  late Texts _texts;
  late SplashVm _viewModel;

  StreamSubscription? _onUserLoggedInSubscription;

  @override
  void initState() {
    _texts = Texts.current;
    final dependencyGraph =
        Provider.of<DependencyGraph>(context, listen: false);

    _viewModel = SplashVm(
      userRepository: dependencyGraph.getUserRepository(),
    );
    _bindListeners();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(
        AssetImage(Assets.animations.loading.path),
        context,
      );
    });
    super.initState();
  }

  void _bindListeners() {
    _onUserLoggedInSubscription = _viewModel.userLoggedInSubject.stream.listen(
      (isUserLoggedIn) {
        if (isUserLoggedIn == null) return;
        if (isUserLoggedIn) {
          openDealsScreen(context: context);
        } else {
          openLoginScreen(context: context);
        }
      },
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _onUserLoggedInSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primaryDark,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnimation(),
              Text(
                _texts.splash_screen_loading_label,
                style: AppTextStyle.bold(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation() {
    return Image.asset(
      Assets.animations.loading.path,
      height: 150.0,
      width: 150.0,
    );
  }
}
