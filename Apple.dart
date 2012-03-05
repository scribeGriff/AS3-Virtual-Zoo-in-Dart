class Apple extends Food {
  static final num _DEFAULTCALORIES = 100;
  bool _wormInApple;
  
  Apple ([num initialCalories = 0]):super (initialCalories <= 0 ? 
      Apple._DEFAULTCALORIES:initialCalories) {
    _wormInApple = Math.random() >= 0.5;
    foodName = 'Apple';
  }
  bool hasWorm () =>  _wormInApple;
}
