import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman/components/word_button.dart';
import 'package:hangman/core/colors.dart';
import 'package:hangman/screens/hom_screen.dart';
import 'package:hangman/utilities/alphabet.dart';
import 'package:hangman/utilities/constants.dart';
import 'package:hangman/utilities/hangman_words.dart';
import 'package:hangman/utilities/score_db.dart' as score_database;
import 'package:hangman/utilities/user_score.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    required this.hangmanWords,
    required this.topic,
  });

  final HangmanWords hangmanWords;
  final String topic;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final database = score_database.openDB();
  int lives = 5;
  Alphabet englishAlphabet = Alphabet();
  late String word;
  late String hiddenWord;
  List<String> wordList = [];
  List<int> hintLetters = [];
  late List<bool> buttonStatus;
  late bool hintStatus;
  int hangState = 0;
  int wordCount = 0;
  bool finishedGame = false;
  bool resetGame = false;

  @override
  void initState() {
    initWords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (resetGame) {
      setState(() {
        initWords();
      });
    }
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: kToolbarHeight * 0.6,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 8, 6, 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: IconButton(
                                  tooltip: 'Lives',
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  iconSize: 46,
                                  onPressed: () {},
                                  icon: Icon(
                                    MdiIcons.heart,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 38,
                                  width: 38,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        lives.toString() == '1'
                                            ? 'I'
                                            : lives.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'PatrickHand',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            child: Text(
                              wordCount == 1 ? 'I' : '$wordCount',
                              style: kWordCounterTextStyle,
                            ),
                          ),
                          SizedBox(
                            child: Opacity(
                              opacity: hintStatus ? 1 : 0.3,
                              child: IconButton(
                                tooltip: 'Hint',
                                iconSize: 46,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: hintStatus
                                    ? () {
                                        int rand = Random()
                                            .nextInt(hintLetters.length);
                                        wordPress(englishAlphabet.alphabet
                                            .indexOf(
                                                wordList[hintLetters[rand]]));
                                        hintStatus = false;
                                      }
                                    : null,
                                icon: Icon(
                                  MdiIcons.lightbulb,
                                  color: AppColors.kTooltipColor.withAlpha(170),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(
                            'assets/images/$hangState.png',
                            height: 1001,
                            width: 991,
                            gaplessPlayback: true,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            hiddenWord,
                            style: kWordTextStyle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: createButton(0),
                      ),
                      TableCell(
                        child: createButton(1),
                      ),
                      TableCell(
                        child: createButton(2),
                      ),
                      TableCell(
                        child: createButton(3),
                      ),
                      TableCell(
                        child: createButton(4),
                      ),
                      TableCell(
                        child: createButton(5),
                      ),
                      TableCell(
                        child: createButton(6),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(7),
                      ),
                      TableCell(
                        child: createButton(8),
                      ),
                      TableCell(
                        child: createButton(9),
                      ),
                      TableCell(
                        child: createButton(10),
                      ),
                      TableCell(
                        child: createButton(11),
                      ),
                      TableCell(
                        child: createButton(12),
                      ),
                      TableCell(
                        child: createButton(13),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(14),
                      ),
                      TableCell(
                        child: createButton(15),
                      ),
                      TableCell(
                        child: createButton(16),
                      ),
                      TableCell(
                        child: createButton(17),
                      ),
                      TableCell(
                        child: createButton(18),
                      ),
                      TableCell(
                        child: createButton(19),
                      ),
                      TableCell(
                        child: createButton(20),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(21),
                      ),
                      TableCell(
                        child: createButton(22),
                      ),
                      TableCell(
                        child: createButton(23),
                      ),
                      TableCell(
                        child: createButton(24),
                      ),
                      TableCell(
                        child: createButton(25),
                      ),
                      TableCell(
                        child: Text(''),
                      ),
                      TableCell(
                        child: Text(''),
                      ),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void newGame() {
    setState(() {
      widget.hangmanWords.resetWords();
      englishAlphabet = Alphabet();
      lives = 5;
      wordCount = 0;
      finishedGame = false;
      resetGame = false;
      initWords();
    });
  }

  void initWords() {
    finishedGame = false;
    resetGame = false;
    hintStatus = true;
    hangState = 0;
    buttonStatus = List.generate(26, (index) {
      return true;
    });
    wordList = [];
    hintLetters = [];
    word = widget.hangmanWords.getWord(widget.topic);
    print('Word: $word');
    if (word.isNotEmpty) {
      hiddenWord = widget.hangmanWords.getHiddenWord(word.length);
      // Randomly reveal a few characters in the hiddenWord
      int revealCount =
          (word.length / 4).ceil(); // Reveal about 1/3 of the word
      Set<int> revealedIndices = {};
      Random random = Random();

      while (revealedIndices.length < revealCount) {
        int randIndex = random.nextInt(word.length);
        if (!revealedIndices.contains(randIndex)) {
          revealedIndices.add(randIndex);
          hiddenWord = hiddenWord.replaceFirst('_', word[randIndex], randIndex);
          int indexAlphabetHidden =
              englishAlphabet.alphabet.indexOf(word[randIndex].toLowerCase());
          if (word
              .toLowerCase()
              .replaceFirst(word[randIndex].toLowerCase(), '')
              .contains(word[randIndex].toLowerCase())) {
            buttonStatus[indexAlphabetHidden] = true;
          } else {
            buttonStatus[indexAlphabetHidden] = false;
          }
        }
      }
    } else {
      returnHomePage();
    }

    for (int i = 0; i < word.length; i++) {
      if (hiddenWord[i] == '_') {
        wordList.add(word[i].toLowerCase());
        hintLetters.add(i);
      } else {
        wordList.add('');
      }
    }
  }

  void returnHomePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      ModalRoute.withName('homePage'),
    );
  }

  Widget createButton(index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 6.0),
      child: WordButton(
        buttonTitle: englishAlphabet.alphabet[index].toUpperCase(),
        onPress: buttonStatus[index] ? () => wordPress(index) : () {},
        enable: buttonStatus[index],
      ),
    );
  }

  void wordPress(int index) {
    if (lives == 0) {
      returnHomePage();
    }

    if (finishedGame) {
      setState(() {
        resetGame = true;
      });
      return;
    }

    bool check = false;
    setState(() {
      for (int i = 0; i < wordList.length; i++) {
        if (wordList[i] == englishAlphabet.alphabet[index]) {
          check = true;
          wordList[i] = '';
          hiddenWord = hiddenWord.replaceFirst(RegExp('_'), word[i], i);
        }
      }
      for (int i = 0; i < wordList.length; i++) {
        if (wordList[i] == '') {
          hintLetters.remove(i);
        }
      }
      if (!check) {
        hangState += 1;
      }

      if (hangState == 6) {
        finishedGame = true;
        lives -= 1;
        if (lives < 1) {
          if (wordCount > 0) {
            Score score = Score(
                id: 1,
                scoreDate: DateTime.now().toString(),
                userScore: wordCount);
            score_database.manipulateDatabase(score, database);
          }
          Alert(
              style: kGameOverAlertStyle,
              context: context,
              title: "Game Over!",
              desc: "Your score is $wordCount",
              buttons: [
                DialogButton(
                  color: AppColors.kDialogButtonColor,
                  onPressed: () => returnHomePage(),
                  child: Icon(
                    MdiIcons.home,
                    size: 30.0,
                  ),
                ),
                DialogButton(
                  onPressed: () {
                    newGame();
                    Navigator.pop(context);
                  },
                  color: AppColors.kDialogButtonColor,
                  child: Icon(MdiIcons.refresh, size: 30.0),
                ),
              ]).show();
        } else {
          Alert(
            context: context,
            style: kFailedAlertStyle,
            type: AlertType.error,
            title: word,
            desc: "You Lost!",
            buttons: [
              DialogButton(
                radius: BorderRadius.circular(10),
                width: 127,
                color: AppColors.kDialogButtonColor,
                height: 52,
                child: Icon(
                  MdiIcons.arrowRightThick,
                  size: 30.0,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                    initWords();
                  });
                },
              ),
            ],
          ).show();
        }
      }

      buttonStatus[index] = false;
      if (hiddenWord == word) {
        finishedGame = true;
        Alert(
          context: context,
          style: kSuccessAlertStyle,
          type: AlertType.success,
          title: word,
          desc: "You guessed it right!",
          buttons: [
            DialogButton(
              radius: BorderRadius.circular(10),
              width: 127,
              color: AppColors.kDialogButtonColor,
              height: 52,
              child: Icon(
                MdiIcons.arrowRightThick,
                size: 30.0,
              ),
              onPressed: () {
                setState(() {
                  wordCount += 1;
                  Navigator.pop(context);
                  initWords();
                });
              },
            )
          ],
        ).show();
      }
    });
  }
}
