import 'package:flutter/material.dart';
import 'package:quiz_app_design/helpers/color_helper.dart';

class CustomOutlineBtn extends StatelessWidget {
    CustomOutlineBtn({super.key, required this.icon,this.bordercolor=kGreyFont,this.colorIcon, required this.size,this.onpress});
  final IconData icon;
  final double size;
  Color? colorIcon=Colors.white;
  Color bordercolor ;
  void Function()? onpress;
  
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed:onpress?? () {},
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(),
        foregroundColor: bordercolor,
        side: BorderSide(color: bordercolor),
        padding: EdgeInsets.all(10),
      ),
      child: Icon(icon, size: size,color: colorIcon,),
    );
  }
}
