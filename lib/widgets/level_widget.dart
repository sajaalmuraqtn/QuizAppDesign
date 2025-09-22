import 'package:flutter/material.dart';
import 'package:quiz_app_design/logic/level.dart';
 import 'package:quiz_app_design/widgets/level_status_btn.dart';

class levelWidget extends StatelessWidget {
  final Level level;
  const levelWidget({
    super.key,
    required this.level
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children:
     [  Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 50),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: level.colors),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: LevelStatusBtn(icon: level.icon),
            ),
            SizedBox(height: 12),
            Text(
              level.subtitle,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 8),
    
            Text(
             level.title,
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Image(image: AssetImage("assets/${level.image}"),height: 120,width: 120,),
      )
      ]
    );
  }
}
