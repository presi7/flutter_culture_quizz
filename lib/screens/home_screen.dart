import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA76AE4),
      appBar: AppBar(
         backgroundColor: Color(0xFFA76AE4),
        title: Text('Culture Quiz Sénégal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              elevation: 10.0,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset(
                  "assets/images/quizz.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     foregroundColor: Colors.white, backgroundColor: Colors.blue[400], // foreground
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => QuizScreen()),
            //     );
            //   },
            //   child: Text('Commencer le Quiz'),
            // ),
            TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.blue.withOpacity(0.04);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return Colors.blue.withOpacity(0.12);
                    return null;
                  })),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              child: Text('Commencer le quizz'),
            )
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigator to score screen
            //   },
            //   child: Text('Scores'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigator to settings screen
            //   },
            //   child: Text('Paramètres'),
            // ),
          ],
        ),
      ),
    );
  }
}
