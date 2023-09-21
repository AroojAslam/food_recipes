import 'package:flutter/material.dart';
import 'package:food_recipes/view/widgets/bottom_text.dart';
import 'package:get/get.dart';
import 'widgets/card_api.dart';
import 'widgets/main_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:const Text(
          "Food Recipes",style: TextStyle(color: Colors.white),
        ),
        leading:const Icon(Icons.restaurant_menu_outlined,color: Colors.white),
        actions: [
          IconButton(onPressed: (){
            Get.bottomSheet(
              backgroundColor: Theme.of(context).primaryColor,

             Column(
               children: [
                 ListTile(
                   onTap: (){
                         Get.changeTheme(ThemeData.light());
                   },
                   title: Text('Light Mode'),
                   leading: Icon(Icons.light_mode),
                 ),
                 ListTile(
                   onTap: (){
                     Get.changeTheme(ThemeData.from(colorScheme:  ColorScheme.fromSeed(seedColor: Colors.orangeAccent)));
                   },
                   title:const Text('Default Mode'),
                   leading: Icon(Icons.light_mode),
                 ),
                 ListTile(
                   onTap: (){
                    Get.changeTheme(ThemeData.dark());
                   },
                   title: Text('Dark Mode'),
                   leading: Icon(Icons.dark_mode),
                 ),
               ],
             )

            );
          }, icon:const Icon(Icons.more_vert_outlined,color: Colors.white))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
           MainContainer(),
         CardAPI(),
          BottomText(),
          ],
        ),
      ),
    );
  }
}
