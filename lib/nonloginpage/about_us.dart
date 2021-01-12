import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';

Color mainColor = Color(0xff774a63);
Color secondColor = Color(0xffd6a5c0);
Color backgroundColor = Color(0xfffcf1f2);

List<ImageProvider> images = [
  AssetImage('assets/aboutUs/image2.png'),
  AssetImage('assets/aboutUs/image1.png'),
  AssetImage('assets/aboutUs/image3.png'),
  AssetImage('assets/aboutUs/image1.png'),
  AssetImage('assets/aboutUs/image2.png'),
];

List<ImageProvider> avatars = [
  AssetImage('assets/aboutUs/avatar1.png'),
  AssetImage('assets/aboutUs/avatar2.png'),
  AssetImage('assets/aboutUs/avatar3.png'),
  AssetImage('assets/aboutUs/avatar4.png'),
  AssetImage('assets/aboutUs/avatar5.png'),
];

List identifier = [
  "https://www.instagram.com/nimaansidhu_/",
  "https://www.instagram.com/aravsidhu5093/",
  "https://www.instagram.com/nimaansidhu_/",
  "https://www.instagram.com/aravsidhu5093/",
  "https://www.instagram.com/nimaansidhu_/",
];

List name = [
  "Name_1",
  "Name_2",
  "Name_3",
  "Name_4",
  "Name_5",
];

int number = 0;

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          CustomFeedHeader(),
          Storys(),
          PostFeed(),
        ],
      ),
    );
  }
}

class PostFeed extends StatelessWidget {
  const PostFeed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: avatars.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 400,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: images[index],
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: secondColor.withOpacity(0.25),
                ),
              ],
            ),
            child: Container(
              height: 90,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: avatars[1],
                  ),
                  SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Jessica Parker',
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Storys extends StatelessWidget {
  const Storys({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 25),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: avatars.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return index == 0
              ? Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: secondColor.withOpacity(0.25),
                        )
                      ]),
                  child: Icon(Icons.add, size: 35, color: secondColor),
                )
              : Container(
                  height: 80,
                  width: 80,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange.shade200,
                        Colors.blue.shade300
                      ],
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: avatars[index - 1],
                  ),
                );
        },
      ),
    );
  }
}

class CustomFeedHeader extends StatelessWidget {
  const CustomFeedHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 50, 50, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Our',
                style: TextStyle(
                  color: secondColor,
                  fontSize: 30,
                  fontFamily: 'Quicksand',
                ),
              ),
              Text(
                'Team',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 40,
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: backgroundColor,
      body: ListView(
        children: <Widget>[
          CustomSocialHeader(),
          SocialInfo(),
          // SocialFeed(),
        ],
      ),
    );
  }
}

class SocialFeed extends StatelessWidget {
  const SocialFeed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(75),
        ),
      ),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              child: Image(image: images[index], fit: BoxFit.cover),
            ),
          );
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index.isEven ? 2 : 1);
        },
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  const SocialInfo({
    Key key,
  }) : super(key: key);

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(height: 100, color: Colors.white),
        Container(
          padding: EdgeInsets.only(top: 25),
          height: 100,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(75),
              bottomRight: Radius.circular(75),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      const url = 'https://www.instagram.com/nimaansidhu_/';
                      launchURL(url);
                    },
                    color: backgroundColor,
                    elevation: 3,
                    child: Icon(
                      MaterialCommunityIcons.instagram,
                      color: mainColor,
                      size: 60.0,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      const url = 'https://www.facebook.com/people/Nimaan-Sidhu/100008337422229';
                      launchURL(url);                      
                    },
                    color: backgroundColor,
                    elevation: 3,
                    child: Icon(
                      MaterialCommunityIcons.facebook,
                      color: mainColor,
                      size: 60.0,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      const url = 'https://twitter.com/satyarowedy';
                      launchURL(url);                      
                    },
                    color: backgroundColor,
                    elevation: 3,
                    child: Icon(
                      MaterialCommunityIcons.twitter,
                      color: mainColor,
                      size: 60.0,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomSocialHeader extends StatelessWidget {
  const CustomSocialHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(75))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.arrow_back, color: mainColor),
              Icon(Icons.more_vert, color: mainColor),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 30, 
                  color: mainColor, 
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(width: 20.0),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: avatars[number],
              ),
              boxShadow: [
                BoxShadow(
                  color: secondColor,
                  blurRadius: 40,
                  offset: Offset(0, 10),
                ),
              ],
            ),
          ),
          Container(),
          Text(
            name[number],
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: mainColor,
                fontFamily: 'Quicksand'),
          ),
          Text(
            '',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: secondColor,
                fontFamily: 'Quicksand'),
          ),
        ],
      ),
    );
  }
}
