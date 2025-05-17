import 'dart:io';

import 'package:marakzia_task/services/api/http/api_method.dart';
import 'package:marakzia_task/services/api/extensions/api_exception.dart';
import 'package:marakzia_task/services/api/http/base_service.dart';
import 'package:marakzia_task/services/api/http/either.dart';

class HttpService {
  HttpService._();

  static HttpService? _instance;

  static HttpService get instance => _instance ??= HttpService._();

  Future<Either<APIException, T?>> get<T>({
    required String url,
    required Function fromJsonMethod,
  }) async {
    final response = await BaseService.instance.apiRequest(
      url: url,
      method: ApiMethod.get,
    );
    if (response.isRight()) {
      final result = fromJsonMethod(
        response.getRight(),
      );
      return Right(
        result,
      );
    } else {
      return Left(
        response.getLeft(),
      );
    }
  }

  Future<Either<APIException, T?>> post<T>({
    required String url,
    required Function fromJsonMethod,
    required dynamic body,
  }) async {
    final response = await BaseService.instance.apiRequest(
      url: url,
      method: ApiMethod.post,
      content: body,
    );
    if (response.isRight()) {
      final result = fromJsonMethod(
        response.getRight(),
      );
      return Right(
        result,
      );
    } else {
      return Left(
        response.getLeft(),
      );
    }
  }

  Future<Either<APIException, T?>> put<T>({
    required String url,
    required Function fromJsonMethod,
    required dynamic body,
  }) async {
    final response = await BaseService.instance.apiRequest(
      url: url,
      method: ApiMethod.put,
      content: body,
    );
    if (response.isRight()) {
      final result = fromJsonMethod(
        response.getRight(),
      );
      return Right(
        result,
      );
    } else {
      return Left(
        response.getLeft(),
      );
    }
  }
}
