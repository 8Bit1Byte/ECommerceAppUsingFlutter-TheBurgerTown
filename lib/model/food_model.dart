class FoodModel {
  final String name;
  final double price;
  final String imgPath;

  FoodModel({this.name, this.price, this.imgPath});

  static List<FoodModel> list = [
    FoodModel(
      name: "Pasta",
      price: 120,
      imgPath: "home/1.png",
    ),
    FoodModel(
      name: "Combos",
      price: 100,
      imgPath: "home/2.png",
    ),
    FoodModel(
      name: "Breads",
      price: 90,
      imgPath: "home/3.png",
    ),
    FoodModel(
      name: "Wraps",
      price: 50,
      imgPath: "home/4.png",
    ),
    FoodModel(
      name: "Fries",
      price: 20,
      imgPath: "home/5.png",
    ),
    FoodModel(
      name: "Burger",
      price: 20,
      imgPath: "home/5.png",
    ),
    FoodModel(
      name: "Sandwich",
      price: 20,
      imgPath: "home/5.png",
    ),
  ];
}
