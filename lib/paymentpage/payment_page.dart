import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theBT/const/constant.dart';
import 'package:theBT/core/sizeConfig.dart';
import 'package:theBT/paymentpage/payment_success.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: [
                          BoxShadow(blurRadius: 10, color: Colors.white)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 10, 10, 15),
                          child: GestureDetector(
                            child: Icon(
                              CupertinoIcons.back,
                              size: 45,
                              color: Color(0xFFBF1B2C),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20000 / SizeConfig.screenHeight,
                        ),
                        Text(
                          'Payment Option',
                          style: TextStyle(
                            color: Color(0xFFBF1B2C),
                            fontSize: 20000 / SizeConfig.screenHeight,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 200),
              Container(
                padding: EdgeInsets.all(125),
                height: 180000 / SizeConfig.screenHeight,
                width: 180000 / SizeConfig.screenHeight,
                decoration: new BoxDecoration(
                  color: Colors.white24,
                  image: DecorationImage(
                    image: new AssetImage(
                      'assets/motoimg.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: Themes.color,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(blurRadius: 6.0, color: Colors.white)
                    ]),
                width: 300.0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.amazonPay,
                          color: Colors.black,
                          size: 35,
                        ),
                        SizedBox(
                          width: 25.0,
                        ),
                        Text(
                          'Cash On Delivery',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15000 / SizeConfig.screenHeight,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PaymentSuccessPage()));
                    },
                  ),
                ),
              ),
              SizedBox(height: 80),

            ],
          ),
        ));
  }
}
