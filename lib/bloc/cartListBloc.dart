import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:theBT/model/offeritem.dart';
import './provider.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  var _listController = BehaviorSubject<List<OfferItem>>.seeded([]);

//provider class
  CartProvider provider = CartProvider();

//output
  Stream<List<OfferItem>> get listStream => _listController.stream;

//input
  Sink<List<OfferItem>> get listSink => _listController.sink;

  addToList(OfferItem offerItem) {
    listSink.add(provider.addToList(offerItem));
  }

  removeFromList(OfferItem offerItem) {
    listSink.add(provider.removeFromList(offerItem));
    
  }

//dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
