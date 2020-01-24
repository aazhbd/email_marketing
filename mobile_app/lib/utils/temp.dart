// return Container(
          //   height: 200.0,
          //   width: 400.0,
          //   padding: EdgeInsets.all(20.0),
          //   alignment: Alignment.centerLeft,
          //   child: Column(children: <Widget>[
          //     //Campaign Name
          //     Container(
          //       color: Colors.grey.shade300,
          //       height: 60.0,
          //       width: 400.0,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.all(10.0),
          //             child: Text(
          //               _getTitle(campaignModel[index].name),
          //               textAlign: TextAlign.left,
          //               style: TextStyle(
          //                 fontSize: 20.0,
          //                 fontWeight: FontWeight.w500,
          //                 color: Constants.textColor,
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: SizedBox(
          //               width: 100.0,
          //               child: RaisedButton(
          //                   color: Constants.textColor,
          //                   // onPressed: () {
          //                   //   debugPrint('Send Now');
          //                   //   Navigator.pushNamed(context, '/send');
          //                   // },
          //                   onPressed: () {
          //                     debugPrint('Send Now pressed');
          //                     debugPrint(campaignModel[index].id.toString());
          //                     _sendCampaign(campaignModel[index].id)
          //                         .then((data) {
          //                       if (data == true) {
          //                         Navigator.of(context).pushNamed("/send");
          //                       }
          //                     });
          //                   },
          //                   child: Text(
          //                     'Send Now',
          //                     textAlign: TextAlign.center,
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 13.0,
          //                         fontWeight: FontWeight.bold),
          //                   )
          //                   // child: Row(
          //                   //   children: <Widget>[
          //                   //     Text(
          //                   //       'Send Now',
          //                   //       // textAlign: TextAlign.center,
          //                   //       style: TextStyle(
          //                   //           color: Colors.white,
          //                   //           fontSize: 14.0,
          //                   //           fontWeight: FontWeight.bold),
          //                   //     ),
          //                   //     Icon(
          //                   //       Icons.arrow_forward_ios,
          //                   //       color: Colors.white,
          //                   //       size: 18.0,
          //                   //     )
          //                   //   ],
          //                   // ),
          //                   ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     //Campaign Description
          //     Container(
          //       color: Colors.grey.shade200,
          //       height: 50.0,
          //       width: 400.0,
          //       child: Padding(
          //         padding: const EdgeInsets.all(10.0),
          //         child: Text(
          //           campaignModel[index].description,
          //           textAlign: TextAlign.left,
          //           style: TextStyle(color: Constants.textColor),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       color: Colors.grey.shade200,
          //       height: 50.0,
          //       width: 400.0,
          //       child: Padding(
          //         padding: const EdgeInsets.all(10.0),
          //         child: Text(
          //           _getDate(campaignModel[index].start_date),
          //           textAlign: TextAlign.left,
          //         ),
          //       ),
          //     ),
          //   ]),
          // );