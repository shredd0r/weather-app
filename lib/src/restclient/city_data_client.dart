import 'dart:convert';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:http/http.dart';
import 'package:weather_app/src/dto/getcode/get_code_request.dart';
import 'package:weather_app/src/dto/getcode/get_code_response.dart';
import 'package:weather_app/src/utils/QueryParametersHelper.dart';

class GeoCodeExecutor {

  final Client _client = Client();
  final String _path = "https://api.bigdatacloud.net/data/reverse-geocode-client";


  Future<GetCodeResponseDto> getCityInfo(GetCodeRequestDto requestDto) async {
    var uri = Uri.parse(_path);
    uri = Uri(
      scheme: uri.scheme,
      host: uri.host,
      path: uri.path,
      queryParameters: QueryParametersHelper.map(requestDto.toJson()));

    FlutterLogs.logInfo("GetCode", "getCityInfo", "uri: ${uri.toString()}");
    var response = await _client.get(uri);

    if (response.statusCode == 200) {
      FlutterLogs.logInfo("GetCode", "getCityInfo", "status: ${response.statusCode}, body: ${response.body}");

      return GetCodeResponseDto.fromJson(jsonDecode(response.body));
    }

    throw "Http error ${response.statusCode}, body: ${response.body}";
  }
}