import 'package:email_marketing_flutter/screens/login.dart';
import 'package:email_marketing_flutter/screens/sendcampaign.dart';
import 'package:email_marketing_flutter/screens/sendnotification.dart';
import 'package:email_marketing_flutter/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:email_marketing_flutter/utils/constants.dart' as Constants;

void main(){
  var app = MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Email Marketing App",
    //home: Login(),
    //home: SendCampaign(),
    home: Welcome(),
    theme: ThemeData(
      primaryColor: Constants.banner2,
      accentColor: Constants.banner2,
     // buttonColor: Constants.buttonColor,
      cursorColor: Constants.banner2,
    ),
    routes:{
      "/campaigns": (BuildContext context) => SendCampaign(),
      "/send": (BuildContext context) => SendNotification(),
    }


  );

  runApp(app);
}