import 'package:flutter/material.dart';
import 'package:flutteronimo/common/configuration/global_settings.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';
import 'package:flutteronimo/common/widgets/drawer/custom_drawer_vm.dart';
import 'package:flutteronimo/common/widgets/drawer/data_model/drawer_item.dart';
import 'package:flutteronimo/gen/assets.gen.dart';
import 'package:flutteronimo/gen/colors.gen.dart';

class CustomDrawer extends StatefulWidget {
  final DrawerItem currentItem;

  const CustomDrawer({
    required this.currentItem,
    Key? key,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late CustomDrawerVm _viewModel;

  @override
  void initState() {
    _viewModel = CustomDrawerVm(currentItem: widget.currentItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorName.safeAreaDark,
      child: Column(
        children: [
          _buildUserDisplay(),
          ..._buildItemList(),
        ],
      ),
    );
  }

  Widget _buildUserDisplay() {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 60,
        color: Colors.black12,
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              "Hello!",
              style: AppTextStyle.body(),
            ),
          ],
        ),
      ),
    );
  }

  Iterable<Widget> _buildItemList() sync* {
    for (var item in DrawerItem.values) {
      if (item == DrawerItem.logout) {
        yield const Spacer();
      }
      yield _buildMenuItem(
        item: item,
      );
    }
  }

  Widget _buildMenuItem({
    required DrawerItem item,
  }) {
    if (item.requiresLogin() && !_viewModel.isUserLogged()) {
      return const SizedBox();
    }
    return InkWell(
      onTap: () => _viewModel.navigateByItem(
        item: item,
        context: context,
      ),
      child: Container(
        height: LayoutSettings.defaultMenuItemHeight,
        decoration: BoxDecoration(
            color: _viewModel.currentItem == item
                ? Colors.white12
                : Colors.transparent,
            border: const Border(bottom: BorderSide(color: Colors.white24))),
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            item.itemIcon().image(
                  height: 24,
                  width: 24,
                  color: Colors.white.withOpacity(0.9),
                ),
            const SizedBox(width: 16.0),
            Text(
              item.itemTitle(),
              style: AppTextStyle.bold()
                  .copyWith(color: Colors.white.withOpacity(0.9)),
            ),
          ],
        ),
      ),
    );
  }
}
