// ignore_for_file: deprecated_member_use

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:relative_scale/relative_scale.dart';

class AndroidButtonsWidget extends StatefulWidget {
  @override
  _AndroidButtonsWidgetState createState() => _AndroidButtonsWidgetState();
}

class _AndroidButtonsWidgetState extends State<AndroidButtonsWidget> {
  // var navigationService = locator<NavigationService>();
  var isLoadingProgress = false;
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: sx(150),
                height: sy(35),
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.white,
                  focusElevation: 0,
                  padding: EdgeInsets.only(
                    top: sy(10),
                    bottom: sy(10),
                    // left: sx(30),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: sy(5),
                    ),
                    child: new Text(
                      "Facebook",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: sy(9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onPressed: () async {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Theme.of(context).accentColor,
                      width: 1,
                    ),
                  ),
                ),
              ),
              // Spacer(),
              SizedBox(
                width: sx(150),
                height: sy(35),
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    top: sy(10),
                    bottom: sy(10),
                    // left: sx(30),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: sy(5),
                    ),
                    child: new Text(
                      "Google",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: sy(9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onPressed: () async {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Theme.of(context).accentColor,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // _showLocationPopUp() async {
  //   setState(() {
  //     isLoadingProgress = false;
  //   });
  //   Location location = new Location();
  //   var _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted != PermissionStatus.granted) {
  //     return LocationRestrictedScreen();
  //     // showDialog(
  //     //     context: context,
  //     //     builder: (_) {
  //     //       return LocationRestricted();
  //     //     });
  //   }
  // }
}
