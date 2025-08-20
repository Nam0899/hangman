import 'package:flutter/material.dart';
import 'package:hangman/core/colors.dart';
import 'package:hangman/utilities/topic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const kActionButtonTextStyle = TextStyle(
  fontSize: 25,
  color: Colors.white,
  fontWeight: FontWeight.w300,
  letterSpacing: 0.5,
);

const kWordButtonTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 27,
  color: Colors.white,
);

const kHighScoreTableHeaders = TextStyle(
  color:AppColors.kWordButtonColor,
  fontSize: 30.0,
  fontWeight: FontWeight.w300,
  letterSpacing: 1.0,
);

const kHighScoreTableRowsStyle = TextStyle(
  color:AppColors.kWordButtonColor,
  fontSize: 27.0,
  fontWeight: FontWeight.w300,
  letterSpacing: 1.0,
);

var kSuccessAlertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  animationDuration: const Duration(milliseconds: 500),
  backgroundColor: const Color(0xFF2C1E68),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  titleStyle: const TextStyle(
    color: Color(0xFF00e676),
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
    letterSpacing: 1.5,
  ),
  descStyle: const TextStyle(
    color: Colors.white,
    fontSize: 24.0,
    letterSpacing: 1.5,
  ),
);
var kExitAlertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 27.0,
    letterSpacing: 2.0,
  ),
  animationDuration: const Duration(milliseconds: 500),
  backgroundColor: const Color(0xFF2C1E68),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  titleStyle: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 27.0,
    letterSpacing: 2.0,
  ),
);

var kTopicAlertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  animationDuration: const Duration(milliseconds: 450),
  backgroundColor: const Color(0xFF2C1E68),
  buttonsDirection: ButtonsDirection.column,
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  titleStyle: const TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
    letterSpacing: 1.5,
  ),
  descStyle: const TextStyle(
    color: Colors.lightBlue,
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
    letterSpacing: 1.5,
  ),
);

var kGameOverAlertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  animationDuration: const Duration(milliseconds: 450),
  backgroundColor: const Color(0xFF2C1E68),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  titleStyle: const TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
    letterSpacing: 1.5,
  ),
  descStyle: const TextStyle(
    color: Colors.lightBlue,
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
    letterSpacing: 1.5,
  ),
);

var kFailedAlertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  animationDuration: const Duration(milliseconds: 450),
  backgroundColor: const Color(0xFF2C1E68),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  buttonAreaPadding: EdgeInsets.all(12),
  titleStyle: const TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
    letterSpacing: 1.5,
  ),
  descStyle: const TextStyle(
    color: Colors.white,
    fontSize: 24.0,
    letterSpacing: 1.5,
  ),
);

const kDialogButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.w300,
  letterSpacing: 0.5,
);

const kWordTextStyle = TextStyle(
    fontSize: 57,
    color: AppColors.kWordColor,
    fontFamily: 'FiraMono',
    letterSpacing: 8);

const kWordCounterTextStyle =
    TextStyle(fontSize: 29.5, color: Colors.white, fontWeight: FontWeight.w900);

const kTopics = [
  Topic('Animals', 'animals'),
  Topic('Appearance', 'appearance'),
  Topic('Culture', 'culture'),
  Topic('Communication', 'communication'),
  Topic('Food and Drink', 'food'),
  Topic('Health', 'health'),
  Topic('People', 'people'),
  Topic('Sport', 'sport'),
  Topic('Travel', 'travel'),
  Topic('Science and Technology', 'science'),
  Topic('Work', 'work'),
];
