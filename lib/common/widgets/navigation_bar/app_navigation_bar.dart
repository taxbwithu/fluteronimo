import 'package:flutter/material.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';
import 'package:flutteronimo/gen/colors.gen.dart';

class AppNavigationBar extends StatefulWidget {
  final String screenTitle;
  final VoidCallback? onLeadingTap;
  final Widget? leadingButton;
  final VoidCallback? onTrailingTap;
  final Widget? trailingButton;
  final bool hasBackground;

  const AppNavigationBar({
    required this.screenTitle,
    this.onLeadingTap,
    this.leadingButton,
    this.onTrailingTap,
    this.trailingButton,
    this.hasBackground = false,
    Key? key,
  }) : super(key: key);

  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: widget.hasBackground ? ColorName.safeAreaDark : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 1.0,
          ),
        )
      ),
      child: Row(
        children: [
          _buildActionButton(
            onButtonTap: widget.onLeadingTap,
            buttonContent: widget.leadingButton,
          ),
          const Spacer(),
          _buildScreenTitle(),
          const Spacer(),
          _buildActionButton(
            onButtonTap: widget.onTrailingTap,
            buttonContent: widget.trailingButton,
          ),
        ],
      ),
    );
  }

  Widget _buildScreenTitle() {
    return Text(
      widget.screenTitle.toUpperCase(),
      style: AppTextStyle.title().copyWith(color: Colors.white),
    );
  }

  Widget _buildActionButton({
    required VoidCallback? onButtonTap,
    required Widget? buttonContent,
  }) {
    if (onButtonTap == null || buttonContent == null) {
      return const SizedBox();
    }
    return InkWell(
      onTap: () => onButtonTap(),
      child: buttonContent,
    );
  }
}
