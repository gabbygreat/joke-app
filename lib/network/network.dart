import 'dart:convert';

import 'package:api_demo/model/joke_model.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'https://v2.jokeapi.dev';

class GetRequest {
  static Future<JokeModel?> getJokes(String category) async {
    Uri jokeUri = Uri.parse('$baseUrl/joke/$category');
    try {
      final request = await http.get(jokeUri);
      if (request.statusCode == 200) {
        final response = jsonDecode(request.body);
        final result = JokeModel.fromMap(response);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
