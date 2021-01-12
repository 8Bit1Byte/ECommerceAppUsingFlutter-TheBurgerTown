import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theBT/firstpage.dart';
import 'package:theBT/nonloginpage/about_us.dart';
import 'package:theBT/nonloginpage/detail_page.dart';
import 'package:theBT/nonloginpage/offer_page.dart';
import 'package:theBT/nonloginpage/special_info.dart';
import 'package:theBT/onboardingpage.dart';
import 'package:theBT/pages/home_page.dart';
import './loginpage/sigin_page.dart';
import './bloc/cartListBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import './bloc/listTileColorBloc.dart';
import './loginpage/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocProvider(
      blocs: [
        //add yours BLoCs controlles
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
          title: "The Burger Town",
          home: Splash(),
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            '/splashscreen': (BuildContext context) => new Splash(),
            '/landingpage': (BuildContext context) => new MyApp(),
            '/signup': (BuildContext context) => new SignUpPage(),
            '/homepage': (BuildContext context) => new Home(),
            '/signin': (BuildContext context) => new LoginScreen(),
            '/firstpage': (BuildContext context) => new FirstPage(),
            '/detailpage': (BuildContext context) => new DetailsPage(),
            '/aboutus': (BuildContext context) => new PageView(
                  children: <Widget>[
                    FeedScreen(),
                    SocialScreen(),
                  ],
                ),
            '/offerpage': (BuildContext context) => new OfferPage(),
            '/specialInfo': (BuildContext context) => new SpecialInfo(),
          }),
    );
  }
}
