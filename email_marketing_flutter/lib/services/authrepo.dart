import 'dart:convert' as convert;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:email_marketing_flutter/models/authmodel.dart';
import 'package:email_marketing_flutter/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class AuthRepository {
  Future<bool> authUser(AuthModel input);
}

class AuthServices extends AuthRepository {
  @override
  Future<bool> authUser(AuthModel input) async {
    bool result = false;
    String url = authUrl;
    var dio = Dio();
    FormData formData = new FormData.fromMap(
        {"username": input.username, "password": input.password});
    
    try {
      // var response = await http.post(baseurl,
      //     body: convert.jsonEncode(input),
      //     headers: {HttpHeaders.contentTypeHeader: "application/json"});
      var response = await dio.post(url, data: formData);
              // options: Options(
              //   contentType: ContentType.json.value,
              //     followRedirects: false,
              //     validateStatus: (status) {
              //       return status < 500;
              //     }));
      if (response.statusCode == 302) {
        var jsonBody = response.data;
        //var output = convert.jsonDecode(jsonBody);
        var output = jsonBody["message"];
        if (output == "login was successful") {
          result = true;
        }
      }
    } on DioError catch (error) {
        debugPrint(error.error.toString());
    }
      return result;
    }
}

