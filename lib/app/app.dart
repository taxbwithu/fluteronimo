import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutteronimo/app/environment.dart';
import 'package:flutteronimo/common/app_router/app_router.gr.dart';
import 'package:flutteronimo/generated/l10n.dart';

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

  // TODO 29.12 Add MultiLocaleController
  Widget _buildMaterialApp() {
    const localization = AppLocalizationDelegate();
    return MaterialApp.router(
      title: "Flutter Experiment Field",
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: const [
        localization,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routeInformationProvider: _appRouter.routeInfoProvider(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
