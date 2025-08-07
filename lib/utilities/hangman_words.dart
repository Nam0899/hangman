import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

class HangmanWords {
  int wordCounter = 0;
  List<int> _usedNumbers = [];
  List<String> _words = [];

  Future readWords() async {
    String fileText =
        await rootBundle.loadString('assets/res/hangman_word.txt');
    _words = fileText.split('\n');
  }

  void resetWords() {
    wordCounter = 0;
    _usedNumbers = [];
  }

  getWord(String topic) {
    int indexStart = _words.indexWhere((e) => e == 'start-$topic');
    int indexEnd = _words.indexWhere((e) => e == 'end-$topic');
    print('Index: $indexStart-$indexEnd');
    List<String> wordsSplit = _words.sublist(indexStart + 1, indexEnd - 1);
    wordCounter += 1;
    var rand = Random();
    int wordLength = wordsSplit.length;
    int randNumber = rand.nextInt(wordLength);
    bool notUnique = true;
    if (wordCounter - 1 == wordsSplit.length) {
      notUnique = false;
      return '';
    }
    while (notUnique) {
      if (!_usedNumbers.contains(randNumber)) {
        notUnique = false;
        _usedNumbers.add(randNumber);
        return wordsSplit[randNumber].toLowerCase();
      } else {
        randNumber = rand.nextInt(wordLength);
      }
    }
  }

  String getHiddenWord(int wordLength) {
    String hiddenWord = '';
    for (int i = 0; i < wordLength; i++) {
      hiddenWord += '_';
    }
    return hiddenWord;
  }
}
