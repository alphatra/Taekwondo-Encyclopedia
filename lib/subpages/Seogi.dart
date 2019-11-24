import 'package:flutter/material.dart';
import '../Navbar.dart';
import 'package:taekwondo_app/subpages/Patterns.dart';
import 'About.dart';
import '../Controlersite.dart';
import 'History.dart';
import '../color_loader_2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
class Seogi extends StatefulWidget {
  @override
  _SeogiState createState() => _SeogiState();
}

class _SeogiState extends State<Seogi> {
  @override
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: (){Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyPage()),
        );},
        child: Scaffold(
          body: Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: _getPage(currentPage),
          ),
          bottomNavigationBar: FancyBottomNavigation(
            tabs: [
              TabData(
                  iconData: IconData(0xe900, fontFamily: 'Open-Book'),
                  title: "Dictionary",
                  onclick: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyPage()),
                  );}
              ),
              TabData(iconData: IconData(0xe901, fontFamily: 'Taekwondo-Kick'), title: "Patterns",),
              TabData(iconData: Icons.history, title: "History",),
              TabData(iconData: Icons.settings, title: "Settings",)
            ],
            inactiveIconColor: Colors.limeAccent[700],
            circleColor: Colors.limeAccent[700],
            initialSelection: 0,
            key: bottomNavigationKey,
            onTabChangedListener: (position) {
              setState(() {
                currentPage = position;
              });
            },
          ),
        )
    );
  }
  _getPage(int page) {
    switch (page) {
      case 0:
        return element();
      case 1:
        return Patterns();
      case 2:
        return History();
      case 3:
        return About();

    }
  }
}
class element extends StatefulWidget {
  @override
  _elementState createState() => _elementState();
}

class _elementState extends State<element> {
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
        if (element['stance'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var textfirst;
    var textsecond;
    var textseconds;
    if(MediaQuery.of(context).size.shortestSide < 600){
      setState(() {
        textfirst = TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.limeAccent[400]);
        textsecond = TextStyle(
            fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white);
        textseconds = TextStyle(
            fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white);
      });
    }else{
      textfirst = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.limeAccent[400]);
      textsecond = TextStyle(
          fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white);
      textseconds = TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);
    }
    return Column(
      children: <Widget>[Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text("Stances",
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
                          hintText: "Search",
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
                  return Padding(padding: EdgeInsets.only(left: 20,bottom: 40),
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
                                  magia: element['stance'],
                                ),
                                Text(
                                  element['stance'],
                                  style: textfirst,
                                ),
                                Text(
                                  element['Tittle'],
                                  style: textsecond,
                                ),
                              ],
                            ),
                          ),
                        ))
                        );
                      },
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: ( element['stance']) + "\n",
                          style: textfirst,
                          children: <TextSpan>[
                            TextSpan(
                              text:  element['TittleKR'] + ' ',
                              style: textsecond,
                            ),
                            TextSpan(
                              text:
                              "(" +  element['Tittle'] + ')',
                              style: textseconds,
                            ),
                          ],
                        ),
                      ),),);
                }).toList(),
              )
          )
      )],
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
    await Firestore.instance.collection('Stances').getDocuments();
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
    var textfirst;
    var textsecond;
    var textseconds;
    if(MediaQuery.of(context).size.shortestSide < 600){
      setState(() {
        textfirst = TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.limeAccent[400]);
        textsecond = TextStyle(
            fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white);
        textseconds = TextStyle(
            fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white);
      });
    }else{
      textfirst = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.limeAccent[400]);
      textsecond = TextStyle(
          fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white);
      textseconds = TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);
    }
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
                    return Padding(
                      padding:
                      EdgeInsets.only(left: 20,bottom: 40),
                      child: GestureDetector(
                        onTap: () => navigateToDetail(snapshot.data[index]),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: (snapshot.data[index]['stance']) + "\n",
                            style: textfirst,
                            children: <TextSpan>[
                              TextSpan(
                                text: snapshot.data[index]['TittleKR'] + ' ',
                                style: textsecond,
                              ),
                              TextSpan(
                                text:
                                "(" + snapshot.data[index]['Tittle'] + ')',
                                style: textseconds,
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
  final textfirst =
  TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white);
  final textsecond = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white);
  final textseconds =
  TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Navbar(magia: widget.post.data['stance'],),
            Text(
              widget.post.data['stance'],
              style: textfirst,
            ),
            Text(
              widget.post.data['Tittle'],
              style: textsecond,
            ),
          ],
        ),
      ),
    );
  }
}
class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection("Stances")
        .where('searchKey',
        isEqualTo: searchField.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}