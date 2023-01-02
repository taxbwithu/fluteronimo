import '../webservice/webservice_error.dart';
import '../webservice/webservice_error_item.dart';
import 'general_exception.dart';

class WebserviceException extends GeneralException {
  final String? message;
  final List<WebserviceErrorItem> errors;
  final int? httpCode;
  final String? errorCode;

  WebserviceException({
    required WebserviceError error,
    this.httpCode,
  })  : message = error.message,
        errors = error.errors,
        errorCode = error.errorCode;

  String get printToString =>
      "Message: $message\nHttpCode: $httpCode\nErrorCode: $errorCode";
}
