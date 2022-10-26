import 'dart:convert';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:weather_app/src/dto/geocoding/request/geocoding_request.dart';
import 'package:weather_app/src/dto/geocoding/response/geocoding_response.dart';
import 'package:weather_app/src/restclient/base/base_rest_executor.dart';
import 'package:weather_app/src/utils/QueryParametersHelper.dart';

class GeocodingExecutor extends BaseRestExecutor {

  GeocodingExecutor() : super("https://api.api-ninjas.com/v1/geocoding", "GeocodingExecutor");

  Future<List<GeocodingResponseDto>> getGeocodingInfo(GeocodingRequestDto requestDto, String apiKey) async{
    var uri = Uri.parse(path);
    uri.replace(queryParameters: QueryParametersHelper.map(requestDto.toJson()));

    FlutterLogs.logInfo("GeocodingExecutor", executorName, "uri: ${uri.toString()}");

    var response = await client.get(uri, headers: {"X-Api-Key" : apiKey});

    Iterable iterableResponse = jsonDecode(checkResponseStatusEndReturnResponseBody(response));
    return List<GeocodingResponseDto>.from(iterableResponse.map((dto)=> GeocodingResponseDto.fromJson(dto)));
  }
}