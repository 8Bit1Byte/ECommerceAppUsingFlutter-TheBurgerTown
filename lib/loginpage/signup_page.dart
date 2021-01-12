import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theBT/controllers/authentications.dart';
import 'package:theBT/firstpage.dart';
import 'package:theBT/loginpage/sigin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theBT/services/crud.dart';
import 'package:theBT/services/usermanagement.dart';

final FirebaseAuth mAuth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _toggleVisibility = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email;
  String password;

  // String userName;
  // String userPhone;
  CrudMethods crudObj = new CrudMethods();

  void signup() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      signUp(email.trim(), password, context).then((value) {
        if (value != null) {
          UserManagement().storeNewUser(value, context);
          // crudObj.addData(userData).then((result) {
          //   print("User Get Added and Data update on Firebase datatbase");
          //   print(email);
          // })
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      }).catchError((e) {
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            child: Container(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0.0, bottom: 50, top: 50),
                margin: new EdgeInsets.symmetric(horizontal: 40.0),
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(45),
                    height: 150,
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: new AssetImage(
                          'assets/thebt1.png',
                        ),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstPage(),
                      ),
                    );
                  },
                )),
          ),
          SizedBox(
            height: 15.0,
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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
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
                        hintText: "Your Email",
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
                      validator: (val) {
                        if (!val.contains("@")) {
                          return "Enter a valid email";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: passwordController,
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
                        hintText: "Password",
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
                        RequiredValidator(errorText: "This Field Is Required."),
                      ]),
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
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
                  boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)]),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Quicksand'),
                ),
              ),
            ),
            onTap: () async {
              SharedPreferences prefsemail =
                  await SharedPreferences.getInstance();
              prefsemail.setString('email', emailController.text);
              // Map<String, dynamic> userData = {
              //   'email': this.email,
              // };
              // signup(userData);
              signup();
            },
          ),
          Divider(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Already have an account?",
                style: TextStyle(
                    color: Color(0xFFF26F16),
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                    fontFamily: 'Quicksand'),
              ),
              SizedBox(width: 15.0),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Color(0xFFBF1B2C),
                      fontWeight: FontWeight.w800,
                      fontSize: 20.0,
                      fontFamily: 'Quicksand'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
