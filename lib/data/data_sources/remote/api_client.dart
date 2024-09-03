import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:colleage_thriver/data/data_sources/remote/apI_endpoint_urls.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/network/network_info.dart';
import '../../../routes/app_routes.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;

  ApiClient() {
    baseOptions = BaseOptions(
        receiveTimeout: Duration(seconds: 30),
        connectTimeout: Duration(seconds: 30),
        baseUrl: AppUrls.mainUrl);
    dio = Dio(baseOptions);
    dio.interceptors
        .add(PrettyDioLogger(requestBody: true, requestHeader: true));
  }

  // getRequest

  Future<Response> getRequest({required String endPoint}) async {
    var _auth = await  FirebaseAuth.instance.currentUser?.getIdToken();
    final options = Options(headers: {"Authorization": "Bearer ${_auth}"});
    print("${_auth}");
    try {
      var response = await dio.get(endPoint, options: options);
      return response;
    } on DioException catch (e) {
      return createErrorEntity(e);
    }
  }

  Future<Response> postRequest(
      {required String endPoint, required dynamic body}) async {
    var _auth = await  FirebaseAuth.instance.currentUser?.getIdToken();
    final options = Options(headers: {"Authorization": "Bearer ${_auth}"});
    try {
      var response = await dio.post(endPoint, data: body, options: options);
      return response;
    } on DioException catch (e) {
      return createErrorEntity(e);
    }
  }
}

Future<Response>  createErrorEntity(DioException error) async {
  print("${error.type}");
  print("${error.response}");
  print("${error.response}");
  switch (error.type) {
    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          print("sdfghsdfsdf");
           return error.response!;

        case 401:
          print("AppRoutes. loginScreen");
          Get.offAllNamed(AppRoutes.loginScreen);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', false);
          return error.response!;
        case 404:
          return Response(data: {
            'message': 'Url Not Found',
            "statusCode": 404,
          }, statusCode: 404, requestOptions: RequestOptions());
        case 500:
          return error.response!;
      }
      return error.response!;

    case DioExceptionType.connectionTimeout:
      return Response(data: {
        'message': 'Connection timed out',
        "statusCode": -1,
      }, statusCode: -1, requestOptions: RequestOptions());

    case DioExceptionType.sendTimeout:
      return Response(data: {
        'message': 'Send timed out',
        "statusCode": -2,
      }, statusCode: -2, requestOptions: RequestOptions());

    case DioExceptionType.receiveTimeout:
      return Response(data: {
        'message': 'Receive timed out',
        "statusCode": -3,
      }, statusCode: -3, requestOptions: RequestOptions());

    case DioExceptionType.badCertificate:
      return Response(data: {
        'message': 'Bad SSL certificates',
        "statusCode": -4,
      }, statusCode: -4, requestOptions: RequestOptions());

    case DioExceptionType.cancel:
      return Response(data: {
        'message': 'Server canceled it',
        "statusCode": -5,
      }, statusCode: -5, requestOptions: RequestOptions());

    case DioExceptionType.connectionError:
      Get.dialog(AlertDialog(
        title: Text(''),
        content: Text(
            'No Internet connection found check your connection'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back(); // Close dialog using GetX

            },
            child: Text('OK'),
          ),
        ],
      ));
      return Response(data: {
        'message': 'No Internet connection found check your connection',
        "statusCode": -6,
      }, statusCode: -6, requestOptions: RequestOptions());

    case DioExceptionType.unknown:
      return Response(data: {
        'message': 'Unknown error',
        "statusCode": -7,
      }, statusCode: -7, requestOptions: RequestOptions());

    default:
      return Response(data: {
        'message': 'Unknown error',
        "statusCode": -8,
      }, statusCode: -8, requestOptions: RequestOptions());
  }
}

Future<void> checkInternetConnectivity(NetworkInfo networkInfo) async {
  bool isConnected = await networkInfo.isConnected();
  print('Internet connected: $isConnected');
}

void listenForConnectivityChanges(NetworkInfo networkInfo) {
  networkInfo.onConnectivityChanged.listen((ConnectivityResult result) {
    print('Connectivity status changed: $result');
  });
}

Future<bool> checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}
