import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottom_Sheet extends StatelessWidget {
  const Bottom_Sheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: (){
      Get.bottomSheet(
        backgroundColor: Theme.of(context).primaryColor,
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  Get.changeTheme(ThemeData.light());
                },
                title: Text('Light Mode',style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.light_mode,color: Colors.white),
              ),
              ListTile(
                onTap: (){
                  Get.changeTheme(ThemeData.from(colorScheme:  ColorScheme.fromSeed(seedColor: Colors.orangeAccent)));
                },
                title:const Text('Default Mode',style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.brush_outlined,color: Colors.white),
              ),
              ListTile(
                onTap: (){
                  Get.changeTheme(ThemeData.dark());
                },
                title: Text('Dark Mode',style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.dark_mode,color: Colors.white),
              ),
            ],
          ),
        ),

      );
    }, icon:const Icon(Icons.more_vert_outlined,color: Colors.white));
  }
}
