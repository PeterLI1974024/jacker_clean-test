import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  int page = 0;
  final List _shopItems = [
    ['分離式冷氣機 （室內機）', 2500],
    ['分離式冷氣機 （室內機＋室外機）', 3000],
    ['窗型冷氣機 （三噸以下）', 3500],
    ['窗型冷氣機 （三噸以上）', 4000],
    ['吊隱式冷氣機 （室內機）', 3200],
    ['吊隱式冷氣機 （室內機＋室外機）', 3500],
  ];
  List _cartItems = [];
  get shopItems => _shopItems;
  get cartItems => _cartItems;

  addItemToCart(int index) {
    var page = 0;
    _cartItems.add(_shopItems[index]);
  }

  removeItemFromCart(int index) {
    page--;
    _cartItems.removeAt(index);
    print(cartItems.length);
    notifyListeners();
  }

  void removeAllItems() {
    _cartItems.clear();
    page = 0;
    notifyListeners();
  }

  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  countItem(index) {
    var count = 0;
    return () {
      count += 1;
    };
  }

  void removeItemFromCartInDesc(name) {
    for (int i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i][0] == name) {
        _cartItems.remove(_cartItems[i]);
        page--;
        notifyListeners();
      }
      ;
    }
  }
}
