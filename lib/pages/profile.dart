import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theBT/core/sizeConfig.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151534),
      body: Column(
        children: <Widget>[
          SizedBox(height: 25),
          _customAppBar(),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage("assets/homelogo.png"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black)],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          elevation: 10,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          padding: EdgeInsets.symmetric(vertical: 14),
                          color: Color(0xFFF26F16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Text(
                            "Back to \n Home",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _aboutProfile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 3, color: Colors.white)],
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Text(
                  "Account Info",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFF26F16),
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * 2 / 10),
              GestureDetector(
                child: Icon(
                  MaterialCommunityIcons.logout,
                  color: Color(0xFFF26F16),
                  size: SizeConfig.screenWidth / 10,
                ),
                onTap: () async {
                  _googleSignIn.signOut();
                  print('User Signed Out');
                  SharedPreferences prefsemail =
                      await SharedPreferences.getInstance();
                  prefsemail.setString('email', null);
                  print(prefsemail.getString('email'));
                  Navigator.of(context).pop();
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pushReplacementNamed('/firstpage');
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _aboutProfile() {
  return Container(
    padding: EdgeInsets.only(
      top: 20,
      bottom: 10,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 3, color: Colors.white)],
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 10, top: 10),
          child: Row(
            children: <Widget>[
              Icon(
                MaterialCommunityIcons.account,
                color: Color(0xFFF26F16),
                size: 30,
              ),
              SizedBox(
                width: 3.0,
              ),
              Text(
                "Name | ",
                style: TextStyle(
                  fontSize: 6000 / SizeConfig.screenWidth,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFF26F16),
                  fontFamily: 'Quicksand',
                ),
              ),
              SizedBox(
                width: 6.0,
              ),
              Text(
                "Davinder Singh",
                style: TextStyle(
                  fontSize: 6000 / SizeConfig.screenWidth,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFF26F16),
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)],
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 10, top: 10),
          child: Row(
            children: <Widget>[
              Icon(
                MaterialCommunityIcons.phone,
                color: Color(0xFFF26F16),
                size: 30,
              ),
              SizedBox(
                width: 3.0,
              ),
              Container(
                child: Text(
                  "Mobile | ",
                  style: TextStyle(
                    fontSize: 6000 / SizeConfig.screenWidth,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFF26F16),
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              SizedBox(
                width: 6.0,
              ),
              Text(
                "9817835889",
                style: TextStyle(
                  fontSize: 6000 / SizeConfig.screenWidth,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFF26F16),
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 3, color: Colors.white)],
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          padding:
              const EdgeInsets.only(left: 20.0, right: 0, bottom: 10, top: 10),
          child: Row(
            children: <Widget>[
              Icon(
                MaterialCommunityIcons.email,
                color: Color(0xFFF26F16),
                size: 30,
              ),
              SizedBox(
                width: 3.0,
              ),
              Container(
                child: Text(
                  "Email  |",
                  style: TextStyle(
                    fontSize: 6000 / SizeConfig.screenWidth,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFF26F16),
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              SizedBox(
                width: 6.0,
              ),
              Text(
                "davinder_s@gmail.com",
                style: TextStyle(
                  fontSize: 5000 / SizeConfig.screenWidth,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFF26F16),
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14),
        Container(
          width: 110000 / SizeConfig.screenWidth,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black)],
            color: Color(0xFFF26F16),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(40),
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(40),
            ),
          ),
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 20, top: 20),
          child: Text(
            "The Burger Town",
            style: TextStyle(
              fontSize: 18000 / SizeConfig.screenHeight,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontFamily: 'Quicksand',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
