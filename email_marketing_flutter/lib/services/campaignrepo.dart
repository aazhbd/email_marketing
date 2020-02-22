import 'dart:io';
import 'package:dio/dio.dart';
import 'package:email_marketing_flutter/models/campaignmodel.dart';
import 'package:email_marketing_flutter/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class CampaignRepository {
  Future<List<CampaignModel>> getAllCampaigns();
  Future<bool> sendCampaign(CampaignModel input);
}

class CampaignService extends CampaignRepository {
  String url = sendCampaignUrl;
  var dio = Dio();
  @override
  Future<List<CampaignModel>> getAllCampaigns() async {
    List<CampaignModel> campaignModels = List<CampaignModel>();
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonBody = convert.jsonDecode(response.body);
        List<dynamic> output = jsonBody;
        if (output != null) {
          output.forEach((e) {
            campaignModels.add(CampaignModel.fromJson(e));
          });
        }
      }
    } catch (e) {
      debugPrint(e);
    }

    return campaignModels;
  }

  @override
  Future<bool> sendCampaign(CampaignModel input) async {
    bool result = false;
    String url = sendUrl;
   // var jsoninput = convert.jsonEncode(input);
    try {
      // var response = await http.post(url,
      //                     body: jsoninput,
      //                     headers: {HttpHeaders.contentTypeHeader: "application/json"});

      FormData formData = new FormData.fromMap({
        "campaign_id": input.id,
      });
//response = await dio.post("/info", data: formData);
      var response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        var jsonBody = response.data;
        var output = jsonBody["message"];
        if (output == "Campaign sent successfully.") {
          result = true;
        }
      }
    } catch (e) {
      debugPrint(e);
    }

    return result;
  }
}
