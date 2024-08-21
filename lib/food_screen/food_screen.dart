import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hunger_race/food_api/food_api.dart';
import 'package:hunger_race/food_list_model/food_list.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  List<Meals> data = [];
  getdata() async {
    data = await FoodApi.foodapi();
    log("data=${data.length}");
    setState(() {});
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.menu, size: 30, color: Colors.red),
        title: const Text("Hunger Stall", style: TextStyle(color: Colors.red)),
        centerTitle: true,
        actions: const [Icon(Icons.notifications, size: 30, color: Colors.red)],
      ),
      body: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            childAspectRatio: 3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.red),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network("${data[index].strMealThumb}"),
                      ),
                      Expanded(child: Text("${data[index].strMeal}",style: const TextStyle(color: Colors.black,fontSize: 17),)),
                      Text("${data[index].idMeal}",style: const TextStyle(color: Colors.black,fontSize: 17)),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
