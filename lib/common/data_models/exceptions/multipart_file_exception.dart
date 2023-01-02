
import 'general_exception.dart';

class MultipartFileException implements GeneralException {
  final String message;

  MultipartFileException({
    required this.message,
  });
}
