import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutteronimo/app/environment.dart';
import 'package:flutteronimo/common/app_router/app_router.gr.dart';
import 'package:flutteronimo/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../common/repositories/dependency_graph.dart';
import '../common/widgets/multi_locale_controller/multi_locale_controller.dart';
import 'package:sqflite/sqflite.dart';

class MyApp extends StatelessWidget {
  DependencyGraph dependencyGraph;
  final Environment environment;
  final _appRouter = AppRouter();

  MyApp({
    required this.environment,
    Key? key,
  })  : dependencyGraph = DependencyGraph(environment: environment),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DependencyGraph>.value(value: dependencyGraph),
      ],
      child: _buildWrappers(),
    );
  }

  Widget _buildWrappers() {
    return MultiLocaleController(
      builder: (context, locale) {
        return Builder(
          builder: (context) => _buildMaterialApp(
            locale: locale,
            context: context,
          ),
        );
      },
    );
  }

  Widget _buildMaterialApp({
    required Locale locale,
    required BuildContext context,
  }) {
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
      locale: locale,
      builder: (context, widget) {
        return widget ?? const SizedBox();
      },
    );
  }
}
