import 'package:adessua/services/db.dart';
import 'package:adessua/ui/components/light_color.dart';
import 'package:adessua/ui/lessons/lesson_details.dart';
import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {

  Stream lessonStream;

  DatabaseService _databaseService = new DatabaseService();

  bool _isLoading = true;

  Widget courseList(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: lessonStream,
        builder: (context, snapshot){
          return snapshot == null ?
          Container(
            child: Center(child: Text("No Course Available",
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),)),
          ) :
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index){
                return CourseTile(
                  noOfLessons: snapshot.data.docs[index]['noOfLessons'],
                  name: snapshot.data.docs[index]['name'],
                  categoryDesc: snapshot.data.docs[index]
                  ['categoryDesc'],
                  id: snapshot.data.docs[index]["id"],
                );
              });
        },
      ),
    );
  }


  @override
  void initState() {
    _databaseService. getCategoryData().then((value){
      setState(() {
        lessonStream = value;
        _isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      _isLoading
          ? Container(
        child: Center(child: CircularProgressIndicator()),
      ) : courseList();

  }
}

class  CourseTile extends StatelessWidget {

  final String noOfLessons;
  final String name;
  final String categoryDesc;
  final String id;

  CourseTile({@required this.noOfLessons, @required this.name, @required this.categoryDesc, @required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  CourseDetails(id);
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            child: Container(
              color: LightColor.navyBlue1,
              child: Stack(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                name,
                                style:
                                TextStyle(

                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: LightColor.yellow2),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Text(
                                categoryDesc,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),

                                  Text(noOfLessons,
                                      style: TextStyle(color: Colors.grey)),

                        ],
                      )),
                  Positioned(
                    left: -190,
                    top: -190,
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: LightColor.lightBlue2,
                    ),
                  ),
                  Positioned(
                    left: -200,
                    top: -200,
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: LightColor.lightBlue1,
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
  }
}

