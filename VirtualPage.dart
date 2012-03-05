class VirtualPage {
  LinkElement     vzStyleSheet;
  DivElement      page;
  DivElement      outputCont;
  DivElement      inputCont1;
  DivElement      inputCont2;
  HeadingElement  titleHeading;
  HeadingElement  inputHeading1;
  HeadingElement  inputHeading2;
  InputElement    userPetName;
  InputElement    metaSlider;
  ButtonElement   namePetButton;
  ButtonElement   appleButton;
  ButtonElement   sushiButton;
  LabelElement    labelFast;
  LabelElement    labelSlow;
  
  VirtualPage() {
    vzStyleSheet  = new Element.tag("link");
    page          = new Element.tag("div");
    outputCont    = new Element.tag("div");
    inputCont1    = new Element.tag("div");
    inputCont2    = new Element.tag("div");
    titleHeading  = new Element.tag("h2");
    inputHeading1 = new Element.tag("h4");
    inputHeading2 = new Element.tag("h4");
    userPetName   = new Element.tag("input");
    metaSlider    = new Element.tag("input");
    namePetButton = new Element.tag("button");
    appleButton = new Element.tag("button");
    sushiButton = new Element.tag("button");
    labelFast     = new Element.tag("label");
    labelSlow     = new Element.tag("label");
  }
  
  void create() {
    vzStyleSheet.attributes = ({
      "type": "text/css",
      "rel": "stylesheet",
      "href": "VirtualZoo.css"
    });
    window.document.head.nodes.add(vzStyleSheet);
    page.id = "page";
    window.document.body.nodes.add(page);
    outputCont.id = "output";
    page.nodes.add(outputCont);
    titleHeading.id = "titleHeading";
    titleHeading.innerHTML = "Welcome to the Virtual Zoo in Dart!";
    page.nodes.add(titleHeading);
    inputCont1.id = "input1";
    page.nodes.add(inputCont1);
    inputHeading1.id = "inputHeading1";
    inputHeading1.innerHTML = "Enter a name for your pet:";
    inputCont1.nodes.add(inputHeading1);
    inputCont2.id = "input2";
    page.nodes.add(inputCont2);
    inputHeading2.id = "inputHeading2";
    inputHeading2.innerHTML = "Metabolic Rate";
    inputCont2.nodes.add(inputHeading2);
    userPetName.attributes = ({
      "id": "userPetName",
      "type": "text"
    });
    inputCont1.nodes.add(userPetName);
    namePetButton.attributes = ({
      "id": "namePetButton",
      "type": "button",
    });
    namePetButton.innerHTML = "Name my pet";
    inputCont1.nodes.add(namePetButton);
    appleButton.attributes = ({
      "id": "appleButton",
      "type": "button",
    });
    appleButton.innerHTML = "Feed your pet an apple";
    inputCont1.nodes.add(appleButton);
    sushiButton.attributes = ({
      "id": "sushiButton",
      "type": "button",
    });
    sushiButton.innerHTML = "Feed your pet some sushi";
    inputCont1.nodes.add(sushiButton);
    metaSlider.attributes = ({
      "id": "mySlider",
      "type": "range",
      "min": "500",
      "max": "8000",
      "step": "20",
      "value": "2000"
    });
    inputCont2.nodes.add(metaSlider);
    labelFast.id = "labelFast";
    labelFast.innerHTML = "fast";
    inputCont2.nodes.add(labelFast);
    labelSlow.id = "labelSlow";
    labelSlow.innerHTML = "slow";
    inputCont2.nodes.add(labelSlow);
    
    namePetButton.on.click.add((e) {
      try {
        VirtualPet newPet = new VirtualPet("${userPetName.value}");
      } catch (var exception) {
        // If attempting to create a VirtualPet object causes an exception,
        // then the object won't be created. Hence, we report the problem
        // and create a new VirtualPet object here with a known-to-be-valid 
        // name.
        outputCont.innerHTML += "An error occurred: ${exception}.<br>";
        VirtualPet newPet = new VirtualPet("Stan");
      }
    });
  }
}
