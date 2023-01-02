class WebserviceErrorItem {
  final String? errorType;
  final String? message;
  final String? fieldName;

  WebserviceErrorItem({
    required this.errorType,
    required this.message,
    required this.fieldName,
  });

  factory WebserviceErrorItem.fromJson(Map<String, dynamic> json) {
    return WebserviceErrorItem(
      errorType: json["errorType"] as String?,
      message: json["message"] as String?,
      fieldName: json["fieldName"] as String?,
    );
  }
}
