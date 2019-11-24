import 'package:flutter/material.dart';
import 'package:taekwondo_app/subpages/Chagi.dart';
import '../Navbar.dart';
import 'package:taekwondo_app/subpages/Jireugi.dart';
import 'package:taekwondo_app/subpages/Makgi.dart';
import 'package:taekwondo_app/subpages/Seogi.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
  double size;
  int flex;
  double widthpm;
  var ten = ["Chagi","Jirugi","Makgi","Seogi"];
  var tkn = ["차기","지르기","막기","서기"];
class Dictionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthp = MediaQuery.of(context).size.width;
    double heightp = MediaQuery.of(context).size.height;
    widthpm = widthp;
    heightp = heightp;
    //small device//
    if(MediaQuery.of(context).size.height < 600){
      size = 26;
    }
    //medium device//
    if(MediaQuery.of(context).size.height > 600){
        size = 31;
    }
    //big device//
    if(MediaQuery.of(context).size.height > 700){
        size = 32;
    }
    //big device//
    if(MediaQuery.of(context).size.height > 800){
      size = 34;
    }
    //big device//
    if(MediaQuery.of(context).size.height > 850){
      size = 36;
    }
    //tablet device//
    if(MediaQuery.of(context).size.height > 1000 || MediaQuery.of(context).size.width > 1000){
      if(MediaQuery.of(context).size.height < 1300 || MediaQuery.of(context).size.width < 1300){
        size = 36;
      }
    }
    //tablet big device//
    if(MediaQuery.of(context).size.height > 1300 || MediaQuery.of(context).size.width > 1300){
      size = 36;
    }

    return Scaffold(backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Align(alignment: Alignment.topCenter,child: Navbar(magia: "Dictionary",),),
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/4),child: ListView.builder(
            itemCount: ten.length,
            itemBuilder: (context, index) {
              return GestureDetector(onTap: (){
                print(index);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context){switch(index){
                    case 0:
                      return Chagi();
                    case 1:
                      return Jireugi();
                    case 2:
                      return Makgi();
                    case 3:
                      return Seogi();
                    default:
                      return Dictionary();
                  }}),);
                },
                child: ListTile(
                  title: Text('${ten[index]}',
                    style: TextStyle(fontSize: size,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),subtitle: Text(
                '${tkn[index]}',
                style: TextStyle(fontSize: size,color: Colors.limeAccent[400],fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
              ),);
            },
          ),),

        ],
      ),
    );
  }
}
