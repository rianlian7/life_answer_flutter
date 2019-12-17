import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

List answers = ["Yes", "Nope", "Probably", "Absolutely", "You'll never know", "No", "Someday you'll find out", "Not today", "Very much", "Never", "Not at all", "Maybe", "Very much", "No way"];
Random randGen = new Random();
  TextEditingController textControl = new TextEditingController();
  TextEditingController answerControl = new TextEditingController();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      theme: ThemeData(
        backgroundColor: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Color(0xFF48BEFF),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      Text(
                        "ask a YES or NO question.", 
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                ]
              ),
             
             Container(
               decoration: BoxDecoration(
                 border: Border.all(width: 20,color: Color(0xFF43C59E)),
                 borderRadius: BorderRadius.all(Radius.circular(10)),
                 color: Color(0xFF43C59E),
                 boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 0.5, // has the effect of extending the shadow
                    offset: Offset(
                      5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                 ]
               ),

              child: Row(
                  children:[
                    Expanded(
                      
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: textControl,
                            decoration: InputDecoration(
                              hintText: "Ask me something",
                              contentPadding: EdgeInsets.all(10),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),

                          SizedBox(
                            width: double.infinity,
                            child: FlatButton(
                            padding: EdgeInsets.only(top: 30, bottom: 10),
                            child: Text("Send", style: TextStyle(color: Colors.white)),
                            onPressed: (){
                              if (textControl.text == ""){
                                return showDialog(
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      content: Text("You're not giving me any questions."),
                                    );
                                  }
                                );
                              }
                              else{
                                int randAns = randGen.nextInt(answers.length);
                                textControl.clear();
                                return showDialog(
                                  
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      content: Text(answers[randAns]),
                                    );
                                  },  
                                );
                              }
                            },

                            ),
                          )
                        ],
                      ),
                    )
                  
                ],
              ),
             ),
            ],
          ),
        ),
      );
  }
}
