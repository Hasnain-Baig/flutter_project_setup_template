import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../components/toast/custom_toast.dart';

class Api {
  late Dio _dio;

  Api() {
    _dio = Dio(
      BaseOptions(
        baseUrl: dotenv.get('CORE_SERVICE_URL'),
        headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json',
        },
      ),
    );
    _dio.interceptors.add(ApiInterceptor());
    _dio.interceptors.add(RetryOnConnectionChangeInterceptor(dio: _dio));
  }

  Dio get dio => _dio;
}

class ApiInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('${err.response}, ${err.message}');

    if (err.response?.statusCode == 400) {
    } else if (err.response?.statusCode == 401) {
      // AppProvider.isAuthenticated = false;
      // ParentProvider.parent = null;
      // UserToken.logout();

      debugPrint("401 here");
      // showCupertinoModalPopup<void>(
      //   context: routerContext!,
      //   barrierDismissible: false,
      //   builder: (context) {
      //     return CupertinoAlert(
      //       header: "log_out".tr(),
      //       content: "unauthenticated_msg".tr(),
      //       defaultBtnText: "cancel".tr(),
      //       destructiveBtnText: "logout".tr(),
      //       destructiveBtn: () async {
      //         try {
      //           // AppProvider.isAuthenticated = false;
      //           // ParentProvider.parent = null;
      //           // UserToken.logout();

      //           // router.go(ROUTES.signIn.toPath);
      //         } catch (e) {
      //           // log(e.toString());
      //         }
      //       },
      //     );
      //   },
      // );
    } else if (err.response?.statusCode == 404) {
      log(err.response!.data['message']);
    } else if (err.response?.statusCode == 500) {
      log('Server Error');
      customToast(msg: "Server Error", isFailed: true);
    }
    return handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final token = await UserToken.getUserToken();
    // options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    // options.headers[HttpHeaders.authorizationHeader] = '';
    // final devceId = await StoreDeviceId.getDeviceId();
    // final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // log(options.path);
    // if (token != null && token.isNotEmpty) {
    //   // && (options.path == 'update-profile' || options.path == 'documents' || options.path == 'profile/properties/saved' || options.path == '')) {
    //   options.headers['X-Auth-Token'] = token;
    // }
    // options.headers['X-App-Version'] = packageInfo.version;
    // options.headers['X-Device-Id'] = devceId;
    // log("headers: ${options.headers}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      // showCupertinoModalPopup<void>(
      //   context: routerContext!,
      //   builder: (context) {
      //     return CupertinoAlert(
      //       header: "log_out".tr(),
      //       content: "log_out_msg".tr(),
      //       defaultBtnText: "cancel".tr(),
      //       destructiveBtnText: "logout".tr(),
      //       destructiveBtn: () async {
      //         try {
      //           AppProvider.isAuthenticated = false;
      //           ParentProvider.parent = null;
      //           UserToken.logout();

      //           router.go(ROUTES.signIn.toPath);
      //         } catch (e) {
      //           // log(e.toString());
      //         }
      //       },
      //     );
      //   },
      // );
    }
    return handler.next(response);
  }
}

/// Retrier
class DioHttpRequestRetrier {
  final Dio dio;

  DioHttpRequestRetrier({
    required this.dio,
  });

  Future<Response> requestRetry(RequestOptions requestOptions) async {
    return dio.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        contentType: requestOptions.contentType,
        headers: requestOptions.headers,
        sendTimeout: requestOptions.sendTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
        extra: requestOptions.extra,
        followRedirects: requestOptions.followRedirects,
        listFormat: requestOptions.listFormat,
        maxRedirects: requestOptions.maxRedirects,
        method: requestOptions.method,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        responseType: requestOptions.responseType,
        validateStatus: requestOptions.validateStatus,
      ),
    );
  }
}

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final Dio dio;

  RetryOnConnectionChangeInterceptor({
    required this.dio,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (shouldRetryOnHttpException(err)) {
      try {
        handler.resolve(await DioHttpRequestRetrier(dio: dio)
            .requestRetry(err.requestOptions)
            .catchError((e) {
          handler.next(err);
          return e;
        }));
      } catch (e) {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  bool shouldRetryOnHttpException(DioException err) {
    return err.type == DioExceptionType.unknown &&
        err.message != null &&
        ((err.error is HttpException &&
            err.message!.contains(
                'Connection closed before full header was received')));
  }
}
