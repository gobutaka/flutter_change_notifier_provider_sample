import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  Counter(this._value);
  int _value;
  int get value => this._value;

  void increment() {
    _value++;
    // 値変更を通知する
    notifyListeners();
  }

  void decrement() {
    _value--;
    // 値変更を通知する
    notifyListeners();
  }
}
