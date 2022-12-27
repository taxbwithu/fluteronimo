import 'package:flutter/material.dart';
import 'package:flutteronimo/app/environment.dart';
import 'package:flutteronimo/common/app_router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  final Environment environment;
  final _appRouter = AppRouter();

  MyApp({
    required this.environment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp();
  }

  Widget _buildMaterialApp() {
    return MaterialApp.router(
      title: "Flutter Experiment Field",
      routeInformationProvider: _appRouter.routeInfoProvider(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
