import 'package:flutter/material.dart';
import 'package:taekwondo_app/subpages/Chagi.dart';
import '../Navbar.dart';
import 'package:taekwondo_app/subpages/Jireugi.dart';
import 'package:taekwondo_app/subpages/Makgi.dart';
import 'package:taekwondo_app/subpages/Seogi.dart';
import 'dart:async';
  var textfirst;
  var textsecond;
  var textseconds;
  var gradient;
  double height;
  double heightc;
  double width;
  double wys = 20;
  double pad;
  double padl;
  int flex;
  int flexs;
  double widthpm;
  double heightpm;
  bool check = false;
  void mainsize(){

  }
class Dictionary extends StatelessWidget {
  var textenglish;
  var textkorean;
  double paddign;
  int flex;
  int flexs;
  @override
  Widget build(BuildContext context) {
    double widthp = MediaQuery.of(context).size.width;
    double heightp = MediaQuery.of(context).size.height;
    widthpm = widthp;
    heightp = heightp;
    debugPrint('szerokość urządzenia to $widthp' + 'wysokość urządzenia to $heightp' );
    debugPrint('flex to $flex');
    //small device//
    if(MediaQuery.of(context).size.height < 600){
      textenglish = TextStyle(fontWeight: FontWeight.bold, fontSize: 22);
      textkorean = TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.limeAccent[400]);
      paddign = 13;
      flex=2;
      flexs=2;
      debugPrint('jestem < 600');
    }
    //medium device//
    if(MediaQuery.of(context).size.height > 600){
      if(MediaQuery.of(context).size.height < 800){
        textenglish = TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
        textkorean = TextStyle(fontWeight: FontWeight.bold, fontSize: 34, color: Colors.limeAccent[400]);
        paddign = 20;
        flex=60;
        flexs=20;
        debugPrint('jestem > 600 i < 800');
      }
    }
    //big device//
    if(MediaQuery.of(context).size.height > 800){
      if(MediaQuery.of(context).size.height < 1000){
        textenglish = TextStyle(fontWeight: FontWeight.bold, fontSize: 38);
        textkorean = TextStyle(fontWeight: FontWeight.bold, fontSize: 42, color: Colors.limeAccent[400]);
        paddign = 40;
        flex=4;
        flexs=1;
        debugPrint('jestem > 800 i < 1000');
      }
    }
    //tablet device//
    if(MediaQuery.of(context).size.height > 1000 || MediaQuery.of(context).size.width > 1000){
      if(MediaQuery.of(context).size.height < 1300 || MediaQuery.of(context).size.width < 1300){
        textenglish = TextStyle(fontWeight: FontWeight.bold, fontSize: 38);
        textkorean = TextStyle(fontWeight: FontWeight.bold, fontSize: 42, color: Colors.limeAccent[400]);
        paddign = 20;
        flex=4;
        flexs=1;

        debugPrint('jestem > 1000 i < 1300 (wysokości i szerokości)');
      }
    }
    //tablet big device//
    if(MediaQuery.of(context).size.height > 1300 || MediaQuery.of(context).size.width > 1300){
      textenglish = TextStyle(fontWeight: FontWeight.bold, fontSize: 54);
      textkorean = TextStyle(fontWeight: FontWeight.bold, fontSize: 58, color: Colors.limeAccent[400]);
      paddign = 40;
      flex=4;
      flexs=1;
      debugPrint('jestem > 1300(wysokości i szerokości)');
    }

    return Scaffold(
      body: Container(
            color: Colors.black,
            child: Column(
              children: <Widget>[
                Flexible(flex:flexs,child: Navbar(
                  magia: "Dictionary",
                ),),
                Flexible(flex:flex,child:Column(children: <Widget>[
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
                    padding: EdgeInsets.only(top: paddign),
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
                    padding: EdgeInsets.only(top: paddign),
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
                    padding: EdgeInsets.only(top: paddign),
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
                    padding: EdgeInsets.only(top: paddign),
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Other',
                        style: textenglish,
                      ))
                ],) ,)
              ],
            ),
          ),
      );
  }
}
