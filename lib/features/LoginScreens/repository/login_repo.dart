import 'dart:developer';

import 'package:chargemod_assignment/utilities/api_base_helper.dart';
import 'package:chargemod_assignment/utilities/api_constants.dart';
import 'package:http/http.dart' as http;

class LoginRepo{

  static Future<bool> sendOTP(String phoneNumber) async {
    APIBaseHelper helper = APIBaseHelper();
    try {
      http.Response response = await helper.postRequest(ApiStringConstants.signIn, isAuthTokenRequired: false, queryParam: {'mobile' : phoneNumber.toString()});
      return response.statusCode>=200 && response.statusCode<=300;
    } catch (e){
      log(e.toString());
      return false;
    }
  }

  static Future<dynamic> verifyOTP(String phoneNumber, String otp) async {
    APIBaseHelper helper = APIBaseHelper();
    try {
      http.Response response = await helper.postRequest(ApiStringConstants.verifyOTP, isAuthTokenRequired: false, queryParam: {'mobile' : phoneNumber.toString(), 'otp' : otp.toString()});
      return response;
    } catch (e){
      log(e.toString());
      return false;
    }
  }

  static Future<bool> resendOTP(String phoneNumber) async {
    APIBaseHelper helper = APIBaseHelper();
    try {
      http.Response response = await helper.postRequest(ApiStringConstants.resendOTP, isAuthTokenRequired: false, queryParam: {'mobile' : phoneNumber.toString(), 'type' : "text"});
      return response.statusCode>=200 && response.statusCode<=300;
    } catch (e){
      log(e.toString());
      return false;
    }
  }
}