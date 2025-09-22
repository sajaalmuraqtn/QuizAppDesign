import 'package:flutter/material.dart';
import 'package:quiz_app_design/helpers/color_helper.dart';
import 'package:quiz_app_design/logic/level.dart';
import 'package:quiz_app_design/logic/multichoise/multiple_question.dart';

  List<Level> levels = [
    Level(
      title: "Dart Quiz",
      subtitle: 'Level 1',
      image: 'Dart_logo.png',
      description: 'Learn the basics of Dart programming language including variables, types, operators, and collections.',
      icon: Icons.check,
      colors: [kL1, kL12],
      questions: DartQuestionsBank
    ),
    Level(
      title: "OOP Quiz",
      subtitle: 'Level 2',
      image: 'oop.png',
      description: 'Understand the core Object-Oriented Programming concepts such as classes, objects, inheritance, polymorphism, and abstraction.',
      icon: Icons.play_arrow,
      colors: [kL2, kL22],
      questions: OopQuestionsBank
    ),
    Level(
      title: "Flutter Quiz",
      subtitle: 'Level 3',
      image: 'flutter.png',
      description: 'Apply Dart and OOP knowledge to build real mobile apps with Flutter, mastering widgets, state management, and UI design.',
      icon: Icons.lock,
      colors: [kL3, kL32],
      questions: FlutterQuestionsBank
    ),
  ];

   List<MultipleQuestion> DartQuestionsBank = [

  MultipleQuestion(
    ["String", "double", "bool"],
    questionText: "Which Dart data type represents true or false values?",
    answerOptionNumber: 2, // bool
  ),

  MultipleQuestion(
    ["var", "final", "const"],
    questionText: "Which keyword is used for a variable that cannot be reassigned?",
    answerOptionNumber: 1, // final
  ),

  MultipleQuestion(
    ["==", "=", "!="],
    questionText: "Which operator is used for equality comparison in Dart?",
    answerOptionNumber: 0, // ==
  ),

  MultipleQuestion(
    ["List", "Map", "Set"],
    questionText: "Which Dart collection stores unique values without duplicates?",
    answerOptionNumber: 2, // Set
  ),

  MultipleQuestion(
    ["main()", "start()", "run()"],
    questionText: "Which function is the entry point of every Dart program?",
    answerOptionNumber: 0, // main()
  ),
];
List<MultipleQuestion> OopQuestionsBank = [

  MultipleQuestion(
    ["Encapsulation", "Polymorphism", "Inheritance"],
    questionText: "Which OOP principle allows an object to take many forms?",
    answerOptionNumber: 1, // Polymorphism
  ),

  MultipleQuestion(
    ["Class", "Object", "Method"],
    questionText: "In OOP, what is an instance of a class called?",
    answerOptionNumber: 1, // Object
  ),

  MultipleQuestion(
    ["Encapsulation", "Abstraction", "Inheritance"],
    questionText: "Which OOP principle hides internal details and exposes only functionality?",
    answerOptionNumber: 1, // Abstraction
  ),

  MultipleQuestion(
    ["Super class", "Sub class", "Constructor"],
    questionText: "Which term refers to a class that inherits from another class?",
    answerOptionNumber: 1, // Sub class
  ),

  MultipleQuestion(
    ["Encapsulation", "Composition", "Inheritance"],
    questionText: "Which OOP principle is used when one class acquires the properties of another?",
    answerOptionNumber: 2, // Inheritance
  ),
];
List<MultipleQuestion> FlutterQuestionsBank = [

  MultipleQuestion(
    ["StatefulWidget", "StatelessWidget", "Container"],
    questionText: "Which widget is immutable and does not change its state?",
    answerOptionNumber: 1, // StatelessWidget
  ),

  MultipleQuestion(
    ["pubspec.yaml", "main.dart", "settings.dart"],
    questionText: "Which file in Flutter is used to manage dependencies?",
    answerOptionNumber: 0, // pubspec.yaml
  ),

  MultipleQuestion(
    ["setState()", "initState()", "dispose()"],
    questionText: "Which method is used to rebuild the UI when state changes?",
    answerOptionNumber: 0, // setState()
  ),

  MultipleQuestion(
    ["MaterialApp", "Scaffold", "AppBar"],
    questionText: "Which widget provides the basic structure of a screen in Flutter?",
    answerOptionNumber: 1, // Scaffold
  ),

  MultipleQuestion(
    ["Hot Reload", "Cold Restart", "Debugging"],
    questionText: "Which feature of Flutter allows developers to see code changes instantly?",
    answerOptionNumber: 0, // Hot Reload
  ),
];

