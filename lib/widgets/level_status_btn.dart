import 'package:flutter/material.dart';

class LevelStatusBtn extends StatelessWidget {
  const LevelStatusBtn({
    super.key, required this.icon,

  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: () {}, 
    style: OutlinedButton.styleFrom(
      minimumSize: Size(40, 40),
      side: BorderSide(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(8)
    ),
    child: Icon(icon,color: Colors.white,)
    
     );
  }
}
