
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: Get.width,
      height: Get.height*0.55,
      decoration: BoxDecoration(
        borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)
        ),
        color: Theme.of(context).primaryColor.withOpacity(0.11),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                height:Get.height*0.3,
                width: Get.width*0.6,
                image: AssetImage('assets/images/logo.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text('Good Food, Good Mood',style: TextStyle(color: Theme.of(context).primaryColor,
                  fontSize: 25,fontWeight: FontWeight.w700)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text('Good food warms the heart and feeds the soul',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
