import 'package:adessua/controllers/auth_controller.dart';
import 'package:adessua/services/db.dart';
import 'package:adessua/ui/auth/auth.dart';
import 'package:adessua/ui/components/light_color.dart';
import 'package:adessua/ui/lessons/lesson_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final colorwhite = Colors.white;

class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Stream categoryStream;
  DatabaseService databaseService = new DatabaseService();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),

      // ignore: unnecessary_null_comparison
      builder: (controller) => controller.firestoreUser.value.uid == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          //
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200.0,
                          width: 500.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/img/adessuaBanner.png'))),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          height: 70.0,
                          width: 400.0,
                          decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.indigo,
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "SHS Courses now Available",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Enjoy",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // lessonList(),
                      categoryList(),
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  )),
            ),
    );
  }

  Widget categoryList() {
    return Container(
        child: Column(
      children: [
        StreamBuilder(
            stream: categoryStream,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container()
                  : GridView.builder(
                      primary: false,
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20),
                      // scrollDirection: Axis.vertical,

                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return LessonCard(
                          // noOfLessons: snapshot.data.docs.length,
                          noOfLessons: snapshot.data.docs[index]['noOfLessons'],
                          name: snapshot.data.docs[index]['name'],
                          categoryDesc: snapshot.data.docs[index]
                              ['categoryDesc'],
                          id: snapshot.data.docs[index]["id"],
                        );
                      });
            })
      ],
    ));
  }

  @override
  void initState() {
    databaseService.getCategoryData().then((value) {
      categoryStream = value;
      setState(() {});
    });
    super.initState();
  }
}

class LessonCard extends StatelessWidget {
  final String name, id, categoryDesc, noOfLessons;

  LessonCard({
    @required this.name,
    @required this.categoryDesc,
    @required this.id,
    @required this.noOfLessons,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CourseDetails(id);
            // CourseDetails();
          }));
        },
        child: Container(
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                color: LightColor.navyBlue1,
                child: Stack(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          bottom: 30,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  name,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: LightColor.yellow2),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  categoryDesc,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(noOfLessons,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
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
        ));
  }
}
