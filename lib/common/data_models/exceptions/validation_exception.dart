import 'general_exception.dart';

class ValidationException extends GeneralException {
  final Map<String, String> fieldErrors;

  ValidationException({
    required this.fieldErrors,
  });
}
