import 'dart:developer';

import 'package:chargemod_assignment/utilities/api_base_helper.dart';
import 'package:chargemod_assignment/utilities/api_constants.dart';
import 'package:http/http.dart' as http;

class LoginRepo{

  static Future<bool> sendOTP(String phoneNumber) async {
    APIBaseHelper helper = APIBaseHelper();
    try {
      bool response = await helper.postRequest(ApiStringConstants.signIn, isAuthTokenRequired: false, queryParam: {'mobile' : phoneNumber.toString()});
      return response;
    } catch (e){
      log(e.toString());
      return false;
    }
  }
}