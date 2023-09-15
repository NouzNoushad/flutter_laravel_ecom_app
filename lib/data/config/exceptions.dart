class NetworkExceptions implements Exception {
  final String? message;
  final String? url;
  final String? prefix;

  NetworkExceptions({this.message, this.url, this.prefix});
}

class BadRequestException extends NetworkExceptions {
  BadRequestException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Bad Request');
}

class FetchDataException extends NetworkExceptions {
  FetchDataException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Unable to fetch data');
}

class ApiNotRespondingException extends NetworkExceptions {
  ApiNotRespondingException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Api not responding');
}

class UnAuthorizedException extends NetworkExceptions {
  UnAuthorizedException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Bad Request');
}
