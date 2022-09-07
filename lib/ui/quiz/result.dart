import 'package:adessua/ui/components/appbar_title.dart';
import 'package:adessua/ui/components/primary_button.dart';
import 'package:adessua/ui/home/home.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {

  final int correct, incorrect, total;
  Results({@required this.correct, @required this.incorrect, @required this.total});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        centerTitle: true,

        elevation: 1.0,
        brightness: Brightness.light,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Correct Answer / Total : ${widget.correct}/${widget.total}", style: TextStyle(fontSize: 25),),
              SizedBox(height: 8,),
              Text("You answered correctly : ${widget.correct}", style: TextStyle(fontSize: 16, color: Colors.green), textAlign: TextAlign.center,),
              SizedBox(height: 8,),
              Text("Your incorrect answer : ${widget.incorrect}", style: TextStyle(fontSize: 16, color: Colors.red), textAlign: TextAlign.center,),

              SizedBox(height: 20,),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeUI()));
                  },
                  child: PrimaryButton(labelText: 'Go To Home',)
              ),
            ],
          ),
        ),
      ),
    );
  }
}