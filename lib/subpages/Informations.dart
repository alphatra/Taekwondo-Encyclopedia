import 'package:flutter/material.dart';
import '../Navbar.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
class History extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var textfirst;
    var textsecond;
    var textseconds;
    var gradient;
    double height;
    double padl;
    int flex;
    int flexs;
    double widthp = MediaQuery.of(context).size.width;
    double heightp = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    var fiveMFromNow = now.add(new Duration(minutes: 5));
    var fiveSFromNow = now.add(new Duration(seconds: 5));
    debugPrint('szerokość urządzenia to $widthp'+'wysokość urządzenia to $heightp' );
    debugPrint(now.toString()+'  '+fiveMFromNow.toString());
    if(heightp < 600){
      gradient = Container(height: 1,width: double.infinity,decoration: BoxDecoration(gradient: RadialGradient(radius: 200,colors: [
        // Colors are easy thanks to Flutter's Colors class.
        Colors.limeAccent[400],
        Colors.black
      ],stops: [0.0, 1.0],)),);
      textfirst = TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white);
      textsecond = TextStyle(fontWeight: FontWeight.w300, fontSize: 2, color: Colors.white);
      textseconds = TextStyle(fontWeight: FontWeight.bold, fontSize: 4, color: Colors.white);
      padl = 42;
      height = 130;
      flexs = 1;
      flex = 2;
      debugPrint('jestem < 600');
    }
    if(heightp > 600){
      if(heightp < 800){
        gradient = Container(height: 1,width: double.infinity,decoration: BoxDecoration(gradient: RadialGradient(radius: 150,colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.limeAccent[400],
          Colors.black
        ],stops: [0.0, 1.0],)),);
        textfirst = TextStyle(fontWeight: FontWeight.w500, fontSize: 22, color: Colors.white);
        textsecond = TextStyle(fontWeight: FontWeight.w300, fontSize: 10, color: Colors.white);
        textseconds = TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white);
        padl = 20;
        height = (heightp/4);
        flex = 6;
        flexs = 2;
        debugPrint('jestem > 600 i < 800');
      }
    }
    if(heightp > 800){
      if(heightp < 1000){
        textfirst = TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white);
        textsecond = TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Colors.white);
        textseconds = TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white);

        gradient = Container(height: 1,width: double.infinity,decoration: BoxDecoration(gradient: RadialGradient(radius: 200,colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.limeAccent[400],
          Colors.black
        ],stops: [0.0, 1.0],)),);
        padl = 40;
        height = (heightp/5);
        flexs = 1;
        flex = 5;
        debugPrint('jestem > 800 i < 1000');
      }
    }
    if(heightp > 1000 || widthp > 1000){
      if(heightp < 1300 || widthp < 1300){
        textfirst = TextStyle(fontWeight: FontWeight.w500, fontSize: 29, color: Colors.white);
        textsecond = TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white);
        textseconds = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white);

        gradient = Container(height: 1,width: double.infinity,decoration: BoxDecoration(gradient: RadialGradient(radius: 500,colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.limeAccent[400],
          Colors.black
        ],stops: [0.0, 1.0],)),);
        padl = 60;
        height = (heightp/4);
        flex = 5;
        flexs = 1;
        debugPrint('jestem > 1000 i < 1300 (wysokości i szerokości)');
      }
    }
    if(heightp > 1300 || widthp > 1300){
      textfirst = TextStyle(fontWeight: FontWeight.w500, fontSize: 32, color: Colors.white);
      textsecond = TextStyle(fontWeight: FontWeight.w300, fontSize: 21, color: Colors.white);
      textseconds = TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white);

      gradient = Container(height: 1,width: double.infinity,decoration: BoxDecoration(gradient: RadialGradient(radius: 600,colors: [
        // Colors are easy thanks to Flutter's Colors class.
        Colors.limeAccent[400],
        Colors.black
      ],stops: [0.0, 1.0],)),);
      padl = 80;
      height = (heightp/5);
      flex = 5;
      flexs = 1;
      debugPrint('jestem > 1300(wysokości i szerokości)');
    }
    // TODO: implement build
    return Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Flexible(flex:flexs,child: Navbar(
                magia: "Dictionary",
              ),),
              Flexible(
                flex: flex,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shrinkWrap: true,
                  children: <Widget>[
                    gradient,
                    GestureDetector(onTap: null, child: Container(height: height,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                        Expanded(flex:15,child: Image.asset('assets/images/General.jpg'),),
                        Padding(padding: EdgeInsets.only(left: padl)),
                        Expanded(flex:40,child: Container(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AutoSizeText(
                                'Gen. Choi Hong-Hi',
                                maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w500),
                              minFontSize: 17,maxFontSize: 32,
                            ),
                            AutoSizeText(
                                'The histor of Taekwon - do creator',
                                maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w300),
                              minFontSize: 8,maxFontSize: 21,
                            ),
                            Padding(padding:EdgeInsets.only(top: 20),child: AutoSizeText(
                              'Twórcą Taekwon-do był Generał południowokoreańskiej armii,Choi Hong Hi urodzony 9 listopada 1918 roku w Ha Dae w Korei.',
                              maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.left,
                              minFontSize: 8,maxFontSize: 23,
                            ),
                            ),],),),),
                      ],),)),
                    gradient,
                    GestureDetector(onTap: null, child: Container(height: height,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                        Expanded(flex:15,child: Image.asset('assets/images/Taekwondo.png'),),
                        Padding(padding: EdgeInsets.only(left: padl)),
                        Expanded(flex:40,child: Container(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AutoSizeText(
                                'Taekown - do',
                                maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w500),
                              minFontSize: 17,maxFontSize: 32,
                            ),
                            AutoSizeText(
                                'The history of Taekwon - do',
                                maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w300),
                              minFontSize: 8,maxFontSize: 21,
                            ),

                            Padding(padding:EdgeInsets.only(top: 20),child: AutoSizeText(
                              'Narodowy sport i tradycyjna sztuka walki Korei, stworzona do celów militarnych, następnie zostało zaadaptowane do użytku cywilnego.',
                              maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.left,
                              minFontSize: 8,maxFontSize: 23,
                            ),
                            ),],),),),
                      ],),)),
                    gradient,
                    GestureDetector(onTap: null, child: Container(height: height,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                        Expanded(flex:15,child: Image.asset('assets/images/Thoughts.jpg'),),
                        Padding(padding: EdgeInsets.only(left: padl)),
                        Expanded(flex:40,child: Container(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AutoSizeText(
                              'Golden thoughts',
                              maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w500),
                              minFontSize: 17,maxFontSize: 32,
                            ),
                            AutoSizeText(
                                'Thoughts of Gen. Choi',
                                maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w300),
                              minFontSize: 8,maxFontSize: 21,
                            ),

                            Padding(padding:EdgeInsets.only(top: 20),child: AutoSizeText(
                              'Nigdy nie zapominajcie o codziennym treningu. Powtarzajcie techniki, dopóki nie osiągniecie doskonałości i całkowitej skuteczności.',
                              maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.left,
                              minFontSize: 8,maxFontSize: 23,
                            ),
                            ),],),),),
                      ],),)),
                    gradient,
                    GestureDetector(onTap: null, child: Container(height: height,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                        Expanded(flex:15,child: Image.asset('assets/images/Selfdefense.jpg'),),
                        Padding(padding: EdgeInsets.only(left: padl)),
                        Expanded(flex:40,child: Container(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AutoSizeText(
                                'Self Defense',
                                maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w500),
                              minFontSize: 17,maxFontSize: 32,
                            ),
                            AutoSizeText(
                                'Many examples of self defense',
                                maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w300),
                              minFontSize: 8,maxFontSize: 21,
                            ),
                            Padding(padding:EdgeInsets.only(top: 20),child: AutoSizeText(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eros ligula, scelerisque vitae velit eget, tempor sollicitudin lorem. Donec auctor leo magna.',
                              maxLines: 1, style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.left,
                              minFontSize: 8,maxFontSize: 23,
                            ),
                            ),],),),),
                      ],),)),
                    gradient,
                  ],
                ),)
            ],
          ),
        ),
    );
  }
}
