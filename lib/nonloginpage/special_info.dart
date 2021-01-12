import 'package:flutter/material.dart';

class SpecialInfo extends StatefulWidget {
  @override
  _SpecialInfoState createState() => _SpecialInfoState();
}

class _SpecialInfoState extends State<SpecialInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
         Container(
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: new AssetImage(
                      'assets/images/loading.gif',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),

    );
  }
}


