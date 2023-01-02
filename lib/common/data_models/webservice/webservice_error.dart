import 'webservice_error_item.dart';

class WebserviceError {
  final String? errorCode;
  final String? message;
  final String? debugMessage;
  final List<WebserviceErrorItem> errors;

  WebserviceError({
    required this.errorCode,
    required this.message,
    required this.debugMessage,
    required this.errors,
  });

  factory WebserviceError.fromJson(Map<String, dynamic> json) {
    final jsonErrors = json["errors"] as List<dynamic>?;

    final errors = jsonErrors?.map((dynamic item) {
      final errorItem = item as Map<String, dynamic>;
      return WebserviceErrorItem.fromJson(errorItem);
    }).toList() ?? [];

    return WebserviceError(
      errorCode: json["errorCode"] as String?,
      message: json["message"] as String?,
      debugMessage: json["debugMessage"] as String?,
      errors: errors,
    );
  }
}
