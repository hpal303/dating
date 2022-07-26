import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hookup4u/Screens/SexualOrientation.dart';
import 'package:hookup4u/Screens/UserName.dart';
import 'package:hookup4u/util/color.dart';
import 'package:hookup4u/util/snackbar.dart';
import 'package:easy_localization/easy_localization.dart';

class LookingFor extends StatefulWidget {
  final Map<String, dynamic> userData;
  LookingFor(this.userData);

  @override
  _LookingForState createState() => _LookingForState();
}

class _LookingForState extends State<LookingFor> {
  bool dating = false;
  bool marriage = false;
  bool friendship = false;
  bool select = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButton: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 50),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: FloatingActionButton(
            elevation: 10,
            child: IconButton(
              color: secondryColor,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white38,
            onPressed: () {
              dispose();
              Navigator.pop(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: <Widget>[
          Padding(
            child: Text(
              "I am looking for".tr().toString(),
              style: TextStyle(fontSize: 40),
            ),
            padding: EdgeInsets.only(left: 50, top: 120),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  highlightedBorderColor: primaryColor,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .065,
                    width: MediaQuery.of(context).size.width * .75,
                    child: Center(
                        child: Text("DATING".tr().toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: dating ? primaryColor : secondryColor,
                                fontWeight: FontWeight.bold))),
                  ),
                  borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: dating ? primaryColor : secondryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    setState(() {
                      marriage = false;
                      dating = true;
                      friendship = false;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlineButton(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .065,
                      width: MediaQuery.of(context).size.width * .75,
                      child: Center(
                          child: Text("MARRIAGE".tr().toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: marriage ? primaryColor : secondryColor,
                                  fontWeight: FontWeight.bold))),
                    ),
                    borderSide: BorderSide(
                      color: marriage ? primaryColor : secondryColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      setState(() {
                        marriage = true;
                        dating = false;
                        friendship = false;
                      });
                      // Navigator.push(
                      //     context, CupertinoPageRoute(builder: (context) => OTP()));
                    },
                  ),
                ),
                OutlineButton(
                  focusColor: primaryColor,
                  highlightedBorderColor: primaryColor,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .065,
                    width: MediaQuery.of(context).size.width * .75,
                    child: Center(
                        child: Text("FRIENDSHIP".tr().toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: friendship ? primaryColor : secondryColor,
                                fontWeight: FontWeight.bold))),
                  ),
                  borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: friendship ? primaryColor : secondryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    setState(() {
                      marriage = false;
                      dating = false;
                      friendship = true;
                    });
                    // Navigator.push(
                    //     context, CupertinoPageRoute(builder: (context) => OTP()));
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0, left: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: Checkbox(
                  activeColor: primaryColor,
                  value: select,
                  onChanged: (newValue) {
                    setState(() {
                      select = newValue!;
                    });
                  },
                ),
                title: Text("Show my LookingFor on my profile".tr().toString()),
              ),
            ),
          ),
          dating || marriage || friendship
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    primaryColor.withOpacity(.5),
                                    primaryColor.withOpacity(.8),
                                    primaryColor,
                                    primaryColor
                                  ])),
                          height: MediaQuery.of(context).size.height * .065,
                          width: MediaQuery.of(context).size.width * .75,
                          child: Center(
                              child: Text(
                            "CONTINUE".tr().toString(),
                            style: TextStyle(
                                fontSize: 15,
                                color: textColor,
                                fontWeight: FontWeight.bold),
                          ))),
                      onTap: () {
                        var userLookingFor;
                        if (dating) {
                          userLookingFor = {
                            'userLookingFor': "dating",
                            'showOnProfile': select
                          };
                        } else if (marriage) {
                          userLookingFor = {
                            'userLookingFor': "marriage",
                            'showOnProfile': select
                          };
                        } else {
                          userLookingFor = {
                            'userLookingFor': "friendship",
                            'showOnProfile': select
                          };
                        }
                        widget.userData.addAll(userLookingFor);
                        // print(userData['userLookingFor']['showOnProfile']);
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    SexualOrientation(widget.userData)));
                        //      ads.disable(ad1);
                      },
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: MediaQuery.of(context).size.height * .065,
                          width: MediaQuery.of(context).size.width * .75,
                          child: Center(
                              child: Text(
                            "CONTINUE".tr().toString(),
                            style: TextStyle(
                                fontSize: 15,
                                color: secondryColor,
                                fontWeight: FontWeight.bold),
                          ))),
                      onTap: () {
                        CustomSnackbar.snackbar(
                            "Please select one".tr().toString(), _scaffoldKey);
                      },
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
