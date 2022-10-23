import 'package:flutter_logs/flutter_logs.dart';
import 'package:http/http.dart';


class BaseRestExecutor {

  final Client client = Client();
  late String path;

  late String executorName;

  BaseRestExecutor(this.path, this.executorName);

  String checkResponseStatusEndReturnResponseBody(Response response) {
    if (response.statusCode == 200) {
      FlutterLogs.logInfo("weather-app", executorName, "status code: ${response.statusCode.toString()}");
      FlutterLogs.logInfo("weather-app", executorName, "body: ${response.body}");

      return response.body;
    }

    throw "Http error: ${response.statusCode}, body: ${response.body}";
  }
}