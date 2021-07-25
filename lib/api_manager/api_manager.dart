import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/api_models.dart';
import '../api_strings/Strings.dart';

// ignore: camel_case_types
class API_Manager {
  Future<Data> getData() async {
    var client = http.Client();
    var checkData;

    try {
      //oi beta ei vabe dise;
      var response = await client.get(Uri.parse(Strings.api_url));
      // var response = await client.get(Uri.parse(Strings.news_url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        checkData = Data.fromJson(jsonMap);
        print(jsonMap);
      }
    } catch (Exception) {
      return checkData;
    }

    return checkData;
  }
}
