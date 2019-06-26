import 'package:flutter/material.dart';
import '../Navbar.dart';

class About extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Navbar(magia: "Information",),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 95)),
                GestureDetector(child: Container(
                  width: 260,
                  height: 35,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient: LinearGradient(begin:Alignment.bottomCenter,end:Alignment.topCenter,colors: [Colors.limeAccent[700],Colors.limeAccent[400]])),
                  child: Text("About us",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                GestureDetector(child: Container(
                  width: 260,
                  height: 35,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient: LinearGradient(begin:Alignment.bottomCenter,end:Alignment.topCenter,colors: [Colors.limeAccent[700],Colors.limeAccent[400]])),
                  child: Text("Privacy police",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                GestureDetector(child: Container(
                  width: 260,
                  height: 35,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient: LinearGradient(begin:Alignment.bottomCenter,end:Alignment.topCenter,colors: [Colors.limeAccent[700],Colors.limeAccent[400]])),
                  child: Text("About App",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                GestureDetector(child: Container(
                  width: 260,
                  height: 35,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient: LinearGradient(begin:Alignment.bottomCenter,end:Alignment.topCenter,colors: [Colors.limeAccent[700],Colors.limeAccent[400]])),
                  child: Text("Support us",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}