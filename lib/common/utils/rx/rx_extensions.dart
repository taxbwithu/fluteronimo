import 'package:rxdart/rxdart.dart';

extension RxExtension<T> on Subject<T> {
  void addSafe(T value) {
    if (isClosed) {
      return;
    }
    add(value);
  }
}
