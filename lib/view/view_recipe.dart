import 'package:flutter/material.dart';

class ViewRecipe extends StatefulWidget {
  var strInstructions;
   ViewRecipe({super.key,required this.strInstructions});

  @override
  State<ViewRecipe> createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(widget.strInstructions),
          ],
        ),
      ),
    );
  }
}
