import 'dart:math';

class SingletonFactory {
  static final SingletonFactory _instance = SingletonFactory._();
  int id = Random().nextInt(100);
  SingletonFactory._();
  factory SingletonFactory() {
    return _instance;
  }
}
