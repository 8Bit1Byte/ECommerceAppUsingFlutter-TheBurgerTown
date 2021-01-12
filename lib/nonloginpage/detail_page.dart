import 'package:flutter/material.dart';
import 'package:theBT/const/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theBT/widgets/header.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double offset = 0;

  List<Category> data = [
    Category(
      id: 1,
      name: 'POPULAR',
      foodList: <FoodItemBest>[
        FoodItemBest(
            id: 1,
            name: 'Chicago Hot Dog',
            price: 5.99,
            imagePath: 'assets/images/hamburger.png'),
        FoodItemBest(
            id: 2,
            name: 'Greek Shaurama',
            price: 6.99,
            imagePath: 'assets/images/hotdog.png'),
      ],
    ),
    Category(
      id: 2,
      name: 'MEAL DEALS',
      foodList: <FoodItemBest>[
        FoodItemBest(
            id: 3,
            name: 'Fix Meal',
            price: 10.99,
            imagePath: 'assets/images/hamburger.png'),
        FoodItemBest(
            id: 4,
            name: 'Maxican Meal',
            price: 12.99,
            imagePath: 'assets/images/hamburger.png'),
      ],
    ),
    Category(
      id: 3,
      name: 'HOT DOGS',
      foodList: <FoodItemBest>[
        FoodItemBest(
            id: 1,
            name: 'Chicago Hot Dog',
            price: 5.99,
            imagePath: 'assets/images/hamburger.png'),
        FoodItemBest(
            id: 5,
            name: 'Hot Dog',
            price: 4.99,
            imagePath: 'assets/images/hamburger.png'),
      ],
    ),
    Category(
      id: 4,
      name: 'BURGERS',
      foodList: <FoodItemBest>[
        FoodItemBest(
            id: 6,
            name: 'Burger',
            price: 5.99,
            imagePath: 'assets/images/hamburger.png'),
        FoodItemBest(
            id: 7,
            name: 'Bacon Clubhouse Burger',
            price: 7.99,
            imagePath: 'assets/images/hamburger.png'),
        FoodItemBest(
            id: 8,
            name: 'Hamburger',
            price: 9.99,
            imagePath: 'assets/images/hamburger.png'),
      ],
    ),
    Category(
      id: 4,
      name: 'PIZZAS',
      foodList: <FoodItemBest>[
        FoodItemBest(
            id: 9,
            name: 'Margherita',
            price: 15.99,
            imagePath: 'assets/images/pizza-1.png'),
        FoodItemBest(
            id: 10,
            name: 'Double Cheese Margherita',
            price: 18.99,
            imagePath: 'assets/images/pizza-2.png'),
        FoodItemBest(
            id: 11,
            name: 'Pepper',
            price: 16.99,
            imagePath: 'assets/images/pizza-1.png'),
        FoodItemBest(
            id: 12,
            name: 'Zesty Chicken',
            price: 22.99,
            imagePath: 'assets/images/pizza-2.png'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MyHeader(
                image: "assets/icons/main.svg",
                textTop: "",
                textBottom: "",
                offset: offset,
              ),
              Container(
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            _buildIntro(),
                            Expanded(
                              child: _buildMenu(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ])),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            _aboutUs(),
                          ],
                        ),
                      ),
                    ),
                  ])),
            ],
          ),
        ));
  }

  Widget _buildIntro() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Items we Offer',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Quicksand',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'SERVING GOODNESS SINCE 2020',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Quicksand',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'The Burger Town is located on enter visit of Talwara Khurd. We say that people who love to eat are always the best people.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w200,
              color: Colors.grey,
              fontFamily: 'Quicksand',
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      child: DefaultTabController(
        length: data.length,
        child: Column(
          children: <Widget>[
            _buildTabBar(),
            Expanded(
              child: _buildTabBarView(),
            ),
            // _aboutUs(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      labelColor: Colors.black,
      isScrollable: true,
      indicatorColor: ColorConstants.primaryColor,
      unselectedLabelColor: Colors.grey,
      labelStyle: GoogleFonts.varelaRound(fontWeight: FontWeight.w600),
      tabs: List.generate(
        data.length,
        (index) => Tab(
          text: data[index].name,
        ),
      ),
    );
  }

  _buildTabBarView() {
    return Container(
      child: TabBarView(
        children: List.generate(
          data.length,
          (index) {
            ///TabBarView children length = Number of categories
            ///Each category have foodList (ListView)
            return ListView.separated(
                padding: EdgeInsets.all(20),
                itemBuilder: (context, foodIndex) {
                  return FoodTile(
                    foodItem: data[index].foodList[foodIndex],
                  );
                },
                separatorBuilder: (context, foodIndex) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: data[index].foodList.length);
          },
        ),
      ),
    );
  }

  Widget _aboutUs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 45),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "For Your Service",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.black87,
                fontFamily: 'Quicksand',
              ),
            ),
            Text(
              "The Burger Town Team",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 15,
                color: Colors.grey,
                fontFamily: 'Quicksand',
              ),
            ),
          ],
        )
      ],
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class FoodTile extends StatelessWidget {
  final FoodItemBest foodItem;

  const FoodTile({Key key, this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          shadowColor: const Color(0xffF7CBAB),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  foodItem.name,
                  style: GoogleFonts.varelaRound(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '\$${foodItem.price}',
                  style: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorConstants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: -30,
          child: Image.asset(
            foodItem.imagePath,
            height: 120,
            width: 120,
          ),
        ),
      ],
    );
  }
}

class Category {
  final int id;
  final String name;
  final List<FoodItemBest> foodList;

  Category({
    this.id,
    this.name,
    this.foodList,
  });
}

class FoodItemBest {
  final int id;
  final String name;
  final String imagePath;
  final double price;

  FoodItemBest({
    this.id,
    this.name,
    this.imagePath,
    this.price,
  });
}
