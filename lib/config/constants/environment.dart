import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String theMovieDbKey = dotenv.env["MOVIEDB_KEY"] ?? "NO_KEY";
  static String apiUrl = dotenv.env["API_URL"] ?? "No hay URL";
  static String language = dotenv.env["LANGUAGE"] ?? "No hay lenguaje";
}