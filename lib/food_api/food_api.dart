import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hunger_race/food_list_model/food_list.dart';


class FoodApi {
  static Future<List<Meals>>foodapi() async {
    try {
      Response response = await http.get(Uri.parse(
          "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"));
      log("Response: ${response.statusCode}");
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        food_list data = food_list.fromJson(decodeData);
        log(
            "===================");
        log("${data.meals?.length}");
        // if(data.products != null){
        //   return data.products!;
        // }
        return data.meals ?? [];
      }
    } catch (e) {
      log("Error: $e");
    }

    return [];
  }
}