import 'package:flutter/material.dart';
import '../color_loader_2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:taekwondo_app/Navbar.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:youtube_player/youtube_player.dart';
class Patterns extends StatefulWidget {
  @override
  _PatternsState createState() => _PatternsState();
}

class _PatternsState extends State<Patterns> {
  @override
  void initState() {
    super.initState();
  }
  @override
  bool condition = true;
  var queryResultSet = [];
  var tempSearchStore = [];
  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
        condition = true;
      });
    }

    var capitalizedValue = value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['Tittle'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }
  final textfirst = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: Colors.limeAccent[400]);
  final textsecond = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 28, color: Colors.white);
  final textseconds = TextStyle(
      fontFamily: "OpenSans-Regular", fontSize: 21, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8398911720290278~8680924007").then((response){
      myInterstitial
        ..load()
        ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
        );
    });

    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text("Patterns",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontFamily: 'Roboto'),
                            textAlign: TextAlign.left),
                        margin: EdgeInsets.only(top: 10, left: 30),
                      ),
                    ),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 30),
                          height: 29,
                          child: TextField(
                            onChanged: (val) {
                              initiateSearch(val);
                              condition = false;
                            },
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 3),
                                fillColor: Colors.limeAccent[400],
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                hintText: "Search by name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7))
                                )
                            ),
                          ),
                        )),

                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                  child: condition == true ? ListPage() : ListView(
                    children: tempSearchStore.map((element) {
                      FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8398911720290278~8680924007").then((response){
                        myInterstitial
                          ..load()
                          ..show(
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                          );
                      });
                      return Padding(padding: EdgeInsets.only(left: 20,bottom: 20),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Scaffold(
                            body: Container(
                            color: Colors.black,
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                children: <Widget>[
                                  Navbar(
                                    magia: element['Tittle'],
                                  ),
                                  Text(
                                    element['Tittle'] +
                                        ("  ") +
                                        element['TittleKR'],
                                    style: textfirst,
                                  ),
                                  Text(
                                    ("Number of moves:  ") +
                                        element["Moves"].toString() +
                                        ("\n"),
                                    style: textsecond,
                                  ),
                                  Image.network(
                                    element['Graphic'],
                                    scale: 4,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                                    child: Text(
                                      element["Content"],
                                      style: textseconds,
                                    ),
                                  )

                                ],
                              ),
                            ),
                            ))
                            );
                          },
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: (element['Tittle']) + "\n",
                              style: textfirst,
                              children: <TextSpan>[
                                TextSpan(
                                  text: element['TittleKR'] + ' ',
                                  style: textsecond,
                                ),
                              ],
                            ),
                          ),),);
                    }).toList(),
                  )
                )
            )
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPosts() async {
    QuerySnapshot qn =
        await Firestore.instance.collection('Patterns').getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                  post: post,
                )));
  }

  @override
  Widget build(BuildContext context) {
    final textfirst = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.limeAccent[400]);
    final textsecond = TextStyle(
        fontWeight: FontWeight.w500, fontSize: 28, color: Colors.white);
    return Container(
      child: FutureBuilder(
          future: getPosts(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: ColorLoader2(
                color1: Colors.limeAccent,
                color2: Colors.limeAccent[400],
                color3: Colors.limeAccent[700],
              ));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8398911720290278~8680924007").then((response){
                      myInterstitial
                        ..load()
                        ..show(
                          anchorType: AnchorType.bottom,
                          anchorOffset: 0.0,
                        );
                    });
                    return Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      child: GestureDetector(
                        onTap: () => navigateToDetail(snapshot.data[index]),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: (snapshot.data[index]['Tittle']) + "\n",
                            style: textfirst,
                            children: <TextSpan>[
                              TextSpan(
                                text: snapshot.data[index]['TittleKR'] + ' ',
                                style: textsecond,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;

  DetailPage({this.post});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final textfirst = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 30,
    color: Colors.white,
  );
  final textsecond = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white,);
  final textseconds = TextStyle(
      fontFamily: "OpenSans-Regular", fontSize: 21, color: Colors.white);
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8398911720290278~8680924007").then((response){
      myInterstitial
        ..load()
        ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
        );
    });
    return Scaffold(
      backgroundColor:  Colors.black,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.limeAccent[400],
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    print('constraints=' + constraints.toString());
                    top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                        centerTitle: true,
                        title: AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top < 150.0 ? 1.0 : 0.0,
                            child: Text(
                              widget.post.data['Tittle'],
                              style: textfirst
                            )),
                        background: Container(color: Colors.black,child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 75)
                          ),
                          Text(
                            widget.post.data['Tittle'] +
                                ("  ") +
                                widget.post.data['TittleKR'],
                            style: textfirst,
                          ),
                          Text(
                            ("Number of moves:  ") +
                                widget.post.data["Moves"].toString() +
                                ("\n"),
                            style: textsecond,
                          ),
                        ],),));
                  })
            ),
          ];
        },
        body: Center(
          child: ListView(
            children: <Widget>[
              Image.network(
                widget.post.data['Graphic'],
                scale: 3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Text(
                  widget.post.data["Content"],
                  style: textseconds,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: YoutubePlayer(source: widget.post.data["Video"], context: context, quality: YoutubeQuality.FHD,callbackController: (controller) {
                    ;
                  },),


              ),
            ],
          )
        ),
      ),
    );
  }
}
class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection("Patterns")
        .where('searchKey',
        isEqualTo: searchField.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);
InterstitialAd myInterstitial = InterstitialAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: "ca-app-pub-8398911720290278/6622571020",
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
);