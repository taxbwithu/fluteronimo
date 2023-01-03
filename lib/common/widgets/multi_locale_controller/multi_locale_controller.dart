import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../gen/colors.gen.dart';
import '../../repositories/dependency_graph.dart';
import 'multi_locale_controller_vm.dart';

class MultiLocaleController extends StatefulWidget {
  final LocaleBuilder builder;

  const MultiLocaleController({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  _MultiLocaleControllerState createState() => _MultiLocaleControllerState();
}

class _MultiLocaleControllerState extends State<MultiLocaleController> {
  MultiLocaleControllerVm? _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dependencyGraph = Provider.of<DependencyGraph>(
      context,
      listen: false,
    );

    _viewModel = MultiLocaleControllerVm(
      repository: dependencyGraph.getMultiLocaleRepository(),
    );
    _viewModel?.loadLocale();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale>(
      stream: _viewModel?.selectedLocale,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data != null) {
          return widget.builder(context, data);
        } else {
          return Container(
            color: ColorName.primaryDark,
          );
        }
      },
    );
  }
}

typedef LocaleBuilder = Widget Function(BuildContext, Locale);
