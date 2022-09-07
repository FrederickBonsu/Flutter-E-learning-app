import 'package:adessua/controllers/auth_controller.dart';
import 'package:adessua/controllers/controllers.dart';
import 'package:adessua/ui/auth/update_profile_ui.dart';
import 'package:adessua/ui/components/appbar_title.dart';
import 'package:adessua/ui/components/avatar.dart';
import 'package:adessua/ui/home/tabs/courses_tab.dart';
import 'package:adessua/ui/home/tabs/home_tab.dart';
import 'package:adessua/ui/home/tabs/quiz_tab.dart';
import 'package:adessua/ui/home/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:adessua/ui/home/settings_ui.dart';
import 'search.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> with SingleTickerProviderStateMixin {
  TabController _tabController;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        // length: 4,
        init: AuthController(),

        // ignore: unnecessary_null_comparison
        builder: (controller) => controller.firestoreUser.value.uid == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            //
            : Scaffold(
                appBar: AppBar(
                  title: AppBarTitle(),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      icon: Icon(FontAwesomeIcons.search,size: 19,),
                      tooltip: 'search', onPressed: () => Get.to(SearchCourse())
                      // onPressed: () => Get.to(Search()),
                    ),
                  ],
                  bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.blueGrey,
                    indicatorWeight: 5,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.blueGrey,
                    isScrollable: false,
                    indicatorPadding: EdgeInsets.all(8),
                    tabs: [
                      Tab(icon: Icon(FontAwesomeIcons.home,size: 26,), text: 'Home'),
                      Tab(
                          icon: Icon(FontAwesomeIcons.bookmark,size: 26,),
                          text: 'My Courses'),
                      Tab(icon: Icon(FontAwesomeIcons.book,size: 26,), text: 'Quiz'),
                    ],
                  ),
                  elevation: 5,
                  titleSpacing: 20,
                ),
                drawer: Drawer(

                  child: ListView(

                    padding: new EdgeInsets.all(0.0),
                    children: <Widget>[

                        UserAccountsDrawerHeader(
                          margin: EdgeInsets.only(bottom: 1.0),

                          accountName: RichText(
                              text: TextSpan(

                            children: <TextSpan>[
                              TextSpan(
                                  text: controller.firestoreUser.value.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ],
                          )),
                          accountEmail: Text(
                              controller.firestoreUser.value.email,
                              style: TextStyle(fontSize: 16,

                                color: Colors.blueGrey,

                              )),
                          // decoration: BoxDecoration(
                          //   image: DecorationImage(
                          //     image:
                          //         new ExactAssetImage('assets/img/photo.png'),
                          //     fit: BoxFit.cover,
                          //   ),
                          //   color: Theme.of(context).hintColor.withOpacity(0.1),
                          // ),
                          currentAccountPicture: Avatar(
                            controller.firestoreUser.value,
                          ),
                         onDetailsPressed:   () => Get.to(UpdateProfileUI()),
                          arrowColor: Colors.white,

                        ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.user),
                        title: new Text("Edit Profile"),
                        onTap: () => Get.to(UpdateProfileUI()),
                      ),

                      ListTile(
                        leading: Icon(FontAwesomeIcons.wrench),
                        title: new Text("Settings"),
                        onTap: () => Get.to(SettingsUI()),
                      ),
                      // Divider(),
                      // ListTile(
                      //     leading: Icon(FontAwesomeIcons.bell),
                      //     title: Text("Notification"),
                      //     onTap: () {}),

                      Divider(),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.infoCircle),
                        title: new Text("About "),
                        onTap: () => Get.to(AboutUI()),
                      ),
                      ListTile(
                          leading: Icon(FontAwesomeIcons.signOutAlt),
                          title: Text('settings.signOut'.tr),
                          onTap: () {
                            AuthController.to.signOut();
                          }),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: Text(
                            'Adessua v2.0.0',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: SafeArea(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: <Widget>[
                      HomeTab(),
                      CourseList(),
                      QuizTab(),
                    ],
                  ),
                ),
              ));
  }
}
