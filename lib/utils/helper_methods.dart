import 'package:fluttertoast/fluttertoast.dart';

class HelperMethods {
  static bool isNotNullNorEmpty(var value) {
    if (value != null && value.isNotEmpty) {
      return true;
    }
    return false;
  }

  static appToast(String message) {
    Fluttertoast.showToast(msg: message);
  }

    static String? isValidEmail(String? email) {
    if (RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!)) {
      return null;
    } else {
      return "Enter Valid mail!";
    }
  }


   static String? isValidPass(String? value) {
    if (value!.isNotEmpty) {
      return null;
    }
    else {
      return "enter password";
    }
  }
}
