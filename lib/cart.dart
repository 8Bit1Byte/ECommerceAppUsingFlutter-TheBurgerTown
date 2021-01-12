import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:theBT/core/sizeConfig.dart';
import 'package:theBT/model/offeritem.dart';
import './bloc/cartListBloc.dart';
import './bloc/listTileColorBloc.dart';
import './paymentpage/payment_page.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    List<OfferItem> offerItems;
    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          offerItems = snapshot.data;
          return Scaffold(
            body: SafeArea(
              child: CartBody(offerItems),
            ),
            bottomNavigationBar: BottomBar(offerItems),
          );
        } else {
          return Container(
            child: Text("Something returned null"),
          );
        }
      },
    );
  }
}

Container totalAmount(List<OfferItem> offerItems) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    padding: EdgeInsets.all(25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Total:",
          style: TextStyle(
            color: Color(0xFFBF1B2C),
            fontSize: 23000 / SizeConfig.screenHeight,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          "\₹${returnTotalAmount(offerItems)}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 23000 / SizeConfig.screenHeight,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ),
  );
}

String returnTotalAmount(List<OfferItem> offerItems) {
  double totalAmount = 0.0;

  for (int i = 0; i < offerItems.length; i++) {
    totalAmount = totalAmount + offerItems[i].price * offerItems[i].quantity;
  }
  return totalAmount.toStringAsFixed(2);
}

class CustomPersonWidget extends StatefulWidget {
  @override
  _CustomPersonWidgetState createState() => _CustomPersonWidgetState();
}

class _CustomPersonWidgetState extends State<CustomPersonWidget> {
  int noOfPersons = 1;

  double _buttonWidth = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300], width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  if (noOfPersons > 1) {
                    noOfPersons--;
                  }
                });
              },
              child: Text(
                "-",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
          ),
          Text(
            noOfPersons.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  noOfPersons++;
                });
              },
              child: Text(
                "+",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartBody extends StatelessWidget {
  final List<OfferItem> offerItems;

  CartBody(this.offerItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          title(),
          Expanded(
            flex: 1,
            child: offerItems.length > 0 ? foodItemList() : noItemContainer(),
          )
        ],
      ),
    );
  }

  Container noItemContainer() {
    return Container(
      child: Center(
        child: Text(
          "No More Items Left In The Cart",
          style: TextStyle(
            color: Color(0xFFBF1B2C),
            fontSize: 14000 / SizeConfig.screenHeight,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  ListView foodItemList() {
    return ListView.builder(
      itemCount: offerItems.length,
      itemBuilder: (context, index) {
        return CartListItem(foodItem: offerItems[index]);
      },
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My",
                style: TextStyle(
                  color: Color(0xFFBF1B2C),
                  fontSize: 30000 / SizeConfig.screenHeight,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Order",
                style: TextStyle(
                  color: Color(0xFFBF1B2C),
                  fontSize: 23000 / SizeConfig.screenHeight,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  final OfferItem foodItem;

  CartListItem({@required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      hapticFeedbackOnStart: false,
      maxSimultaneousDrags: 1,
      data: foodItem,
      feedback: DraggableChildFeedback(foodItem: foodItem),
      child: DraggableChild(foodItem: foodItem),
      childWhenDragging: foodItem.quantity > 1
          ? DraggableChild(foodItem: foodItem)
          : Container(),
    );
  }
}

class DraggableChild extends StatelessWidget {
  const DraggableChild({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  final OfferItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: ItemContent(
        foodItem: foodItem,
      ),
    );
  }
}

class DraggableChildFeedback extends StatelessWidget {
  const DraggableChildFeedback({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  final OfferItem foodItem;

  @override
  Widget build(BuildContext context) {
    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();

    return Opacity(
      opacity: 0.7,
      child: Material(
        child: StreamBuilder(
          stream: colorBloc.colorStream,
          builder: (context, snapshot) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: snapshot.data != null ? snapshot.data : Colors.white,
              ),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.95,
              child: ItemContent(foodItem: foodItem),
            );
          },
        ),
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  const ItemContent({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  final OfferItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image(
            width: SizeConfig.screenWidth / 6,
            image: AssetImage(foodItem.imgPath),
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(text: foodItem.quantity.toString()),
                  TextSpan(text: " x "),
                  TextSpan(
                    text: foodItem.title,
                  ),
                ]),
          ),
          Text(
            "\₹${foodItem.quantity * foodItem.price}",
            style:
                TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 30),
              child: Icon(CupertinoIcons.back),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)],
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 30),
          child: DragTargetWidget(bloc),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)],
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

class DragTargetWidget extends StatefulWidget {
  final CartListBloc bloc;

  DragTargetWidget(this.bloc);

  @override
  _DragTargetWidgetState createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  @override
  Widget build(BuildContext context) {
    OfferItem currentFoodItem;
    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();

    return DragTarget<OfferItem>(
      onAccept: (OfferItem foodItem) {
        currentFoodItem = foodItem;
        colorBloc.setColor(Colors.white);
        widget.bloc.removeFromList(currentFoodItem);
      },
      onWillAccept: (OfferItem foodItem) {
        colorBloc.setColor(Colors.red);
        return true;
      },
      onLeave: (OfferItem) {
        colorBloc.setColor(Colors.white);
      },
      builder: (BuildContext context, List incoming, List rejected) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            CupertinoIcons.delete_solid,
            size: 30000 / SizeConfig.screenHeight,
            color: Colors.black,
          ),
        );
      },
    );
  }
}

class BottomBar extends StatelessWidget {
  final List<OfferItem> offerItems;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  BottomBar(this.offerItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(offerItems),
          SizedBox(
            height: 5000 / SizeConfig.screenHeight,
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 25),
              padding: EdgeInsets.all(
                13000 / SizeConfig.screenHeight,
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [BoxShadow(blurRadius: 10, color: Colors.white)]),
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Text(
                    "Next",
                    style: TextStyle(
                      color: Color(0xFFBF1B2C),
                      fontSize: 23000 / SizeConfig.screenHeight,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    size: 23000 / SizeConfig.screenHeight,
                    color: Color(0xFFBF1B2C),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => PaymentPage()));
            },
          ),
        ],
      ),
    );
  }
}
