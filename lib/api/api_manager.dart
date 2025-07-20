import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Reciters.dart';
class ApiManager {

  static Future<Reciters> getSources() async {
    Uri uri = Uri.https('mp3quran.net', '/api/v3/radios', {

      "language": 'eng'
    });
    var response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    Reciters recitersResponse = Reciters.fromJson(json);
  return recitersResponse;

}



}