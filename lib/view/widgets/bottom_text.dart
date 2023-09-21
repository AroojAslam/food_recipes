import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child:  Align(
        alignment: Alignment.bottomCenter,
        child: Text('What you want to cook today',style: TextStyle(color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600)),
      ),
    );
  }
}
