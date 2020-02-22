import 'package:email_marketing_flutter/models/authmodel.dart';
import 'package:email_marketing_flutter/services/authrepo.dart';
import 'package:flutter/material.dart';
import 'package:email_marketing_flutter/utils/constants.dart' as Constants;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _showPassword = false;
    return Scaffold(
      appBar: AppBar(
        // title: Text('HS Fulda Email Marketing'),
        backgroundColor: Constants.banner2,
      ),
     // backgroundColor: Colors.grey.shade300,
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 80.0,
                  color: Constants.banner2,
                  margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Image.asset(
                          "images/logo.png",
                          height: 40.0,
                          width: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'HS Fulda Email Marketing',
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                //   ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                ),
                Container(
                  //color: Colors.grey.shade300,
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          controller: usernameController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter Valid Username';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'Enter Username',
                              errorStyle: TextStyle(color: Colors.black)),
                          textAlign: TextAlign.start,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter Valid Password';
                            }
                          },
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              errorStyle: TextStyle(color: Colors.black)),
                          textAlign: TextAlign.start,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                      ),
                      RaisedButton(
                        onPressed: () {
                          {
                            // debugPrint(usernameController.text);
                            // if (_formKey.currentState.validate()) {
                            //   checkUser(usernameController.text,
                            //           passwordController.text)
                            //       .then((data) {
                            //     if (data == true) {
                            //       Navigator.of(context).pushNamed("/send");
                            //     }
                            //   });
                            // }
                            debugPrint('Login Pressed');
                          Navigator.pushNamed(context, '/campaigns');
                         // }
                          }
                        },
                        
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Constants.buttonColor,
                      ),
                      // Padding(
                      //     padding: EdgeInsets.all(0.0),
                      //     child: Container(
                      //       height: 340.0,
                      //       color: Color(0xFF24333A),
                      //       //margin: EdgeInsets.all(20.0),
                      //     ))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool> checkUser(String username, String password) async {
    AuthModel input = AuthModel(username: username, password: password);
    bool result = await AuthServices().authUser(input);
    return result;
  }
}
