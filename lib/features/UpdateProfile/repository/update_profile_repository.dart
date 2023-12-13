import 'dart:developer';

import 'package:chargemod_assignment/utilities/api_base_helper.dart';
import 'package:chargemod_assignment/utilities/api_constants.dart';
import 'package:http/http.dart' as http;

class UpdateProfileRepo{
  static Future<dynamic> registerUser(String phoneNumber, String firstName, String lastName, String email) async {
    APIBaseHelper helper = APIBaseHelper();
    try {
      http.Response response = await helper.postRequest(ApiStringConstants.register, isAuthTokenRequired: false, queryParam: {'mobile' : phoneNumber.toString(), 'firstName' : firstName, 'lastName': lastName, 'email': email});
      return response;
    } catch (e){
      log(e.toString());
      return false;
    }
  }
}