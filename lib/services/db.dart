import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService extends GetxController {
  getQuizData() async {
    return await FirebaseFirestore.instance.collection("Quiz").snapshots();
  }

  getQuestionData(String quizId) async {
    return await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }

  getCategoryData() async {
    return await FirebaseFirestore.instance
        .collection("lessonCategory")
        .snapshots();
  }

  getLessonData(id) async {
    return await FirebaseFirestore.instance
        .collection("lessonCategory")
        .doc(id)
        .collection("lessons")
        .get();
  }

  Future searchData(String keyword) async {
    return FirebaseFirestore.instance
        .collection('lessonCategory')
        .where('name', isGreaterThanOrEqualTo: keyword)
        .get();
  }
}
