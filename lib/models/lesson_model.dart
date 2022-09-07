import 'package:cloud_firestore/cloud_firestore.dart';


class LessonModel{




  String section,topicName,hours,videoFile,pdfFile;

  LessonModel({
      this.section, this.topicName, this.hours, this.videoFile,this.pdfFile} );


  // factory  LessonModel.fromDoc(DocumentSnapshot doc) {
  //   return  LessonModel(
  //
  //     topicName: doc['topicName'],
  //     section: doc['section'],
  //     hours: doc['hours'],
  //   );
  // }



factory LessonModel.fromJson(Map<String,dynamic>json){

  return LessonModel(
    section: json['section'],
      topicName: json['topicName'],

      hours: json['hours'],
      videoFile: json['videoFile'] ,
    pdfFile: json['pdfFile'] ,

  );


}
Map<String,dynamic>json(){
     return {
       'section': section,
        'topicName': topicName,
       'hours': hours,
       'videoFile':videoFile,
       'pdfFile':pdfFile

     };
}



  }









