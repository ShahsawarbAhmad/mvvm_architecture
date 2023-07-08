class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_message$_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Erro During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorisedRequest extends AppException {
  UnauthorisedRequest([String? message])
      : super(message, 'Unauthorised Request ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, 'Invalid Input Request');
}
