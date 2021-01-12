import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theBT/controllers/authentications.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:theBT/firstpage.dart';
import 'package:theBT/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _toggleVisibility = true;

  void login() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      signin(email, password, context).then((value) {
        if (value != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Material(
                color: Colors.black,
                elevation: 20,
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, bottom: 50, top: 50),
                    margin: new EdgeInsets.symmetric(horizontal: 19.0),
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(45),
                      // width: 30,
                      height: 150,
                      decoration: new BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: new AssetImage(
                            'assets/thebt1.png',
                          ),
                          // fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF26F16),
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)]),
                width: 250.0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    onPressed: () => googleSignIn().whenComplete(() async {
                      SharedPreferences prefsemail =
                          await SharedPreferences.getInstance();
                      FirebaseUser user =
                          await FirebaseAuth.instance.currentUser();
                      if (user != null) {
                        prefsemail.setString('gmail', user.email);
                        print("Gmail = ${prefsemail.getString('gmail')}");
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Home()));
                      } else {
                        prefsemail.setString('gmail', null);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Sign in With Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Material(
                color: Color(0xFFBF1B2C),
                shadowColor: Colors.white,
                elevation: 5,
                borderRadius: new BorderRadius.circular(25.0),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 40, top: 40),
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                      // color: Color(0xfffeb324),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w800,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.white,
                            ),
                            hintText: "Your Email ",
                            hintStyle: TextStyle(
                              color: Color(0xFFBDC2CB),
                              fontSize: 18.0,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w900,
                            ),
                            errorStyle: TextStyle(
                              color: Color(0xFFF26F16),
                              fontSize: 14,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "This Field Is Required"),
                            EmailValidator(errorText: "Invalid Email Address"),
                          ]),
                          onChanged: (val) {
                            email = val;
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w800,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock_open_outlined,
                              color: Colors.white,
                            ),
                            hintText: "Password ",
                            hintStyle: TextStyle(
                              color: Color(0xFFBDC2CB),
                              fontSize: 18.0,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w900,
                            ),
                            errorStyle: TextStyle(
                              color: Color(0xFFF26F16),
                              fontSize: 14,
                              fontFamily: 'Quicksand',
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _toggleVisibility = !_toggleVisibility;
                                });
                              },
                              color: Colors.white,
                              icon: _toggleVisibility
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ),
                          obscureText: _toggleVisibility,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Password Is Required"),
                            MinLengthValidator(6,
                                errorText: "Minimum 6 Characters Required"),
                          ]),
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                child: Container(
                  height: 50.0,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color(0xFFF26F16),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 10, color: Colors.grey)
                      ]),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  login();
                },
              ),
              Divider(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color(0xFFF26F16),
                      fontWeight: FontWeight.w300,
                      fontSize: 18.0,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xFFBF1B2C),
                        fontWeight: FontWeight.w800,
                        fontSize: 20.0,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String userEmail;
  final String photoUrl;
  final List<ProviderDetails> providerData;
  UserDetails(this.providerDetails, this.userName, this.userEmail,
      this.photoUrl, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
