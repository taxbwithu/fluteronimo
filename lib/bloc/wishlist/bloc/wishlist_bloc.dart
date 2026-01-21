import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteronimo/bloc/wishlist/bloc/wishlist_event.dart';
import 'package:flutteronimo/bloc/wishlist/bloc/wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvents, WishlistStates> {
  int counter = 0;

  WishlistBloc() : super(InitialState()) {
    on<WishlistLoadEvent>(onWishlistLoad);
    on<WishlistClickEvent>(onWishlistClick);
  }

  void onWishlistLoad(
      WishlistLoadEvent event, Emitter<WishlistStates> emit) async {
    counter = counter + 1;
    emit(UpdateState(counter));
  }

  void onWishlistClick(
      WishlistClickEvent event, Emitter<WishlistStates> emit) async {
    counter = counter - 1;
    emit(UpdateState(counter));
  }
}