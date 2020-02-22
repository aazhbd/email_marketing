import 'package:flutter/material.dart';
import 'package:email_marketing_flutter/utils/constants.dart' as Constants;
import 'package:url_launcher/url_launcher.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HS Fulda Email Marketing"),
          backgroundColor: Constants.banner2,
        ),
        body: Center(
          child: Container(
            height: 300.0,
            width: 300.0,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/campaigns');
              },
              child: Text(
                "Welcome to HS Fulda Email Marketing",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Constants.bannerColor,
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
        color: Constants.footerColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              _launchURL();
            },
            child: Text(
              'Developed by: © 2019 Abdullah Al Zakir Hossain, Syeda Tasneem Rumy, Lakshmi Ramesh, Sheila Adjei',
              textAlign: TextAlign.center,
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ),
      ),
        );
  }
  Future<void> _launchURL() async {
    const url =
        'https://github.com/aazhbd/email_marketing/blob/master/specs.md';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
