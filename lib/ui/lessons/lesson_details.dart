import 'package:adessua/ui/components/appbar_title.dart';
import 'package:adessua/controllers/pdf_controller.dart';

import 'package:flutter/material.dart';

import 'Details.dart';

class CourseDetails extends StatefulWidget {
  final String id;
  CourseDetails(this.id);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 3,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blueGrey,
          isScrollable: false,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xffb9b9b9),
          ),
          indicatorPadding: EdgeInsets.all(8),
          tabs: [
            Tab(text: 'Lessons'),
            Tab(text: 'Curriculum'),
          ],
        ),
        elevation: 5,
        titleSpacing: 20,
      ),
      body: SafeArea(
        child: TabBarView(
          physics: ClampingScrollPhysics(),
          controller: _tabController,
          children: <Widget>[
            // LessonsList(),
            // VideoInfo(),
            Details(widget.id),
            PdfRender(),
          ],
        ),
      ),
    );
  }
}


