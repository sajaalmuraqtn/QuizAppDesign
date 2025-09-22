import 'package:flutter/material.dart';
import 'package:quiz_app_design/helpers/color_helper.dart';
import 'package:quiz_app_design/helpers/data_center.dart';
import 'package:quiz_app_design/logic/level.dart';
import 'package:quiz_app_design/screens/quiztionScreen.dart';
import 'package:quiz_app_design/widgets/custom_outline_btn.dart';
import 'package:quiz_app_design/widgets/level_widget.dart';
import 'package:quiz_app_design/widgets/level_status_btn.dart';

class LevelDesriptionScreen extends StatelessWidget {
  const LevelDesriptionScreen({super.key, required this.level});
  final Level level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
         decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: level.colors,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: CustomOutlineBtn(
                      icon: Icons.close,
                      size: 25,
                      bordercolor: Colors.white,
                      onpress: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Center(child: Image.asset('assets/${level.image}', width: 200)),
                SizedBox(height: 50),
                Text(level.subtitle, style: TextStyle(color: Colors.white)),
                Text(
                  level.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                
                Text(
                  level.description ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuiztionScreen(level: level),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(25),
                    ),
                    child: Text(
                      'Game',
                      style: TextStyle(color: level.colors[0]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
