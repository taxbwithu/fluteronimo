import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/common/app_router/app_router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        DealsRoute(),
        WishlistRoute(),
      ],
      builder: (context, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.computer),
                label: "wishlist",
              ),
            ],
          ),
        );
      },
    );
  }
}
