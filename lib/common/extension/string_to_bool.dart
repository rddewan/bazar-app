
extension StringToBool on String {
  bool parseBool() {
     if(this == '0') {
      return false;
     }
     else {
      return true;
     }

  }
}