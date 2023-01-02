
import 'general_exception.dart';

class MessageException extends GeneralException {
  final String text;

  MessageException({
    required this.text,
  });
}
