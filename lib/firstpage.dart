import 'package:extended_navbar_scaffold/extended_navbar_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstPage extends StatelessWidget {

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  final parallaxCardItemsList = <ParallaxCardItem>[
    ParallaxCardItem(
        title: 'Some Random Route 1',
        body: '         😱 Offer 1',
        background: Container(
          decoration: new BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: new AssetImage(
                'assets/map.png',
              ),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
          ),
        )),
    ParallaxCardItem(
        title: 'Some Random Route 2',
        body: '         😱 Offer 2',
        background: Container(
          decoration: new BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: new AssetImage(
                'assets/map.png',
              ),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
          ),
        )),
    ParallaxCardItem(
        title: 'Some Random Route 3',
        body: '          😱 Offer 3',
        background: Container(
          decoration: new BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: new AssetImage(
                'assets/map.png',
              ),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
          ),
        )),
  ];

  double offset = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        resizeToAvoidBottomPadding: false,
        bottomNavigationBar: ExtendedNavigationBarScaffold(
          // onTap:OfferScreen(),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 65.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(150),
                  width: 350,
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
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF26F16),
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 3.0, color: Colors.white)
                      ]),
                  width: 220,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.users,
                            color: Colors.black,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'SignUp as User',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF26F16),
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 3.0, color: Colors.white)
                      ]),
                  width: 220,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.user,
                            color: Colors.black,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'SignIn as User',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signin');
                      },
                    ),
                  ),
                ),
                SizedBox(height: 200),
              ],
            ),
          ),
          elevation: 50,
          floatingAppBar: false,
          appBar: AppBar(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            centerTitle: false,
            backgroundColor: Colors.black,
          ),
          navBarColor: Color(0xFFF26F16),
          navBarIconColor: Colors.black,
          moreButtons: [
            MoreButtonModel(
              icon: MaterialCommunityIcons.food,
              label: 'Available',
              onTap: () {
                Navigator.of(context).pushNamed('/detailpage');
              },
            ),
            MoreButtonModel(
              icon: MaterialCommunityIcons.google_maps,
              label: 'Maps',
              onTap: () {
                const url =
                    'https://g.page/the-burger-town-talwara-khurd?share';
                _launchInBrowser(url);
              },
            ),
            MoreButtonModel(
              icon: MaterialCommunityIcons.web,
              label: 'Our Website',
              onTap: () {
                const url =
                    'https://theburgertown.business.site/?utm_source=gmb&utm_medium=referral';
                _launchInBrowser(url);
              },
            ),
            MoreButtonModel(
              icon: MaterialCommunityIcons.shopify,
              label: 'Offers',
              onTap: () {
                Navigator.of(context).pushNamed('/offerpage');
              },
            ),
            MoreButtonModel(
              icon: MaterialCommunityIcons.youtube,
              label: 'Our Youtube',
              onTap: () {
                const url = 'https://youtube.com/';
                _launchUniversalLinkIos(url);
              },
            ),
            MoreButtonModel(
              icon: FontAwesome5Regular.user_circle,
              label: 'About Us',
              onTap: () {
                Navigator.of(context).pushNamed('/aboutus');
              },
            ),
            MoreButtonModel(
              icon: MaterialCommunityIcons.phone,
              label: 'Phone',
              onTap: () {
                _makePhoneCall('tel:7082133916');
              },
            ),
            MoreButtonModel(
              icon: EvaIcons.settings,
              label: 'Settings',
              onTap: () {},
            ),
            MoreButtonModel(
              icon: FontAwesome5Regular.smile_beam,
              label: '2021 Specials',
              onTap: () {
                Navigator.of(context).pushNamed('/specialInfo');
              },
            ),
          ],
          searchWidget: Container(
            height: 50,
            color: Colors.transparent,
          ),
          // onTap: (button) {
          //   },
          // currentBottomBarCenterPercent: (currentBottomBarParallexPercent) {},
          // currentBottomBarMorePercent: (currentBottomBarMorePercent) {},
          currentBottomBarSearchPercent: (currentBottomBarSearchPercent) {},
          parallexCardPageTransformer: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.90),
                itemCount: parallaxCardItemsList.length,
                itemBuilder: (context, index) {
                  final item = parallaxCardItemsList[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);
                  return ParallaxCardsWidget(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
