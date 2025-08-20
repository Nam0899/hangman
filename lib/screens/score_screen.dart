import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:hangman/core/colors.dart';
import 'package:hangman/utilities/constants.dart';
import 'package:hangman/utilities/user_score.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key, required this.query});

  final List<Score> query;

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: widget.query.isEmpty
            ? Stack(
          children: [
            Center(
              child: Text(
                'No Scores Yet!',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.kWordButtonColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              alignment: Alignment.topLeft,
              child: IconButton(
                tooltip: 'Home',
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                iconSize: 35,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  MdiIcons.home,
                  color: AppColors.kWordButtonColor,
                ),
              ),
            ),
          ],
        )
            : Column(
          children: [
            SizedBox(
              height: kToolbarHeight * 0.45,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    tooltip: 'Home',
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    iconSize: 32,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      MdiIcons.home,
                      color: AppColors.kWordButtonColor,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'High Scores',
                    style: TextStyle(
                      color: AppColors.kWordButtonColor,
                      fontSize: 38,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  textBaseline: TextBaseline.alphabetic,
                  children: createRow(widget.query),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<TableRow> createRow(List<Score> query) {
    query.sort((a, b) => b.userScore.compareTo(a.userScore));
    List<TableRow> rows = [];
    rows.add(
      const TableRow(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Center(
              child: Text("Rank", style: kHighScoreTableHeaders),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Center(
              child: Text(
                "Date",
                style: kHighScoreTableHeaders,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Center(
              child: Text(
                "Score",
                style: kHighScoreTableHeaders,
              ),
            ),
          ),
        ],
      ),
    );
    debugPrint("${query[0]} this is query 0");
    int numOfRows = query.length;
    List<String> topRanks = ["🥇", "🥈", "🥉"];
    for (var i = 0; i < numOfRows && i < 10; i++) {
      var row = query[i].toString().split(",");
      var date = row[1].split(" ")[0].split("-");
      var scoreDate = formatDate(
          DateTime(int.parse(date[0]), int.parse(date[1]), int.parse(date[2])),
          [yy, '-', M, '-', d]);

      Widget item = TableCell(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            i < 3 ? '${topRanks[i]}${i + 1}' : '${i + 1}',
            style: kHighScoreTableRowsStyle,
            textAlign: TextAlign.center,
          ),
        ),
      );
      Widget item1 = TableCell(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              scoreDate,
              style: kHighScoreTableRowsStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
      Widget item2 = TableCell(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            row[0],
            style: kHighScoreTableRowsStyle,
            textAlign: TextAlign.center,
          ),
        ),
      );
      rows.add(
        TableRow(
          children: [item, item1, item2],
        ),
      );
    }
    return rows;
  }
}
