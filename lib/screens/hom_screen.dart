import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangman/components/action_button.dart';
import 'package:hangman/core/colors.dart';
import 'package:hangman/screens/game_screen.dart';
import 'package:hangman/screens/loading_screen.dart';
import 'package:hangman/utilities/constants.dart';
import 'package:hangman/utilities/hangman_words.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  final HangmanWords hangmanWords = HangmanWords();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    widget.hangmanWords.readWords();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 8.0),
                child: const Text(
                  'HANGMAN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 58.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 3.0),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/gallow.png',
                height: height * 0.49,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 64,
                      child: ActionButton(
                        buttonTitle: 'Start',
                        onPress: () {
                          Alert(
                            style: kTopicAlertStyle,
                            context: context,
                            title: "Select a Topic",
                            content: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Wrap(
                                spacing: 8,
                                children: List.generate(
                                  kTopics.length,
                                      (i) {
                                    return MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: AppColors.kColorPrimary,
                                      child: Padding(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/images/ic_${kTopics[i].fileStr}.svg',
                                              height: 18,
                                              width: 18,
                                            ),
                                            SizedBox(width: 8,),
                                            Text(
                                              kTopics[i].topic,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black
                                              ),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => GameScreen(
                                              hangmanWords: widget.hangmanWords,
                                              topic: kTopics[i].fileStr,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            buttons: [
                              DialogButton(
                                radius: BorderRadius.circular(10),
                                width: 100,
                                color: Colors.red,
                                height: 40,
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => GameScreen(
                                  //       hangmanWords: widget.hangmanWords,
                                  //     ),
                                  //   ),
                                  // );
                                },
                              )
                            ]
                          ).show();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      height: 64,
                      child: ActionButton(
                        buttonTitle: 'High Scores',
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoadingScreen(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
