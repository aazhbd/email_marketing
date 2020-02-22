import 'package:flutter/material.dart';
import 'package:email_marketing_flutter/utils/constants.dart' as Constants;
import 'package:url_launcher/url_launcher.dart';

class SendNotification extends StatelessWidget {
  const SendNotification({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: Constants.banner2,
      ),
      backgroundColor: Colors.white,
      body: Container(
          color: Colors.grey.shade200,
          alignment: Alignment.center,
          child: Text(
            'Campaign Sent Successfully',
            style: TextStyle(fontSize: 20.0),
          )),
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
