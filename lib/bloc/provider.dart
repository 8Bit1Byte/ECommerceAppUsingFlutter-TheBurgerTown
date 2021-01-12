import 'package:theBT/model/offeritem.dart';

class CartProvider {
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
  List<OfferItem> offerItems = [];

  List<OfferItem> addToList(OfferItem offerItem) {
    bool isPresent = false;

    if (offerItems.length > 0) {
      for (int i = 0; i < offerItems.length; i++) {
        if (offerItems[i].id == offerItem.id) {
          increaseItemQuantity(offerItem);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }

      if (!isPresent) {
        offerItems.add(offerItem);
      }
    } else {
      offerItems.add(offerItem);
    }

    return offerItems;
  }

  List<OfferItem> removeFromList(OfferItem offerItem) {
    if (offerItem.quantity > 1) {
      //only decrease the quantity
      decreaseItemQuantity(offerItem);
    } else {
      //remove it from the list
      offerItems.remove(offerItem);
    }
    return offerItems;
  }

  void increaseItemQuantity(OfferItem offerItem) => offerItem.incrementQuantity();
  void decreaseItemQuantity(OfferItem offerItem) => offerItem.decrementQuantity();
}
