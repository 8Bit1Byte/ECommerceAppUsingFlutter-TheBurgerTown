import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color backgroundColor = Color(0xfffcf1f2);

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final AssetImage image;

  CustomDialog({
    this.title,
    this.description,
    this.buttonText,
    this.image,
  });

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        //...bottom card part,
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            // borderRadius: BorderRadius.vertical(
            //       top = Radius.circular(10),
            //       bottom = Radius.circular(20),
            // ),
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0),
              bottomRight: const Radius.circular(30.0),
              bottomLeft: const Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Quicksand',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5.0),
              Align(
                alignment: Alignment.bottomRight,
                child: ButtonTheme(
                  minWidth: 20.0,
                  child: RaisedButton(
                    color: Colors.white,
                    elevation: 3,
                    onPressed: () {
                      SystemNavigator.pop(); // To close the dialog
                    },
                    child: Text(
                      buttonText,
                      style: TextStyle(fontFamily: 'Quicksand'),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //...top circlular image part,
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            backgroundColor: Colors.purple,
            radius: Consts.avatarRadius,
            backgroundImage: image,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 6.0;
  static const double avatarRadius = 55.0;
}
