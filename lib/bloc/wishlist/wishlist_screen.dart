import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteronimo/bloc/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutteronimo/bloc/wishlist/bloc/wishlist_event.dart';
import 'package:flutteronimo/common/factories/components_factory.dart';
import 'package:flutteronimo/common/theme/app_decorator.dart';
import 'package:flutteronimo/common/widgets/navigation_bar/app_navigation_bar.dart';
import 'package:flutteronimo/feature/home/subscreens/deals/widgets/deal_card.dart';
import 'package:flutteronimo/gen/colors.gen.dart';
import '../../../generated/l10n.dart';
import 'bloc/wishlist_state.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistBloc()..add(WishlistLoadEvent()),
      child: const WishlistView(),
    );
  }
}

class WishlistView extends StatelessWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorName.safeAreaDark,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: AppDecorator.drawBackgroundGradient(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppNavigationBar(
                screenTitle: Texts.current.wishlist_screen_message,
                leadingButton: ComponentsFactory.createNavBarDrawerButton(),
                onLeadingTap: () =>
                    (_scaffoldKey.currentState as ScaffoldState).openDrawer(),
              ),
              Expanded(child: _buildGameList(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameList(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistStates>(
      builder: (context, state) {
        if (state is InitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UpdateState) {
          final data = state.dealList;

          if (data.isEmpty) {
            return const Center(
              child: Text('No items in your wishlist'),
            );
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return DealCard(
                dealItem: data[index],
                onTap: (dealId) => print("test"),//context.read<WishlistBloc>().add(OpenDealDetailsEvent(context: context, dealId: dealId)),
              );
            },
          );
        } else if (state is WishlistErrorState) {
          return Center(
            child: Text('Error: ${state.message}'),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
