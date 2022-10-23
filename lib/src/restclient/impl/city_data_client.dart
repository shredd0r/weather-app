import 'dart:convert';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:weather_app/src/dto/getcode/request/get_code_request.dart';
import 'package:weather_app/src/dto/getcode/response/get_code_response.dart';
import 'package:weather_app/src/restclient/base/base_rest_executor.dart';
import 'package:weather_app/src/utils/QueryParametersHelper.dart';


class GeoCodeExecutor extends BaseRestExecutor {

  GeoCodeExecutor() : super("https://api.bigdatacloud.net/data/reverse-geocode-client", "GeoCodeExecutor");

  Future<GetCodeResponseDto> getCityInfo(GetCodeRequestDto requestDto) async {
    var uri = Uri.parse(path);
    uri.replace(queryParameters: QueryParametersHelper.map(requestDto.toJson()));

    FlutterLogs.logInfo("weather-app", executorName, "uri: ${uri.toString()}");
    var response = await client.get(uri);

    return GetCodeResponseDto
        .fromJson(jsonDecode(checkResponseStatusEndReturnResponseBody(response)));
  }
}
