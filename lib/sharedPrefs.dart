import 'package:local_passcode_auth/baseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends BaseModel {
  int _passCode;

  int get passCode => _passCode;

  setPassCode(int passCodeValue) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('passCode', passCodeValue);
  }

  getPassCode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int code = sharedPreferences.getInt('passCode');
    print("**************" + code.toString());
    _passCode = code;
    notifyListeners();
  }
}
