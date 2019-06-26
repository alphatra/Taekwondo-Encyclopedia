import 'package:flutter/material.dart';
import '../Navbar.dart';

class History extends StatelessWidget {
  final textfirst = TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white);
  final textsecond = TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.white);
  final textseconds = TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Navbar(magia: "History",),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                  children: <Widget>[
                    Text('TAEKWON-DO',style: textfirst,textAlign: TextAlign.left,),
                    Text('태권도\n',style: textfirst,textAlign: TextAlign.left,),
                    Text('Taekwondo is a combative sport and was developed during the 1940s and 1950s by Korean martial artists with experience in martial arts such as karate, Chinese martial arts, and indigenous Korean martial arts traditions such as Taekkyeon, Subak, and Gwonbeop. The oldest governing body for taekwondo is the Korea Taekwondo Association (KTA), formed in 1959 through a collaborative effort by representatives from the nine original kwans, or martial arts schools, in Korea. The main international organisational bodies for taekwondo today are the International Taekwon-Do Federation (ITF), founded by Choi Hong Hi in 1966, and the partnership of the Kukkiwon and World Taekwondo (WT, formerly WTF), founded in 1972 and 1973 respectively by the Korea Taekwondo Association.[citation needed] Gyeorugi , a type of full-contact sparring, has been an Olympic event since 2000. The governing body for taekwondo in the Olympics and Paralympics is World Taekwondo.',style: textsecond,)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
