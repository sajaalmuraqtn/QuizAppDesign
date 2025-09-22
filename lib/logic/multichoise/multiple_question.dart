class MultipleQuestion {
  final String questionText;
  // نص السؤال

  final int answerOptionNumber;
  // رقم الخيار الصحيح (index يبدأ من 0 داخل قائمة options)

  final List<String> options;
  // قائمة كل الخيارات لهذا السؤال بالترتيب

  MultipleQuestion( 
      // named constructor to take the  questionText and options and answerOptionNumber

    this.options, 
    {
      required this.questionText,      
      required this.answerOptionNumber,   
    }
  );
}