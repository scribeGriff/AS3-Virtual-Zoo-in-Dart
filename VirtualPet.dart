class VirtualPet {
  static final _MAXCALORIES = 2000;
  static num _maxNameLength = 20;
  static num _caloriesPerSecond = 100;
  
  String _petName;
  num _currentCalories;
  num _digestIntervalID;
  num _metabolism = 1000;
  Date _creationTime;
  
  VirtualPet (String name) {
    var mySlider = document.query('#mySLider');
    document.query('#namePetButton').attributes['disabled'] = 'disabled';
    petsName = name;
    _creationTime = new Date.now();
    mySlider.on.mouseUp.add((e) {
      _metabolism = Math.parseInt(mySlider.value);
      write("$_metabolism");
    });
    document.query('#output').innerHTML += "Your new pet's name is $_petName."
        + "<br>Your pet is quite hungry.<br>";
    petsCalories = VirtualPet._MAXCALORIES/2;
    eat(new Apple());
    eat(new Sushi());
    document.query('#appleButton').on.click.add((e) {
      eat(new Apple());
    });
    document.query('#sushiButton').on.click.add((e) {
      eat(new Sushi());
    });
  }
  
  String get petsName() => _petName;
  set petsName (String newName) {
    if (newName.indexOf(" ") == 0) {
      // newName starts with a space
      throw new VirtualPetNameException();
    } else if (newName == "") {
      // newName is an empty string
      throw new VirtualPetInsufficientDataException();
    } else if (newName.length > VirtualPet._maxNameLength) {
      // newName is too long
      throw new VirtualPetExcessDataException();
    }
    _petName = newName;
  }
  
  void eat (foodItem) {
    if (_currentCalories == 0) {
      write ("$_petName is dead.  You can't feed it.");
    }
    
    if (foodItem is Apple) {
      if (foodItem.hasWorm()) {
        write ("$_petName tried to eat an ${foodItem.foodName} but it" +
            "had a worm, so $_petName didn't eat it");
        return;
      }
    }
    write ("$_petName ate the ${foodItem.foodName} " + 
        "(${foodItem.foodCalories} calories).");
    
    petsCalories = petsCalories + foodItem.foodCalories;
  }
  
  num get petsCalories() => _currentCalories;
  set petsCalories (num newCurrentCalories) {
    if (newCurrentCalories > VirtualPet._MAXCALORIES) { 
      _currentCalories = VirtualPet._MAXCALORIES;
    } else if (newCurrentCalories < 0) { 
      _currentCalories = 0;
    } else {
      _currentCalories = newCurrentCalories;
    }
    
    write("$_petName has  $_currentCalories calories");
    num caloriePercentage = (hunger*100).floor();
    
    // Display a debugging message indicating how many calories the pet
    // now has
    write("$_petName has  $_currentCalories calories"
        + " ($caloriePercentage% of its food) remaining.");
  }
  
  //getAge() {
    // age here is actually known as a duration method and as such you can access things like age.inMilliseconds
    //var age = new Date.now().difference(this._creationTime);
    //return age.inMilliseconds;
  //}
  
  num get petsAge() => 
      (new Date.now().difference(_creationTime)).inMilliseconds;
  
  // Returns a floating-point number describing the amount of food left 
  // in the pet's "stomach," as a percentage
  num get hunger() => _currentCalories/VirtualPet._MAXCALORIES;
  
  void digest() {
    //...stop the interval from calling digest();
    window.clearInterval(_digestIntervalID);
    //If digesting more calories would leave currentCalories at 0 or less...
    if(_currentCalories - VirtualPet._caloriesPerSecond <= 0) {
      //give the pet an empty stomach
      _currentCalories = 0;
      //and report the pet's death
      write("$_petName has died. It was ${petsAge} ms old.");
    } else {
      //...otherwise, digest the stipulated number of calories
      _currentCalories -= VirtualPet._caloriesPerSecond;
      //and report the pet's new status
      write("$_petName digested some food.  " + 
          "It now has $_currentCalories calories remaining.");
      //start the interval with current value of _metabolism
      _digestIntervalID = window.setInterval(digest, 
          VirtualPet._caloriesPerSecond*10);
    }
  }
  
  void write (String message) {
    document.query("#output").innerHTML += message + "<br>";
  }
}
