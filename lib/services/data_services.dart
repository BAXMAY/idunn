import 'dart:convert';

import 'package:flutter_app/app/models/data.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<Data>> getInfo() async {
    var apiUrl = '/getplaces';

    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => Data.fromJson(e)).toList();
      } else {
        return <Data>[];
      }
    } catch (e) {
      print(e);
      return <Data>[];
    }
  }
}
