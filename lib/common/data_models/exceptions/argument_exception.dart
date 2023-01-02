import 'general_exception.dart';

class ArgumentException extends GeneralException {
  final String? message;

  ArgumentException(this.message);
}
