import 'package:quiz_app_design/logic/multichoise/multiple_question.dart';

class MultipleQuestionBrain {
  int question_number = 0;
  // مؤشر رقم السؤال الحالي (0 يعني أول سؤال)

    List<MultipleQuestion> multipleQuestionBank=[]  ;

  MultipleQuestionBrain(List<MultipleQuestion> newMultipleQuestionBank){
    multipleQuestionBank= newMultipleQuestionBank;
  } 

// list of multiple choise questions

  bool isFinish() {
    // ترجع true إذا كنا عند آخر سؤال (المؤشر يساوي طول القائمة-1)
    return question_number == multipleQuestionBank.length - 1;
  }

  void nextQuestion() {
    // الانتقال للسؤال التالي بزيادة المؤشر واحدًا
    ++question_number;
  }

  String getQuestionText() {
    // إرجاع نص السؤال الحالي
    return multipleQuestionBank[question_number].questionText;
  }

  bool checkAnswer(int userAnswer) {
    // مقارنة إجابة المستخدم (index) بالإجابة الصحيحة (index)
    return multipleQuestionBank[question_number].answerOptionNumber == userAnswer;
  }

  List<String> getQuestionOptions() {
    // إرجاع قائمة الخيارات للسؤال الحالي
    return multipleQuestionBank[question_number].options;
  }

  void reset() {
    // إعادة المؤشر إلى أول سؤال (لبدء الاختبار من جديد)
    question_number = 0;
  }
}