class Failure implements Exception {
  final String message;
  final int? code;
  final bool isLogout;
  final bool askVerify;
  final Exception? exception;

  Failure({required this.message, this.code, this.isLogout = false, this.askVerify = false, this.exception});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Failure &&
      other.message == message &&
      other.code == code &&
      other.isLogout == isLogout &&
      other.askVerify == askVerify &&
      other.exception == exception;
  }

  @override
  int get hashCode {
    return message.hashCode ^
      code.hashCode ^
      isLogout.hashCode ^
      askVerify.hashCode ^
      exception.hashCode;
  }

  @override
  String toString() {
    return 'Failure(message: $message, code: $code, isLogout: $isLogout, askVerify: $askVerify, exception: $exception)';
  }
}
