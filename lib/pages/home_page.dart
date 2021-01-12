import 'package:theBT/bloc/cartListBloc.dart';
import 'package:theBT/cart.dart';
import 'package:theBT/core/consts.dart';
import 'package:theBT/core/sizeConfig.dart';
import 'package:theBT/model/food_model.dart';
import 'package:theBT/model/offeritem.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:theBT/pages/detail_page.dart';
import 'package:theBT/pages/profile.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<FoodModel> foodList = FoodModel.list;
  PageController pageController = PageController(viewportFraction: .8);
  var paddingLeft = 0.0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        child: ListView(
          children: <Widget>[
            CustomAppBar(),
            _buildRightSection(),
            SizedBox(height: 45),
          ],
        ),
      )),
    );
  }

  Widget _buildRightSection() {
    return Container(
      width: MediaQuery.of(context).size.width * 1.2,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Offers",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: foodList.length,
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailPage(foodList[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Stack(
                            children: <Widget>[
                              _buildBackGround(index),
                              Align(
                                alignment: Alignment.topRight,
                                child: Transform.rotate(
                                  angle: math.pi / 3,
                                  child: Hero(
                                    tag: "image${foodList[index].imgPath}",
                                    child: Image(
                                      width: SizeConfig.screenWidth * 1 / 2,
                                      image: AssetImage(
                                          "assets/${foodList[index].imgPath}"),
                                    ),
                                  ),
                                ),
                              ),
                            
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 15, bottom: 20),
                  child: Text(
                    "Basket",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                for (var foodItem in offeritemList.offerItems)
                  Builder(
                    builder: (context) {
                      return ItemContainer(offerItem: foodItem);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildBackGround(int index) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth / 2,
      margin: EdgeInsets.only(
        top: 50,
        bottom: 20,
      ),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black87)],
        color: AppColors.greenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 70000 / SizeConfig.screenWidth,
          ),
          Text(
            "${foodList[index].name}",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 8000 / SizeConfig.screenWidth,
              color: Colors.black,
              fontFamily: 'Quicksand',
            ),
          ),
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  Items({
    @required this.imgPath,
    @required this.itemName,
    @required this.itemPrice,
    @required this.about,
  });

  final String imgPath;
  final String itemName;
  final double itemPrice;
  final String about;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: SizeConfig.screenHeight / 5,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(50),
            ),
          ),
          child: Row(
            children: <Widget>[
              Image(
                width: SizeConfig.screenWidth / 4,
                image: AssetImage(imgPath),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$itemName",
                    style: TextStyle(
                      fontSize: 8000 / SizeConfig.screenWidth,
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Text(
                        "\₹$itemPrice",
                        style: TextStyle(
                          fontSize: 7000 / SizeConfig.screenWidth,
                          color: AppColors.redColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class ItemContainer extends StatelessWidget {
  ItemContainer({
    @required this.offerItem,
  });

  final OfferItem offerItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(OfferItem offerItem) {
    bloc.addToList(offerItem);

    removeFromList(OfferItem offerItem) {
      bloc.removeFromList(offerItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          addToCart(offerItem);
          final snackBar = SnackBar(
              content: Text(
                '😋 *${offerItem.title}* added to Cart',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w900,
                ),
              ),
              elevation: 3,
              duration: Duration(milliseconds: 1000),
              backgroundColor: Color(0xFFF26F16));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 40, top: 10),
          child: Items(
            about: offerItem.details,
            itemName: offerItem.title,
            itemPrice: offerItem.price,
            imgPath: offerItem.imgPath,
          ),
        ));
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
            child: Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)],
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: Icon(MaterialCommunityIcons.menu),
              ),
            ),
          ),
          StreamBuilder(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              List<OfferItem> offerItems = snapshot.data;
              int length = offerItems != null ? offerItems.length : 0;
              return buildGestureDetector(length, context, offerItems);
            },
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<OfferItem> offerItems) {
    return GestureDetector(
        onTap: () {
          if (length > 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          } else {
            return;
          }
        },
        child: Container(
          margin: EdgeInsets.only(right: 30),
          child: Icon(MaterialCommunityIcons.cart),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)],
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ));
  }
}
