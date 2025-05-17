import 'dart:convert';

abstract class APIException implements Exception {
  int flag;
  String message;

  APIException({required this.message, this.flag = -1});
}

class WrongOAuth extends APIException {
  WrongOAuth({required String message, int flag = -1})
      : super(
          message: message,
          flag: flag,
        );
}

class OnFail extends APIException {
  OnFail({
    required String message,
    int flag = -1,
  }) : super(
          message: message,
          flag: flag,
        );
}

class On400 extends OnFail {
  String body;

  dynamic get jsonBody => jsonDecode(
        body,
      );

  On400({
    required String message,
    required this.body,
    int flag = -1,
  }) : super(
          message: message,
          flag: flag,
        );
}

class On401 extends OnFail {
  On401({
    required String message,
    int flag = -1,
  }) : super(
          message: message,
          flag: flag,
        );
}

class OnCancelRequest extends OnFail {
  OnCancelRequest({
    required String message,
    int flag = 0,
  }) : super(
          message: message,
          flag: flag,
        );
}
