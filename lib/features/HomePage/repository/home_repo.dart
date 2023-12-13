import 'dart:convert';
import 'dart:developer';

import 'package:chargemod_assignment/features/HomePage/Models/ChargerLocation.dart';
import 'package:chargemod_assignment/utilities/api_base_helper.dart';
import 'package:chargemod_assignment/utilities/api_constants.dart';
import 'package:http/http.dart' as http;

class HomeRepo{

  static Future<dynamic> getLocations() async {
    APIBaseHelper helper = APIBaseHelper();
    List<ChargerLocation> locationsList = [];
    // try {
    //
    // } catch (e){
    //   log(e.toString());
    //   return false;
    // }
    http.Response response = await helper.getRequest(ApiStringConstants.getLocations, isAuthTokenRequired: true);
    var data = (jsonDecode(response.body))['data']['result'];
    for(int i=0 ; i<data.length ; i++){
      locationsList.add(ChargerLocation.fromJson(data[i]));
    }
    return locationsList;
  }

}