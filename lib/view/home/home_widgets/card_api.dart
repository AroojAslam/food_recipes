import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_recipes/model/Categories.dart';
import 'package:food_recipes/view/meal_types.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class CardAPI extends StatelessWidget {
  const CardAPI({super.key});
  Future<List<Categories>> fetchCategories() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> categoriesData = jsonData['categories'];
      return categoriesData.map((category) => Categories.fromJson(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<Categories>>(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              children: [
                CircularProgressIndicator()
              ],
            ),
          );
        }
        else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final categories = snapshot.data;

          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories!.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return  Container(
                  margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Image(
                            height: 100,
                            width: 100,
                            image: NetworkImage(category.strCategoryThumb)),
                        Text(category.strCategory,style:const TextStyle(
                            fontSize: 16,fontWeight: FontWeight.w600
                        )),
                        const  SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: (){
                            Get.to(MealTypes(strCategoryDescription: category.strCategoryDescription,strCategory: category.strCategory,
                            ));
                          },
                          child:const Text('View'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
