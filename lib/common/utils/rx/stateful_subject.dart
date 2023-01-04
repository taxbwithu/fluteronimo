import 'package:flutteronimo/common/utils/rx/rx_extensions.dart';
import 'package:rxdart/rxdart.dart';

class StatefulSubject<T> {
  final BehaviorSubject<T> _subject;

  StatefulSubject({
    required T value,
  }) : _subject = BehaviorSubject.seeded(value);

  void dispose() {
    _subject.close();
  }

  void push(T event) {
    _subject.addSafe(event);
  }

  T get state => _subject.value;

  ValueStream<T> get stream => _subject;
}
