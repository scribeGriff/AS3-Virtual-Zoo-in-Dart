class Food {
  num _calories;
  String _name;
  
  Food(num initialCalories) {
    foodCalories = initialCalories;
  }
  
  num get foodCalories()                =>  _calories;
      set foodCalories(num newCalories) =>  _calories = newCalories;

  String get foodName()                 => _name;
         set foodName(String newName)   => _name = newName;
}
