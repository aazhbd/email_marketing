import 'package:flutter/material.dart';
import 'package:email_marketing_flutter/utils/constants.dart' as Constants;

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
        child: Text('Campaign Sent Successfully', style: TextStyle(fontSize: 20.0),)),
      bottomNavigationBar: BottomAppBar(
        color: Constants.footerColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Testing bottom bar',
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}
