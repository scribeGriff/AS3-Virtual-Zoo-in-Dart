class Sushi extends Food {
  static final num _DEFAULTCALORIES = 500;
  
  Sushi([num initialCalories = 0]):super (initialCalories <= 0 ? 
      Sushi._DEFAULTCALORIES:initialCalories) {
    foodName = 'Sushi';
  }

}
