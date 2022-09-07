import 'package:adessua/ui/components/light_color.dart';
import 'package:adessua/ui/home/home.dart';
import 'package:adessua/ui/lessons/Details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchCourse extends StatefulWidget {


  @override
  _SearchCourseState createState() => _SearchCourseState();
}

class _SearchCourseState extends State<SearchCourse> {
  String name = "";

  String get id => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40,
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeUI(),
                ),
              );
            }),

        title: Text("Search Course"),
        centerTitle: true,

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Search by Course Name'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ),
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: (name != "" && name != null)
                  ? FirebaseFirestore.instance
                      .collection('lessonCategory')
                      .where("name",  isGreaterThanOrEqualTo: name)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection("lessonCategory")
                      .snapshots(),
              builder: (context, snapshot) {
                // return (snapshot.connectionState == ConnectionState.waiting)
                //     ? Center(child: CircularProgressIndicator())

                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data.docs.length == 0) {
                  return Center(
                    child: Text('No Course found! Please try again.'),
                  );
                }
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data.docs[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Details(id);
                              }));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  child: Container(
                                    color: LightColor.navyBlue1,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 30, bottom: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[

                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      data['name'],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: LightColor
                                                              .yellow2),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            )),
                                        Positioned(
                                          left: -190,
                                          top: -190,
                                          child: CircleAvatar(
                                            radius: 130,
                                            backgroundColor:
                                                LightColor.lightBlue2,
                                          ),
                                        ),
                                        Positioned(
                                          left: -200,
                                          top: -200,
                                          child: CircleAvatar(
                                            radius: 130,
                                            backgroundColor:
                                                LightColor.lightBlue1,
                                          ),
                                        ),
                                        Positioned(
                                          right: -190,
                                          bottom: -190,
                                          child: CircleAvatar(
                                            radius: 130,
                                            backgroundColor: LightColor.yellow2,
                                          ),
                                        ),
                                        Positioned(
                                          right: -200,
                                          bottom: -200,
                                          child: CircleAvatar(
                                            radius: 130,
                                            backgroundColor: LightColor.yellow,
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
