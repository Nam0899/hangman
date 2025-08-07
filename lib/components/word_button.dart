import 'package:flutter/material.dart';
import 'package:hangman/core/colors.dart';
import 'package:hangman/utilities/constants.dart';

class WordButton extends StatelessWidget {
  const WordButton(
      {super.key, required this.buttonTitle, this.enable = true, this.onPress});

  final VoidCallback? onPress;
  final String buttonTitle;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enable ? 1 : 0.3,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: enable ? 3 : 0,
          backgroundColor: AppColors.kWordButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(4.0),
        ),
        onPressed: onPress,
        child: Center(
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: kWordButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
