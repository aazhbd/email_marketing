import 'dart:math';

import 'package:email_marketing_flutter/models/campaignmodel.dart';
import 'package:email_marketing_flutter/services/campaignrepo.dart';
import 'package:flutter/material.dart';
import 'package:email_marketing_flutter/utils/constants.dart' as Constants;

class SendCampaign extends StatefulWidget {
  SendCampaign({Key key}) : super(key: key);

  @override
  _SendCampaignState createState() => _SendCampaignState();
}

class _SendCampaignState extends State<SendCampaign> {
  List<CampaignModel> campaignModel = List<CampaignModel>();
  @override
  void initState() {
    campaignGet().then((data) {
      setState(() {});
    });
    super.initState();
  }

  Future<void> campaignGet() async {
    campaignModel = await CampaignService().getAllCampaigns();
  }

  var colors = Constants.colors;

  Color randomGenerator() {
    return colors[new Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Campaign'),
        backgroundColor: Constants.banner2,
      ),
      backgroundColor: Colors.white,
      body: getCampaigns(),
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

  ListView getCampaigns() {
    var app = ListView.builder(
        itemCount: campaignModel.length == null ? 0 : campaignModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250.0,
            child: Card(
              margin: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 30.0, right: 30.0),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: randomGenerator(),
              child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          _getTitle(campaignModel[index].name),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            color: Constants.bannerColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:20.0, left: 20.0, right: 20.0),
                        child: Text(
                            _getDesc(campaignModel[index].description),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400,
                            ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          _getDate(campaignModel[index].start_date),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                       Padding(
                         padding: const EdgeInsets.only(top: 20.0),
                         child: RaisedButton(
                              color: Constants.sendColor1,
                              onPressed: () {
                                debugPrint('Send Now pressed');
                                debugPrint(campaignModel[index].id.toString());
                                _sendCampaign(campaignModel[index].id)
                                    .then((data) {
                                  if (data == true) {
                                    Navigator.of(context).pushNamed("/send");
                                  }
                                });
                              },
                              child: Text(
                                'Send Now',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              )
                              ),
                       ),
                    ],
                  )),
            ),
          );
        });

    return app;
  }

  _getDesc(String desc){
    if(desc.length > 60) {
      return desc.substring(0, 60) + '...';
    }
    else return desc;
  }

  _getTitle(String name) {
    if (name.length > 15) {
      return name.substring(0, 14) + '...';
    } else
      return name;
  }

  _getDate(String start_date) {
    var dateString = start_date.split('-');
    var year = dateString[0];
    var day = dateString[2];
    var months = dateString[1];
    var month;
    switch (months) {
      case '01':
        month = "Jan.";
        break;
      case '02':
        month = "Feb.";
        break;
      case '03':
        month = "Mar.";
        break;
      case '04':
        month = "Apr.";
        break;
      case '05':
        month = "May";
        break;
      case '06':
        month = "June";
        break;
      case '07':
        month = "July";
        break;
      case '08':
        month = "Aug.";
        break;
      case '09':
        month = "Sept.";
        break;
      case '10':
        month = "Oct.";
        break;
      case '11':
        month = "Nov.";
        break;
      case '12':
        month = "Dec.";
        break;
    }
    var full_date = month + day + ',' + year;

    // debugPrint(dateString.toString());
    var date = 'Campaign must be sent on ' + full_date;
    return date;
  }

  Future<bool> _sendCampaign(int id) async {
    CampaignModel input = CampaignModel(id: id);
    bool result = await CampaignService().sendCampaign(input);
    return result;
  }
}

//  ListView getCampaigns() {
//   var app = ListView.builder(
//       itemCount: 5,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           height: 300.0,
//           width: 400.0,
//           padding: EdgeInsets.all(20.0),
//           alignment: Alignment.centerLeft,
//           child: Column(children: <Widget>[
//             Container(
//               color: Colors.grey.shade300,
//               height: 60.0,
//               width: 400.0,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   'Title',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.w500,
//                     color: Constants.textColor,
//                   ),
//                 ),
//               ),
//             ),
//             Container(

//               color: Colors.grey.shade200,
//               height: 200.0,
//               width: 400.0,
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       'Description',
//                       textAlign: TextAlign.left,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: Text('This campaign has to be sent on -- at --'),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(10.0),
//                   ),
//                   SizedBox(
//                     width: 120.0,
//                     child: RaisedButton(
//                       onPressed: () {
//                         debugPrint('Send Now');
//                       },
//                       child: Row(
//                         children: <Widget>[
//                           Text(
//                             'Send Now',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(color: Constants.textColor),
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios,
//                             color: Constants.textColor,
//                             size: 18.0,
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ]),
//         );
//       });
