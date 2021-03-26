import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:musicb/Models/Music.dart';

abstract class LyricsRepo {
  Future<Music> gettrack();
}

class LyricsImpl extends LyricsRepo {
  @override
  Future<Music> gettrack() async {
    print("CALLING API");
    final url =
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7';
    print(url);
    var response = await http.get(url);
    print(response);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Music.fromJson(jsonResponse);
    } else {
      throw new Exception('error getting quotes');
    }
  }
}
