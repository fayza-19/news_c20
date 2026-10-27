import 'package:flutter/material.dart';

import '../../core/colorsmanager/colorsmanager.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key, required this.onGoToHomeClicked});
  void Function() onGoToHomeClicked;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.black,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              height: 166,
              width: double.infinity,
              color: ColorsManager.white,
              child: Text("News App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: ColorsManager.black),)),
          SizedBox(height: 16,),
          InkWell(
            onTap: (){
              print("Hiiii");
              onGoToHomeClicked();
            },
            child: Row(
              children: [
                Icon(Icons.home_outlined, color: ColorsManager.white,),
                SizedBox(width: 8,),
                Text("Go to home",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: ColorsManager.white))
              ],
            ),
          )
        ],
      ),
    );
  }
}