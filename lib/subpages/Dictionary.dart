import 'package:flutter/material.dart';
import 'package:taekwondo_app/subpages/Chagi.dart';
import '../Navbar.dart';
import 'package:taekwondo_app/subpages/Jireugi.dart';
import 'package:taekwondo_app/subpages/Makgi.dart';
import 'package:taekwondo_app/subpages/Seogi.dart';

class Dictionary extends StatelessWidget {
  final textenglish = TextStyle(fontWeight: FontWeight.bold, fontSize: 38);
  final textkorean = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 36, color: Colors.limeAccent[400]);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Navbar(
            magia: "Dictionary",
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 28),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Chagi()),
                    );
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Chagi\n',
                        style: textenglish,
                        children: <TextSpan>[
                          new TextSpan(text: '차기', style: textkorean)
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 28),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Jireugi()),
                    );
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Jireugi\n',
                        style: textenglish,
                        children: <TextSpan>[
                          new TextSpan(text: '지르기', style: textkorean),
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 28),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Makgi()),
                    );
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Makgi\n',
                        style: textenglish,
                        children: <TextSpan>[
                          new TextSpan(text: '막기', style: textkorean),
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 28),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Seogi()),
                    );
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Seogi\n',
                        style: textenglish,
                        children: <TextSpan>[
                          new TextSpan(text: '서기', style: textkorean),
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 28),
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Other',
                      style: textenglish,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
