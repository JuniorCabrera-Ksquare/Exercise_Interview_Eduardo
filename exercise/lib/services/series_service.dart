import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SerieService {
  String url = 'https://api.tvmaze.com/shows?page=1';

  Future<List> getShows() async {
    var uri = Uri.parse(url);
    Response res = await http.get(uri);
    var decRes = jsonDecode(res.body);
    return decRes;
  }
}
