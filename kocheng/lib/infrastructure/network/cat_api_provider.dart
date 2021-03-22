import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'custom_exception.dart';

class ApiProvider {
  final String _baseUrl = 'https://api.thecatapi.com/v1';
  final String _apiKey = '55f1df77-4498-4324-a23f-8eab52b47b2d';

  Map<String, String> get _headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "x-api-key": "$_apiKey",
  };

  Map<String, String> get _query => {
    "category_ids": "5",
    "limit": "5",
    "page": "1",
  };

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final queryString = Uri(queryParameters: _query).query;
      final path = _baseUrl + url + '?' + queryString;
      print(path);
      final response = await http.get(path, headers: _headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}