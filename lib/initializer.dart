import 'package:flutter_clean_architecture/data/core/helpers/constant_helper.dart';
import 'package:flutter_clean_architecture/data/core/helpers/dio_helper.dart';

class Initializer {

  static Future<void> init() async {
    DioHelper.setDioHeader(ConstantHelper.BEARER_TOKEN);
  }

  // Future<void> getTokenUserSpaceID() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? token = pref.getString(Preferences.ACCESS_TOKEN);
  //   DioHelper.setDioHeaderSpaceId(token);
  // }

  // Future<void> getTokenUser() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? token = pref.getString(Preferences.JWT_TOKEN);
  //   print(token);
  //   DioHelper.setDioInterceptor(token);
  // }
}
