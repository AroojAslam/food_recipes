import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_recipes/view/view_recipe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MealTypes extends StatefulWidget {

  var strCategory;
  var strCategoryDescription;
  MealTypes({super.key,
    required this.strCategory,
    required this.strCategoryDescription});

  @override
  State<MealTypes> createState() => _MealTypesState();
}

class _MealTypesState extends State<MealTypes> {
  List<String> buildIngredientArray(Map<String, dynamic> meal) {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = meal['strIngredient$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      } else {
        break;
      }
    }
    return ingredients;
  }

  List<String> buildMeasureArray(Map<String, dynamic> meal) {
    List<String> measures = [];
    for (int i = 1; i <= 20; i++) {
      final measure = meal['strMeasure$i'];
      if (measure != ' ' && measure.isNotEmpty) {
        measures.add(measure);
      } else {
        break;
      }
    }
    return measures;
  }

  List mealData=[];
  Future<List<dynamic>> fetchmeals()async{
    var data;
    final response=await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=${widget.strCategory.toString()}'));
    if(response.statusCode==200){
      data=jsonDecode(response.body);
      mealData = data['meals'];
      return mealData;
    }else{
      throw Exception('Error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.strCategory.toString(),style:const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon:const Icon(Icons.keyboard_backspace_outlined,color: Colors.white),
        ),

      ),
      body: Column(
        children: [

          FutureBuilder(
            future:fetchmeals() ,
            builder: (context,AsyncSnapshot<List<dynamic>> snapshot) {
            if(!snapshot.hasData){
              return const Expanded(
                child: Align(
                  alignment: Alignment(0,0),
                    child: CircularProgressIndicator()),
              );
            }else {
              return Expanded(
                    child: ListView.builder(
                itemCount: mealData.length,
                itemBuilder: (context, index) {
                    return Card(
                      margin:const EdgeInsets.only(top: 10,left: 10,right: 10),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          onTap:(){
                          Get.to(
                              ViewRecipe(
                              strInstructions: mealData[index]['strInstructions'],
                              strMealThumb:mealData[index]['strMealThumb'],strMeal:mealData[index]['strMeal'],
                              ingredients: buildIngredientArray(mealData[index]),
                              measures:buildMeasureArray(mealData[index]),
                          ));
                          },
                          leading: Container(
                              height: Get.height*0.1,
                            width: Get.width*0.14,
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(

                                image: NetworkImage(mealData[index]['strMealThumb'])
                              )
                            ),
                          ),
                          title: Text(mealData[index]['strMeal']),
                        ),
                      ),
                    );
                },
              ),
                  );
            }
          },)
        ],
      ),
    );
  }
}
