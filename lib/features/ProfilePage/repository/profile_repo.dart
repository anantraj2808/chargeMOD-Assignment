import 'dart:convert';
import 'dart:developer';
import 'package:chargemod_assignment/features/ProfilePage/Models/user_profile.dart';
import 'package:chargemod_assignment/utilities/api_base_helper.dart';
import 'package:chargemod_assignment/utilities/api_constants.dart';
import 'package:chargemod_assignment/utilities/shared_prefs.dart';
import 'package:http/http.dart' as http;

class ProfileRepo{

  static Future<UserProfile> getUserProfile() async {
    APIBaseHelper helper = APIBaseHelper();
    UserProfile userProfile = UserProfile();
    http.Response response = await helper.getRequest(ApiStringConstants.getCustomer, isAuthTokenRequired: true);
    var data = (jsonDecode(response.body))['data']['user'][0];
    userProfile = UserProfile.fromJson(data);
    return userProfile;
  }

  static Future<bool> logout() async {
    APIBaseHelper helper = APIBaseHelper();
    String refreshToken = await SharedPrefs().getStringFromCache(SharedPrefs.refreshToken);
    http.Response response = await helper.postRequest(ApiStringConstants.logout, isAuthTokenRequired: true, queryParam: {"refreshToken": refreshToken}, isVersionRequired: false);
    return response.statusCode == 200;
  }

}