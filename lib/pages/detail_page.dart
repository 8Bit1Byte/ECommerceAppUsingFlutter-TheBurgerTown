import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theBT/core/consts.dart';
import 'package:theBT/model/food_model.dart';
import 'package:flutter/material.dart';

int numCart = 1;

class DetailPage extends StatefulWidget {
  final FoodModel data;
  DetailPage(this.data);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 25),
          _customAppBar(),
          Container(
            height: 270,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Image(
                  image: AssetImage("assets/home/bg.png"),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: "image${widget.data.imgPath}",
                    child: Image(
                      image: AssetImage("assets/${widget.data.imgPath}"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
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
                  Text(
                    "${widget.data.name}",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Text(
                        "\₹${widget.data.price.toInt()}",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColor,
                        ),
                      ),
                      SizedBox(width: 30),
                      _buildCounter(),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          elevation:4,
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 16),
                          color: AppColors.greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(String title, String val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Quicksand',
          ),
        ),
        Text(
          "$val",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.redColor,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Icon(
                FontAwesomeIcons.backward,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.black,
            ),
            onPressed: () {
              --numCart;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              numCart.toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              ++numCart;
            },
          ),
        ],
      ),
    );
  }
}
