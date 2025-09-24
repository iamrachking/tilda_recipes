const String apiBaseUrl = "http://192.168.1.64/api/";
String fixImageUrl(String url) {
  return url.replaceFirst("tilda_api_laravel.test", "192.168.1.64");
}
