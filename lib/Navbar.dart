import 'package:flutter/material.dart';
import 'searchservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Navbar extends StatefulWidget {
  final magia;

  Navbar({this.magia = ""});

  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  TextEditingController controller = new TextEditingController();

  final TextEditingController _controller = new TextEditingController();
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['businessName'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Container(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(widget.magia,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'Roboto'),
                        textAlign: TextAlign.left),
                    margin: EdgeInsets.only(top: 50, left: 30),
                  ),
                ),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 50, left: 36),
                      height: 29,
                      child: TextField(
                        onChanged:(val) {
                          initiateSearch(val);
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 3),
                            fillColor: Colors.limeAccent[400],
                            filled: true,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 24,
                              color: Colors.white,
                            ),
                            hintText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8))
                            )
                        ),
                      ),
                    ))
              ],
            ),
          ],)
      ),
    );
  }
}
