class QueryParametersHelper {
  static Map<String, String> map(Map<String, dynamic> request) {
    return request.map((key, value) => MapEntry(key, value.toString()));
  }
}