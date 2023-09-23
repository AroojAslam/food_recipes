


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewRecipe extends StatefulWidget {
  var strCategory;
  var strCategoryDescription;
   ViewRecipe({super.key,
  required this.strCategory,
   required this.strCategoryDescription});

  @override
  State<ViewRecipe> createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
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
          Container(
            height: 300,
            width: Get.width,
            child: Text(widget.strCategoryDescription.toString()),
          ),
        ],
      ),
    );
  }
}
