import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewRecipe extends StatefulWidget {
  var strInstructions;
  final List<String> ingredients;
  final List<String> measures;
  var strMealThumb;
  var strMeal;
   ViewRecipe({super.key,
     required this.strInstructions,
     required this.strMealThumb,
     required this.strMeal,
     required this.ingredients,
    required this.measures,
   });

  @override
  State<ViewRecipe> createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text( widget.strMeal.toString(),style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.keyboard_backspace_outlined,color: Colors.white),
        ),

      ),
      body: SafeArea(
        child:  SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding:const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.strMealThumb.toString()),
                          )
                        ),
                      ),
                 const   SizedBox(height: 16),
                   Text('Ingredients:',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const  SizedBox(height: 8),
                    SizedBox(
                     width:  Get.width,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                 widget.ingredients.take(20).join('\n'),
                                  style:const TextStyle(fontSize: 16),
                                ),
                               SizedBox(width: Get.width*0.1,),
                               Text( widget.measures.take(20).join('\n'),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  const  SizedBox(height: 16,),
                   Text(
                      'Instructions:',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const  SizedBox(height: 8),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.strInstructions,
                          style:const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
