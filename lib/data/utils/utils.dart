import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipely/views/constants/color_constants.dart';

class Utils {
  void snackMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: primary_color,
        textColor: btn_text_color,
        fontSize: 16.0);
  }
}
