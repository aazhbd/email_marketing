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
    FormData formData = new FormData.fromMap({
        "username": input.username,
        "password": input.password
      });
    var params = {
      "next" : "/api/"
    };

   // var url = Uri.parse(authUrl);
   // url = url.replace(queryParameters: params);
    url = Uri.encodeFull(url);
    url = Uri.decodeFull(url);
    try {
      // var response = await http.post(baseurl,
      //     body: convert.jsonEncode(input),
      //     headers: {HttpHeaders.contentTypeHeader: "application/json"});
      var response = await dio.post(url, 
                                    data: formData);
      if (response.statusCode == 200) {
        var jsonBody = response.data;
        //var output = convert.jsonDecode(jsonBody);
        var output = jsonBody["campaigns"];
        if (output == sendCampaignUrl) {
          result = true;
        }
      }
    } catch (e) {
      debugPrint(e);
    }
    return result;
  }
}
