import 'dart:convert';
import 'dart:developer';

import 'package:chargemod_assignment/utilities/api_constants.dart';
import 'package:chargemod_assignment/utilities/shared_prefs.dart';
import 'package:http/http.dart' as http;

class APIBaseHelper{
  Future<dynamic> getRequest(String endPoint ,{var queryParam, required bool isAuthTokenRequired}) async {
    if(isAuthTokenRequired){
      String token = await SharedPrefs().getStringFromCache(SharedPrefs.authToken);
      if(queryParam == null) {
        queryParam = {'Authorization': 'Bearer $token'};
      } else {
        queryParam.addAll(
          {'Authorization': 'Bearer $token'}
      );
      }
    }
    final http.Response response = await http.get(
        Uri.parse(ApiStringConstants.domain + ApiStringConstants.pathVariables + endPoint),
        headers: queryParam
    );
    log("***********************GET***********************");
    log("GET = ${ApiStringConstants.domain}${ApiStringConstants.pathVariables}$endPoint");
    log(response.statusCode.toString());
    log(response.body.toString());
    return response;
  }

  Future<dynamic> postRequest(String endPoint, {var queryParam, var headers, required bool isAuthTokenRequired}) async {
    String token = await SharedPrefs().getStringFromCache(SharedPrefs.authToken);
    var _headers = {
      "Content-Type" : "application/json",
      if(isAuthTokenRequired) 'Authorization': 'Bearer $token'
    };
    if(headers != null) _headers.addAll(headers);
    final http.Response response = await http.post(
      Uri.parse(ApiStringConstants.domain + ApiStringConstants.pathVariables + endPoint),
      body: json.encode(queryParam),
      headers: _headers,
    );
    log("***********************POST***********************");
    log("POST = " + ApiStringConstants.domain + ApiStringConstants.pathVariables + endPoint);
    log("Headers = $headers");
    log("Query Params = $queryParam");
    log(response.statusCode.toString());
    log(response.body.toString());
    return response;
  }
}