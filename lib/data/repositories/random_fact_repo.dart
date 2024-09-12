import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class RandomFactRepo {
  static Future<Map<String, String>> getRandomFact() async {
    var client = http.Client();
    try {
      var uri = Uri.http('numbersapi.com', '/1..100');
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
        var factsMap = decodedResponse
            .map((key, value) => MapEntry(key, value.toString()));
        return factsMap;
      } else {
        throw Exception('Failed to load facts');
      }
    } catch (e) {
      developer.log(e.toString());
      throw Exception('Error occurred: $e');
    } finally {
      client.close();
    }
  }
}
