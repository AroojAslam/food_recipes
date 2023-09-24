import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_widgets/bottom_sheet.dart';
import 'home_widgets/bottom_text.dart';
import 'home_widgets/card_api.dart';
import 'home_widgets/main_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
      SystemNavigator.pop();
      return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title:const Text(
            "Food Recipes",style: TextStyle(color: Colors.white),
          ),
          leading:const Icon(Icons.restaurant_menu_outlined,color: Colors.white),
          actions:const [
           Bottom_Sheet(),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
           const  MainContainer(),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: Align(alignment: Alignment.centerLeft,
            child: Text('Categories',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w600,fontSize: 16),)),
          ),
         const  CardAPI(),
           const BottomText(),
            ],
          ),
        ),
      ),
    );
  }
}
