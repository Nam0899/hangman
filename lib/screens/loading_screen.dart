import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hangman/core/colors.dart';
import 'package:hangman/screens/score_screen.dart';
import 'package:hangman/utilities/user_score.dart';
import 'package:hangman/utilities/score_db.dart' as score_database;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    queryScores();
    super.initState();
  }

  void queryScores() async {
    final database = score_database.openDB();
    List<Score> queryResult = await score_database.scores(database);
    goToScoreScreen(queryResult);
  }

  void goToScoreScreen(List<Score> queryList) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ScoreScreen(
            query: queryList,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitCircle(
          color: AppColors.kTooltipColor,
          size: 100,
        ),
      ),
    );
  }
}
