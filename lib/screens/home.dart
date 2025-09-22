import 'package:flutter/material.dart';
import 'package:quiz_app_design/helpers/color_helper.dart';
import 'package:quiz_app_design/helpers/data_center.dart';
import 'package:quiz_app_design/logic/level.dart';
import 'package:quiz_app_design/screens/leve_description_screen.dart';
import 'package:quiz_app_design/widgets/custom_outline_btn.dart';
import 'package:quiz_app_design/widgets/level_widget.dart';
import 'package:quiz_app_design/widgets/level_status_btn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          actions: [
          CustomOutlineBtn(icon: Icons.favorite, size: 20,colorIcon: kblueIcon,),
          CustomOutlineBtn(icon: Icons.person, size: 25,colorIcon: kblueIcon,),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let`s Start",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kRedFontColor,
              ),
            ),

            Text(
              "Be the first!",
              style: TextStyle(fontSize: 18, color: kGreyFont),
            ),

            Expanded(
              //لحتى تاخذ المتاح من الشاشة وماتعمل مشاكل
              child: ListView.builder(
                itemCount: levels.length,

                itemBuilder: (context, levelIndex) {
                  return InkWell
                  (//رح ياخذني لصفحة وياخذ عدة معلومات levelلما اضغط على ال 
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LevelDesriptionScreen(level: levels[levelIndex]),
                              // اللي رح يعرضها بالصفحة التالية levelهون اعطيتو كل معلومات ال 
                              //بقدر ابعثلو معلومات معينة بدل ما ابعثلو كل المعلومات
                        ),
                      );
                    },
                    child: levelWidget(level: levels[levelIndex]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
