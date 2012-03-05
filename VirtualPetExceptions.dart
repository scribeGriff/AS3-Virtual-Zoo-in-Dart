/**
 * Interface implemented by all core library exceptions.
 *
 * interface Exception default ExceptionImplementation {
 *   const Exception([var msg]);
 * }
**/ 

class VirtualPetNameException implements Exception {
  const VirtualPetNameException([String msg]);
  String toString() => "Invalid pet name specified.";
}

class VirtualPetInsufficientDataException extends VirtualPetNameException  {
  VirtualPetInsufficientDataException():super("Pet name too short.");
}

class VirtualPetExcessDataException extends VirtualPetNameException  {
  VirtualPetExcessDataException():super("Pet name too long.");
}
