import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutteronimo/common/app_router/app_router.gr.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';
import 'package:flutteronimo/common/widgets/bottom_bar/bottom_bar_items.dart';
import 'package:flutteronimo/gen/assets.gen.dart';
import 'package:flutteronimo/gen/colors.gen.dart';
import 'package:flutteronimo/generated/l10n.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Texts _texts;

  @override
  void initState() {
    _texts = Texts.current;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: BottomBarItems.values.map((item) => item.getPath()).toList(),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.white, width: 1.0),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                setState(() {
                  tabsRouter.setActiveIndex(index);
                });
              },
              items: BottomBarItems.values
                  .map(
                    (item) => _buildBottomBarItem(
                      label: item.itemLabel(texts: _texts),
                      imagePath: item.itemSvgPath(),
                    ),
                  )
                  .toList(),
              backgroundColor: ColorName.primaryDark,
              unselectedLabelStyle: AppTextStyle.caption3(),
              selectedLabelStyle:
                  AppTextStyle.caption3Bold(color: ColorName.electricBlue),
              selectedItemColor: ColorName.electricBlue,
              unselectedItemColor: ColorName.white,
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomBarItem({
    required String label,
    required String imagePath,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        imagePath,
        colorFilter: const ColorFilter.mode(ColorName.white, BlendMode.srcIn),
      ),
      label: label,
      activeIcon: SvgPicture.asset(
        imagePath,
        colorFilter:
            const ColorFilter.mode(ColorName.electricBlue, BlendMode.srcIn),
      ),
    );
  }
}
