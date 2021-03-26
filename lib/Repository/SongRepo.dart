import 'package:musicb/Models/Song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class SongRepo {
  Future<Lyrics> getsong(int trackid);
}

class Songimpl extends SongRepo {
  @override
  Future<Lyrics> getsong(int trackid) async {
    print("Calling Song Api");
    final url =
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackid&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";
    print(url);
    var responce = await http.get(url);
    print(responce);
    if (responce.statusCode == 200) {
      var jsonresponce = convert.jsonDecode(responce.body);
      return Lyrics.fromJson(jsonresponce);
    } else {
      throw Exception("Error To Calling Api");
    }
  }
}
