import 'package:flutter/material.dart';
import 'package:flutteronimo/common/widgets/base_screen/widgets/custom_loading_overlay.dart';
import 'package:flutteronimo/gen/colors.gen.dart';
import 'package:provider/provider.dart';
import 'base_vm.dart';

class BaseScreen<T extends BaseVm> extends StatelessWidget {
  final T vm;
  final Widget child;
  final bool resizeToAvoidBottomInset;

  const BaseScreen({
    super.key,
    required this.vm,
    required this.child,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: vm,
      child: Consumer<T>(
        builder: (context, vm, _) {
          _handleUiEvents(context, vm);

          return Stack(
            children: [
              Scaffold(
                backgroundColor: ColorName.primaryDark,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                body: SafeArea(
                  child: child,
                ),
              ),

              if (vm.isLoading) const CustomLoadingOverlay(),
            ],
          );
        },
      ),
    );
  }

  void _handleUiEvents(BuildContext context, T vm) {
    if (vm.uiEvents.isEmpty) return;

    final event = vm.uiEvents.first;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.consumeUiEvent(event);

      switch (event.type) {
        case UiEventType.dialog:
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(event.title ?? ''),
              content: Text(event.message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          break;

        case UiEventType.snackbar:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(event.message)),
          );
          break;
      }
    });
  }
}
