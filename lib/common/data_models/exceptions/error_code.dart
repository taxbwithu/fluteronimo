enum ErrorCode { userNotActive }

extension Message on ErrorCode {
  String get message {
    switch (this) {
      case ErrorCode.userNotActive:
        return "user_not_active";
    }
  }
}
