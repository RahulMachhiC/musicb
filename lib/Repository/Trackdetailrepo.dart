import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:musicb/Models/Trackdetail.dart';

abstract class TrackdetailRepo {
  Future<Trackdetail> gettrackdetail(int trackid);
}

class TrackdetailImpl extends TrackdetailRepo {
  @override
  Future<Trackdetail> gettrackdetail(int trackid) async {
    print("Calling Api");
    final url =
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackid&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";
    print(url);
    var responce = await http.get(url);
    print(responce);
    if (responce.statusCode == 200) {
      var jsonresponce = convert.jsonDecode(responce.body);
      return Trackdetail.fromJson(jsonresponce);
    } else {
      throw new Exception('error getting quotes');
    }
  }
}
