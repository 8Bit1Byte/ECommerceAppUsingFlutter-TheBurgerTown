import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:theBT/const/constant.dart';

class OfferPage extends StatefulWidget {
  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  final controller = ScrollController();
  double offset = 0;
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfffcf1f2),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(
              image: "assets/offers/main.svg",
              textTop: "",
              textBottom: "",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Today's Offer's 😱",
                        style: TextStyle(
                          fontSize: 22,
                          color: kTitleTextColor,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    // overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: OfferTile(
                          image: 'assets/images/pizza.png',
                          textTop: "Pizza and Burger",
                          textBottom: "300 Items Sold",
                        ),
                      ),
                      SizedBox(height: 3),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: OfferTile(
                          image: 'assets/images/pizza.png',
                          textTop: "Pizza and Burger",
                          textBottom: "300 Items Sold",
                        ),
                      ),
                      SizedBox(height: 3),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: OfferTile(
                          image: 'assets/images/pizza.png',
                          textTop: "Pizza and Burger",
                          textBottom: "300 Items Sold",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  const Header(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFF19FADF),
        Color(0xFF19FADF),
      ],
    );
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 50, top: 10, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: linearGradient,
          image: DecorationImage(
            image: AssetImage("assets/images/virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 35),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: (widget.offset < 0) ? 0 : widget.offset,
                    child: SvgPicture.asset(
                      widget.image,
                      width: 320,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 20 - widget.offset / 2,
                    left: 150,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Tile -------------------------------------------------------------------------
class OfferTile extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  const OfferTile({Key key, this.image, this.textTop, this.textBottom})
      : super(key: key);

  @override
  __OfferTile createState() => __OfferTile();
}

class __OfferTile extends State<OfferTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      shadowColor: const Color(0xffF7CBAB),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 30,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                widget.image,
              ),
              width: 50,
              height: 50,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.textTop,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'Quicksand',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.textBottom,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorConstants.primaryColor,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
