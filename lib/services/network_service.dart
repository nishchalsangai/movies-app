import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:movies_app/core/helpers/constants.dart';



class NetworkService {
  static Future<http.Response> get({required String url}) async {
    try {
      // final String token = SecureStorage.accessToken ?? '';
      //Headers
      Map<String, String> headers = {};
      headers['Accept'] = "application/json";
      headers['Content-Type'] = "application/json";
      // headers['Connection'] = "keep-alive";
      // headers['Authorization'] = token;
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      Constants.logger.i(
        'REQ Headers: $headers\n'
        'RES Headers: ${response.request?.headers}\n'
        'REQUEST\n >> ${response.request}\n'
        'STATUS\n >> ${response.statusCode}\n'
        'BODY\n >> ${response.body}',
      );

      return response;
    } catch (e, stack) {
      Logger().e(
        'Error on \n >> $url  $stack',
      );
      rethrow;
    }
  }

  static Future<http.Response> post(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      // final String token = SecureStorage.accessToken ?? '';
      //Headers
      Map<String, String> headers = {};
      headers['Accept'] = "application/json";
      headers['Content-Type'] = "application/json";
      // headers['Connection'] = "keep-alive";
      // headers['Authorization'] = token;
      // headers['Access-Control-Allow-Origin'] = '*';

      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      Constants.logger.i(
        'REQ Headers: $headers\n'
        'RES Headers: ${response.request?.headers}\n'
        'REQ BODY: $body\n'
        'REQUEST\n >> ${response.request}\n'
        'STATUS\n >> ${response.statusCode}\n'
        'BODY\n >> ${response.body}',
      );
      // ;
      return response;
    } catch (e, stack) {
      Logger().e(
        'Error on \n >> $url  $stack',
      );
      rethrow;
      // throw Exception('---FAILED TO POST---');
    }
  }

  static Future<http.Response> patch(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      // final String token = SecureStorage.accessToken ?? '';
      //Headers
      Map<String, String> headers = {};
      headers['Accept'] = "application/json";
      headers['Content-Type'] = "application/json";
      // headers['Connection'] = "keep-alive";
      // headers['Authorization'] = token;

      http.Response response = await http.patch(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      Constants.logger.i(
        'REQ Headers: $headers\n'
        'RES Headers: ${response.request?.headers}\n'
        'REQ BODY: $body\n'
        'REQUEST\n >> ${response.request}\n'
        'STATUS\n >> ${response.statusCode}\n'
        'BODY\n >> ${response.body}',
      );
      // ;
      return response;
    } catch (e, stack) {
      Logger().e(
        'Error on \n >> $url  $stack',
      );
      rethrow;
      // throw Exception('---FAILED TO POST---');
    }
  }

  static Future<http.Response> put(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      // final String token = SecureStorage.accessToken ?? '';
      //Headers
      Map<String, String> headers = {};
      headers['Accept'] = "application/json";
      headers['Content-Type'] = "application/json";
      // headers['Connection'] = "keep-alive";
      // headers['Authorization'] = token;

      http.Response response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      Logger().i(
        'REQ Headers: $headers\n'
        'RES Headers: ${response.request?.headers}\n'
        'REQ BODY: $body\n'
        'REQUEST\n >> ${response.request}\n'
        'STATUS\n >> ${response.statusCode}\n'
        'BODY\n >> ${response.body}',
      );
      // ;
      return response;
    } catch (e, stack) {
      Constants.logger.e(
        'Error on \n >> $url  $stack',
      );
      rethrow;
    }
  }

  static Future<http.Response> delete({required String url}) async {
    try {
      // final String token = SecureStorage.accessToken ?? '';
      //Headers
      Map<String, String> headers = {};
      headers['Accept'] = "application/json";
      headers['Content-Type'] = "application/json";
      // headers['Connection'] = "keep-alive";
      // headers['Authorization'] = token;

      http.Response response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );
      Logger().i(
        'REQ Headers: $headers\n'
        'RES Headers: ${response.request?.headers}\n'
        'REQUEST\n >> ${response.request}\n'
        'STATUS\n >> ${response.statusCode}\n'
        'BODY\n >> ${response.body}',
      );
      return response;
    } catch (e, stack) {
      Constants.logger.e(
        'Error on \n >> $url  $stack',
      );
      rethrow;
    }
  }

  static final client = http.Client();
}
