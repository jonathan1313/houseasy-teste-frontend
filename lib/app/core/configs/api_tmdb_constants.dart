class ApiTmdbConstants {
  static const String _apiKey = '8d0f66fe22c86d6351120e12132ec4c5';
  static String baseUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey';
  static String listForPopularity = '&sort_by=popularity.desc&include_adult=false&page=';
  static String requestImg(String img) =>
      'https://image.tmdb.org/t/p/w500/$img';
}
