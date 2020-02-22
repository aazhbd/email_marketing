import 'package:flutter/material.dart';
import 'package:email_marketing_flutter/utils/constants.dart' as Constants;
import 'package:url_launcher/url_launcher.dart';

class CampaignDetails extends StatefulWidget {
  //final CampaignModel campaignModel;
  final String title;
  final String description;
  final String start_date;

  CampaignDetails({this.title, this.description, this.start_date});

  @override
  _CampaignDetailsState createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campaign Details'),
        backgroundColor: Constants.banner2,
      ),
      backgroundColor: Colors.white,
      body: getDetails(),
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

  Widget getDetails() {
    var app = Center(
        child: Container(
      height: 400.0,
      width: 400.0,
      child: Card(
        elevation: 10.0,
        color: Constants.color2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left:15.0, right: 15.0),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Constants.bannerColor,
                  // decoration: TextDecoration.underline
                ),
              ),
            ),
            Padding(
             padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left:15.0, right: 15.0),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left:15.0, right: 15.0),
              child: Text(
                "Send Date: "+widget.start_date,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    ));

    return app;
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
