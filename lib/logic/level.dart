import 'package:flutter/cupertino.dart';
import 'package:quiz_app_design/logic/multichoise/multiple_question.dart';

class Level{
final String  title;//العنوان
final String  subtitle;// العنوان الفرعي
final String  image;//الصورة
final String  description;//الوصف
final IconData icon;//الايقونى
final List<Color> colors;//اللون
final List<MultipleQuestion> questions;//قائمة الاسئلة الاختيار من متع

Level({required this.title,required this.subtitle,required this.image,required this.description,required this.icon,required this.colors,required this.questions});
//named constructor

}