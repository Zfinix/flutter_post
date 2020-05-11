import 'dart:async';
import 'package:dio/dio.dart' as http;

import 'exceptions.dart';
import 'log.dart';

class HttpWrapper {
  Future<http.Response> get(
    String url,
    Map<String, Object> headers, {
    contentType,
    Map<String, Object> queryParameters,
  }) async {
    try {
      Log().debug('HttpWrapper.post() -> $url');
      return await http.Dio().get(
        url,
        queryParameters: queryParameters,
        options: http.Options(
            headers: headers,
            contentType: contentType ?? http.Headers.jsonContentType),
      );

      // If that call was not successful, throw an error.
      // throw Exception('Failed to load post');

    } on TimeoutException {
      throw TimeOutException();
    } catch (e) {
      print(e.toString());
      if (e is http.DioError) {
        throw e;
      }
    }
    return null;
  }

  Future<http.Response> getHeadless(
    String url, {
    Map<String, Object> queryParameters,
  }) async {
    try {
      Log().debug('HttpWrapper.post() -> $url');
      return await http.Dio().get(
        url,
        queryParameters: queryParameters,
      );

      // If that call was not successful, throw an error.
      // throw Exception('Failed to load post');

    } on TimeoutException {
      throw TimeOutException();
    } on http.DioError catch (e) {
      if (e is http.DioError) {
        throw e;
      }
    }
    return null;
  }

  Future<http.Response> post(
    String url,
    Map<String, Object> data, {
    Map<String, dynamic> headers,
    Map<String, Object> queryParameters,
  }) async {
    try {
      Log().debug('HttpWrapper.post() -> $url', data);
      return http.Dio().post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: http.Options(
            validateStatus: (status) {
              return status < 500;
            },
            headers: headers,
            contentType: http.Headers.formUrlEncodedContentType),
      );

      // If that call was not successful, throw an error.
      // throw Exception('Failed to load post');

    } on TimeoutException {
      throw TimeOutException();
    } on http.DioError catch (e) {
      if (e is http.DioError) {
        //handle DioError here by error type or by error code
      }
    }
    return null;
  }

  Future<http.Response> put(
    String url,
    Map<String, Object> data, {
    Map<String, dynamic> headers,
    Map<String, Object> queryParameters,
  }) async {
    try {
      Log().debug('HttpWrapper.put() -> $url', data);
      return http.Dio().put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: http.Options(
            validateStatus: (status) {
              return status < 500;
            },
            headers: headers,
            contentType: http.Headers.formUrlEncodedContentType),
      );

      // If that call was not successful, throw an error.
      // throw Exception('Failed to load post');

    } on TimeoutException {
      throw TimeOutException();
    } on http.DioError catch (e) {
      if (e is http.DioError) {
        //handle DioError here by error type or by error code
      }
    }
    return null;
  }

  Future<http.Response> patch(
    String url,
    Map<String, Object> data, {
    Map<String, dynamic> headers,
    Map<String, Object> queryParameters,
  }) async {
    try {
      Log().debug('HttpWrapper.patch() -> $url', data);
      return http.Dio().put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: http.Options(
            validateStatus: (status) {
              return status < 500;
            },
            headers: headers,
            contentType: http.Headers.formUrlEncodedContentType),
      );

      // If that call was not successful, throw an error.
      // throw Exception('Failed to load post');

    } on TimeoutException {
      throw TimeOutException();
    } on http.DioError catch (e) {
      if (e is http.DioError) {
        //handle DioError here by error type or by error code
      }
    }
    return null;
  }

  Future<http.Response> delete(
    String url,
    Map<String, Object> data, {
    Map<String, dynamic> headers,
    Map<String, Object> queryParameters,
  }) async {
    try {
      Log().debug('HttpWrapper.delete() -> $url', data);
      return http.Dio().delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: http.Options(
            validateStatus: (status) {
              return status < 500;
            },
            headers: headers,
            contentType: http.Headers.formUrlEncodedContentType),
      );

      // If that call was not successful, throw an error.
      // throw Exception('Failed to load post');

    } on TimeoutException {
      throw TimeOutException();
    } on http.DioError catch (e) {
      if (e is http.DioError) {
        //handle DioError here by error type or by error code
      }
    }
    return null;
  }
}
