import 'package:flutter/material.dart';
import 'package:hangman/core/colors.dart';
import 'package:hangman/utilities/constants.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.buttonTitle, this.onPress});

  final VoidCallback? onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.kActionButtonHighlightColor,
          backgroundColor: AppColors.kActionButtonColor,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPress,
      child: Text(
        buttonTitle,
        style: kActionButtonTextStyle,
      ),
    );
  }
}
