#library('VirtualZooLib');
#import('dart:html');
#source('Food.dart');
#source('Apple.dart');
#source('Sushi.dart');
#source('VirtualPetExceptions.dart');
#source('VirtualPet.dart');
#source('VirtualPage.dart');
#resource('VirtualZoo.css');

class VirtualZoo {
  VirtualZoo() {}
}

void main() {
  new VirtualPage().create();
}
