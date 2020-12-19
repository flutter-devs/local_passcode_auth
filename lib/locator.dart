import 'package:get_it/get_it.dart';
import 'package:local_passcode_auth/sharedPrefs.dart';

import 'baseModel.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BaseModel());
  locator.registerLazySingleton(() => SharedPrefs());
}
