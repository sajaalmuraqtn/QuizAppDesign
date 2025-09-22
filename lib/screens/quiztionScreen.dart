import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app_design/logic/level.dart';
import 'package:quiz_app_design/logic/multichoise/multiple_question_brain.dart';
import 'package:quiz_app_design/screens/home.dart';
import 'package:quiz_app_design/widgets/custom_outline_btn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuiztionScreen extends StatefulWidget {
  const QuiztionScreen({super.key, required this.level});

  final Level level;

  @override
  State<QuiztionScreen> createState() => _QuiztionScreenState();
}

class _QuiztionScreenState extends State<QuiztionScreen> {
  @override
  int _start = 10; // الوقت الابتدائي لكل سؤال = 10 ثواني
  late Timer _timer; //  رح يشتغل كل ثانيةمؤقت (Timer)
  int? selectedIndex;
  late MultipleQuestionBrain mquizBrain;
  int score = 0;
  bool isFinish = false;

  @override
  void initState() {
    // فنكشن رح يشتغل اول ما تفتح الصفحة
    super.initState();
    startTimer(); // استدعاء وظيفة المؤقت عند بدء الشاشة
    mquizBrain = MultipleQuestionBrain(widget.level.questions);
    //اللي احنا فيه level رح ياخذ قائمة الأسئلة الخاصة بال  MultipleQuestionBrain من نوع  object عبارة عن
  }

  @override
  void dispose() {
    // فنكشن رح يشتغل اول ما تغلق الصفحة
    _timer.cancel(); //عن اغلاق الشاشة timer إيقاف الـ
    super.dispose();
  }

  void closeFunction() {
    mquizBrain.reset();
    score = 0;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void whenFinish() {
    _timer.cancel();
    // أول ما ينتهي الاختبار → يوقف العدّاد الزمني عشان ما يضل ينقص وهو مش ضروري.
    if (score > (widget.level.questions.length / 2).truncate()) {
      // إذا نتيجة المستخدم أكبر من نص عدد الأسئلة (يعني جاوب صح أكثر من نصف الامتحان) → يعتبر ناجح.
      // غير هيك → يعتبر راسب.
      Alert(
        context: context,
        type: AlertType.success,
        title: "Congrutlation Successed in ${widget.level.title}",
        desc: "Your Score $score/${widget.level.questions.length}",
        
        buttons: [
          DialogButton(
            onPressed: () => closeFunction(),
            color: Colors.red,
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
        closeFunction: () => closeFunction(),
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Failed in ${widget.level.title}",
        desc: "Your Score $score/5",
        buttons: [
          DialogButton(
            onPressed: () => closeFunction(),
            color: Colors.red,
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
        closeFunction: () => closeFunction(),
      ).show();
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        // اذا وصل المؤقت للصفر

        if (mquizBrain.isFinish()) {
          // اذا خلصت الاسلة
          whenFinish(); //رح ينفذ كود النهاية
        } else {
          // اذا ما خلصت الاسئلة رح يروح للسؤال التالي
          // ويرجع العداد من اول
          setState(() {
            mquizBrain.nextQuestion();
            _start = 10;
          });
        }
      } else {
        //اذا لسا العا شغال نقصو بواح
        setState(() {
          _start--;
        });
      }
    });
  }

  void addUserScore(int userAnswer) {
    if (mquizBrain.isFinish()) {
      //هل الاختبار انتهى
      mquizBrain.checkAnswer(userAnswer)
          ? ++score
          : ''; //رح تزود النتيجة اذا كانت صح

      whenFinish();
      //  فنكشن اللي بتوقف التايمر وتظهر رسالة النتيجة (نجاح أو فشل).
    } else {
      Future.delayed(Duration(seconds: 1), () {
        // يعمل تأخير ثانية وحدة قبل الانتقال للسؤال اللي بعده.
        // الهدف: يعطي فرصة للمستخدم يشوف إذا إجابته طلعت صح (أخضر) أو غلط (أحمر).
        setState(() {
          // بيرجع يفحص: إذا الإجابة صح → زوّد النقاط.
          mquizBrain.checkAnswer(userAnswer) ? ++score : '';
          selectedIndex = null;
          mquizBrain.nextQuestion();
          // السؤال التالي
          _start = 10;
          // رجع العداد للبداية
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = _start / 10;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: widget.level.colors,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomOutlineBtn(
                      icon: Icons.close,
                      size: 25,
                      bordercolor: Colors.white,
                      onpress: () {
                        _timer.cancel();
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Are You Sure To Close The Quiz??",
                          buttons: [
                            DialogButton(
                              onPressed: () => closeFunction(),
                              color: Colors.red,
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                          closeFunction: () {
                            startTimer();
                          },
                        ).show();
                      },
                    ),
                    Stack(
                      // لحتى نحط الرقم جوا الدائرة  stackاستخدمنا ال
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(
                            value: progress, // تقدم العداد
                            strokeWidth: 3, // سمك الخط
                            backgroundColor: Colors.white24,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          '$_start', // العدد نفسه (10,9,8...)
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite, color: Colors.white, size: 20),
                          SizedBox(width: 5),
                          Text(
                            "$score",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Center(
                child: Image.asset('assets/${widget.level.image}', width: 200),
              ),
              SizedBox(height: 50),
              Text(
                "questions ${mquizBrain.question_number + 1} of ${mquizBrain.multipleQuestionBank.length}",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                mquizBrain.getQuestionText(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: mquizBrain.getQuestionOptions().length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed:
                            //لما يكبس على الخيار رح يشوف هل الاجابة صح ام لا
                            //ورح يشوف ياخذ الخيار اللي كبست عليه لحتى ما اكبس على اي خيار ثاني
                            (selectedIndex == null || selectedIndex == index
                            ? () {
                                setState(() {
                                  selectedIndex = index;
                                  addUserScore(
                                    index,
                                  ); // رح يفحص الاجابة هل هي صح ام لا
                                });
                              }
                            : null),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: (selectedIndex == index
                              // هل المستخدم ضغط على هذا الخيار
                              ? (mquizBrain.checkAnswer(
                                      index,
                                    ) //يتم فحص هل هذا الخيار صحيح عبر
                                    ? Colors
                                          .lightGreenAccent //اذا صح هيصير اخضر
                                    : Colors.redAccent) //اذا غلط هيصير احمر
                              : Colors.white),
                          foregroundColor: selectedIndex == index
                              ? Colors.white
                              : widget.level.colors[0],
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(20),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(mquizBrain.getQuestionOptions()[index]),
                            SizedBox(width: 15),
                            (selectedIndex == index
                                ? (mquizBrain.checkAnswer(index)
                                      ? Icon(Icons.check)
                                      : Icon(Icons.close))
                                : SizedBox()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
