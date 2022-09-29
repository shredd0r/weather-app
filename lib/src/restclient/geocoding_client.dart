import 'dart:convert';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:http/http.dart';
import 'package:weather_app/src/dto/geocoding/request/geocoding_request.dart';
import 'package:weather_app/src/dto/geocoding/response/geocoding_response.dart';
import 'package:weather_app/src/utils/QueryParametersHelper.dart';

class GeocodingExecutor {

  final Client _client = Client();
  final String _path = "https://api.api-ninjas.com/v1/geocoding";

  Future<List<GeocodingResponseDto>> getGeocodingInfo(GeocodingRequestDto requestDto, String apiKey) async{
    var uri = Uri.parse(_path);
    uri = Uri(
        scheme: uri.scheme,
        host: uri.host,
        path: uri.path,
        queryParameters: QueryParametersHelper.map(requestDto.toJson()));

    FlutterLogs.logInfo("GeocodingExecutor", "getGeocodingInfo", "uri: ${uri.toString()}");

    var response = await _client.get(uri, headers: {"X-Api-Key" : apiKey});

    if (response.statusCode == 200) {
      FlutterLogs.logInfo("GeocodingExecutor", "getGeocodingInfo", "status: ${response.statusCode}, body: ${response.body}");

      Iterable iterableResponse = jsonDecode(response.body);
      return List<GeocodingResponseDto>.from(iterableResponse.map((dto)=> GeocodingResponseDto.fromJson(dto)));
    }

    throw "Http error ${response.statusCode}, body: ${response.body}";
  }
}