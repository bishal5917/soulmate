class ApiException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  ApiException([this.message, this.prefix, this.url]);
}

class NotLoggedInException extends ApiException {
  @override
  final String? message;

  NotLoggedInException(this.message);
}

class BadRequestException extends ApiException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url);
}

class FetchDataException extends ApiException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends ApiException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responded in time', url);
}

class UnAuthorizedException extends ApiException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorized request', url);
}
