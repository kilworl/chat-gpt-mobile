import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:gpt_app/constants/api_consts.dart';
import 'package:gpt_app/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );
      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        //print("jsonResponse['error']${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      //print("jsonResponse$jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        print("temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log("error$error" as num);
      rethrow;
    }
  }
}
