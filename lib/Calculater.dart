import 'dart:math';

import 'package:flutter/material.dart';

class calculater extends StatefulWidget {
  const calculater({super.key});

  @override
  State<calculater> createState() => _calculaterState();
}

class _calculaterState extends State<calculater> {
  void dispose(){
    N.dispose();
    super.dispose();
  }

  final  N = TextEditingController();
  String num1="",num2="",opt="";

  bool m= false;
  void clearText()
  {
    N.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(
            title: Text("Calculator"),
          ),
      body:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 350, 20, 10),
              child: TextFormField(
                controller: N,
                decoration: InputDecoration(
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    N.text ="";
                    num1="";
                    num2="";
                    opt="";
                    m =false;

                   }, child: Text("AC")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text=N.text.substring(0,N.text.length-1);
                    });

                  }, child: Text("c",style: TextStyle(fontSize: 20)),),
                  ElevatedButton(onPressed: (){
                    N.text="√";
                    opt ="√";
                    m=true;
                  }, child: Text("√")),

                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text="/";
                      opt ="/";
                      m=true;
                    });
                  }, child: Text("/")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      if(m){
                        num2+="7";
                        N.text=num2;
                      }
                      else{
                        num1+="7";
                        N.text=num1;
                      }
                    });
                  }, child: Text("7")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text+="8";
                      if(m){
                        num2+="8";
                        N.text=num2;
                      }
                      else {
                        num1 += "8";
                        N.text = num1;
                      }
                    });

                  }, child: Text("8")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text+="9";
                      if(m){
                        num2+="9";
                        N.text=num2;
                      }
                      else {
                        num1 += "9";
                        N.text = num1;
                      }
                    });
                  }, child: Text("9")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text="*";
                      opt="*";
                      m=true;
                    });
                  }, child: Text("*")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text+="4";
                      if(m){
                        num2+="4";
                        N.text=num2;
                      }
                      else{
                        num1+="4";
                        N.text=num1;
                      }
                    });

                  }, child: Text("4")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text+="5";
                      if(m){
                        num2+="5";
                        N.text=num2;
                      }
                      else{
                        num1+="5";
                        N.text=num1;
                      }
                    });
                  }, child: Text("5")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text+="6";
                      if(m){
                        num2+="6";
                        N.text=num2;
                      }
                      else{
                        num1+="6";
                        N.text=num1;
                      }
                    });
                  }, child: Text("6")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text="-";
                      opt ="-";
                      m=true;
                    });
                  }, child: Text("-")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text+="1";
                      if(m){
                        num2+="1";
                        N.text=num2;
                      }
                      else
                      {
                        num1+="1";
                        N.text=num1;
                      }
                    });
                  }, child: Text("1")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      N.text+="2";
                      if(m){
                        num2+="2";
                        N.text=num2;
                      }
                      else{
                        num1+="2";
                        N.text=num1;
                      };
                    });

                  }, child: Text("2")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      N.text+="3";
                      if(m){
                        num2+="3";
                        N.text=num2;
                      }
                      else{
                        num1+="3";
                        N.text=num1;
                      }
                    });
                  }, child: Text("3")),
                  ElevatedButton(onPressed: (){
                    N.text="+";
                    opt ="+";
                    m=true;
                  }, child: Text("+")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    N.text="%";
                    opt ="%";
                    m=true;
                  }, child: Text("%")),
                  ElevatedButton(onPressed: (){
                    N.text+="0";
                    if(m){
                      num2+="0";
                      N.text="0";
                    }
                    else(m){
                      num1+="0";
                      N.text="0";
                    };
                  }, child: Text("0")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      if(m){num2+=".";
                        N.text=num2;}
                      else{
                        num1+=".";
                        N.text=num1;
                      }
    }
                      );
                  }, child: Text(".")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      if
                      (opt =="+"){
                        double a = double.parse(num1);
                        double b = double.parse(num2);

                        double res = a+b;

                        N.text=res.toString();
                      }
                      if (
                      opt=="√"
                      ){
                        double a = double.parse(num2);
                        double res= sqrt (a);
                        N.text=res.toString();
                      }

                      if
                      (opt=="-"){
                        double a = double.parse(num1);
                        double b = double.parse(num2);

                        double res = a-b;

                        N.text=res.toString();
                      }
                      if(opt=="*"){
                        double a = double.parse(num1);
                        double b = double.parse(num2);
                        double res = a*b;
                        N.text=res.toString();

                      }
                      if(opt=="/")
                      {
                        double a = double.parse(num1);
                        double b = double.parse(num2);
                        double res=a/b;
                        N.text=res.toString();
                      }
                      if(opt=="%")
                      {
                        double a = double.parse(num1);
                        double b = double.parse(num2);
                        double res=a*b/100;
                        N.text=res.toString();
                      }
                    });



                  }, child: Text("=")),
                ],
              ),
            ),
          ],

        ),

    );
  }
}
