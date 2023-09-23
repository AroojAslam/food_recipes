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
        title: Text(widget.strCategory.toString()+' Recipe',style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.keyboard_backspace_outlined,color: Colors.white),
        ),

      ),
      body: Column(
        children: [

          FutureBuilder(
            future:fetchmeals() ,
            builder: (context,AsyncSnapshot<List<dynamic>> snapshot) {
            if(!snapshot.hasData){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator()
                  ],
                ),
              );
            }else {
              return Expanded(
                    child: ListView.builder(
                itemCount: mealData.length,
                itemBuilder: (context, index) {

                    return Card(
                      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          onTap:(){
                          Get.to(ViewRecipe(strInstructions: mealData[index]['strInstructions'],));
                          },
                          leading: Image(
                            width: 50,
                              height: 100,
                              image: NetworkImage(mealData[index]['strMealThumb'])),
                          title: Text(mealData[index]['strMeal']),
                          // You can add more widgets to display other meal data fields
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