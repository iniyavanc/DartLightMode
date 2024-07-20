import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'ResponseModel/LoginResponse.dart';
import 'ResponseModel/MoviesListResponse.dart';

class ApiConnect extends GetConnect {
  @override
  void onInit() {
    super.allowAutoSignedCert = true;
    super.onInit();
    httpClient.addResponseModifier((request, response) {
      debugPrint("------------ AUTH ------------");
      debugPrint(
          "REQUEST METHOD: ${request.method} ; ENDPOINT:  ${request.url}");
      debugPrint("RESPONSE : ${response.bodyString}");
      return response;
    });
  }

  Future<MoviesListResponse> getMovieCall() async {
    var response = await get(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=f69b3a2976aadcfd3219753c3c6f7898');
    if (response.body == null) throw Exception('no data');
    print(response.body);
    return MoviesListResponse.fromJson(response.body);
  }

  Future<LoginResponse> loginCall(Map<String, dynamic> payload) async {
    FormData formData = FormData(payload);
    var response = await post(
        'https://api.themoviedb.org/3/authentication/token/validate_with_login',
        formData);
    if (response.body == null) throw Exception('NO Values');
    return LoginResponse.fromJson(response.body);
  }
}
