import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

class OfferitemList {
  List<OfferItem> offerItems;

  OfferitemList({@required this.offerItems});
}

class OfferItem {
  int id;
  String title;
  String details;
  double price;
  String imgPath;
  int quantity;

  OfferItem({
    @required this.id,
    @required this.title,
    @required this.details,
    @required this.price,
    this.imgPath,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}

OfferitemList offeritemList = OfferitemList(offerItems: [
  OfferItem(
    id: 1,
    title: "Cheese Burger",
    details: "Hagwarts Cafe",
    price: 40.00,
    imgPath: "assets/images/burger.png",
  ),
  OfferItem(
    id: 2,
    title: " Burger",
    details: "Nafees Restaurant",
    price: 40.00,
    imgPath: "assets/images/fries.png",
  ),
  OfferItem(
    id: 3,
    title: " Pizza ",
    details: "Dominos",
    price: 40.00,
    imgPath: "assets/images/hamburger.png",
  ),
  OfferItem(
    id: 4,
    title: "Masala Dosa",
    details: "Cafe Yolo",
    price: 40.00,
    imgPath: "assets/images/hotdog.png",
  ),
  OfferItem(
    id: 5,
    title: "Idali Sambhar",
    details: "Anand Healthy Kitchen",
    price: 40.00,
    imgPath: "assets/images/pasta.png",
  ),
  OfferItem(
    id: 6,
    title: "Veg Rolls",
    details: "ROLLS",
    price: 40.00,
    imgPath: "assets/images/pizza-1.png",
  ),
  OfferItem(
    id: 7,
    title: "Chocolate Shake",
    details: "Sassy House",
    price: 40.00,
    imgPath: "assets/images/pizza-2.png",
  ),
]);

