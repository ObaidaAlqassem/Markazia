import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:marakzia_task/model/products_model.dart';
import 'package:marakzia_task/services/api/apt_path.dart';
import 'package:marakzia_task/services/api/extensions/api_exception.dart';
import 'package:marakzia_task/services/api/http/api_method.dart';
import 'package:marakzia_task/services/api/http/either.dart';

class BaseService {
  BaseService._();

  static BaseService? _instance;

  static BaseService get instance => _instance ??= BaseService._();

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(
          milliseconds: 60000,
        ),
        // 60 secs\
        receiveTimeout: const Duration(
          milliseconds: 60000,
        ),
        // 60 secs
        sendTimeout: const Duration(
          milliseconds: 60000,
        ),
        // 60 secs
        contentType: 'application/json',
      ),
    );
    return dio;
  }

  var dio = createDio();

  void _setLog({
    required ApiMethod method,
    required Response<dynamic> response,
    dynamic content,
  }) {
    var message = '';

    if (method == ApiMethod.post || method == ApiMethod.put) {
      message = '''
          Url: ${response.realUri.toString()}
          Status code: ${response.statusCode}
          Headers: ${response.requestOptions.headers}
          Request: ${jsonEncode(content)}
          Response: ${response.toString()}
        ''';
    } else {
      message = '''
          Url: ${response.realUri.toString()}
          Status code: ${response.statusCode}
          Headers: ${response.requestOptions.headers}
          Response: ${response.toString()}
        ''';
    }
    log(message);
  }

  Future<Either<APIException, JSON?>> apiRequest({
    required String url,
    required ApiMethod method,
    JSON? queries,
    dynamic content,
    Options? options,
    bool isRefreshToken = false,
    CancelToken? cancelToken,
  }) async {
    Response<dynamic>? response;
    dio = createDio();
    try {
      final baseOptions = dio.options;
      baseOptions.baseUrl = APIPath.baseURL;
      dio.options = baseOptions;
      switch (method) {
        case ApiMethod.get:
          response = await dio.get(
            url,
            queryParameters: queries,
            options: options,
            cancelToken: cancelToken,
          );
          break;
        case ApiMethod.delete:
          response = await dio.delete(
            url,
            queryParameters: queries,
            options: options,
          );
          break;
        case ApiMethod.post:
          response = await dio.post(
            url,
            data: content,
            queryParameters: queries,
            options: options,
          );
          break;
        case ApiMethod.put:
          response = await dio.put(
            url,
            data: content,
            queryParameters: queries,
            options: options,
          );
          break;
        case ApiMethod.patch:
          response = await dio.patch(
            url,
            data: content,
            queryParameters: queries,
            options: options,
          );
          break;
      }
      if (response.statusCode! >= 200 && response.statusCode! <= 205) {
        if (response.data is String?) {
          return const Right(
            <String, dynamic>{},
          );
        } else {
          return Right(
            response.data as JSON,
          );
        }
      } else {
        return Left(
          OnFail(
            message: '',
          ),
        );
      }
    } on DioException catch (exception) {
      response = exception.response;
      if (kDebugMode) {
        if (response != null) {
          _setLog(
            method: method,
            response: response,
            content: content,
          );
        }
      }
      switch (response?.statusCode) {
        case 400:
          return Left(
            On400(
              message: await getErrorMessage(
                url: url,
                errorMessage: 'error_code_page_400',
              ),
              flag: response?.statusCode ?? 400,
              body: queries.toString(),
            ),
          );
        case 401:
          return Left(
            On401(
              message: await getErrorMessage(
                url: url,
                errorMessage: 'error_code_page_401',
              ),
            ),
          );
        case 403:
          return Left(
            OnFail(
              message: await getErrorMessage(
                url: url,
                errorMessage: 'error_code_page_403',
              ),
            ),
          );
        case 404:
          return Left(
            OnFail(
              message: await getErrorMessage(
                url: url,
                errorMessage: 'error_code_page_404',
              ),
            ),
          );
        case 413:
          return Left(
            OnFail(
              message: await getErrorMessage(
                url: url,
                errorMessage: 'error_code_page_413',
              ),
            ),
          );
        case 500:
          return Left(
            OnFail(
              message: await getErrorMessage(
                url: url,
                errorMessage: 'error_code_page_500',
              ),
              flag: 500,
            ),
          );
        case 503:
          return Left(
            OnFail(
              message: await getErrorMessage(
                url: url,
                errorMessage: 'error_code_page_503',
              ),
              flag: 503,
            ),
          );
        default:
          return Left(
            OnFail(
              message: await getErrorMessage(
                url: url,
                errorMessage: 'Code ${response?.statusCode}',
              ),
            ),
          );
      }
    }
  }

  Future<String> getErrorMessage({
    required String url,
    required String errorMessage,
  }) async {
    if (kDebugMode) {
      return '$url\n$errorMessage';
    } else {
      return errorMessage;
    }
  }
}
