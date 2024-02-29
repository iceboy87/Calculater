import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  final hei = TextEditingController();
  final wei = TextEditingController();
  double Total = 0.0;
  String resultCategory = "";
  Color backgroundColor = Colors.white;
  void calculateBmi()
  {
    setState(() {
      double height = double.parse(hei.text)/100;
      double weight = double.parse(wei.text);
      double bmi = weight /(height*height);
      Total=bmi;
      resultCategory=getBmiCategory(bmi);
      backgroundColor = getResultbackgroundColor(resultCategory);
    });
  }
  String getBmiCategory(double bmi)
  {
    if (bmi < 18.5)
    {
      return "Underweight";
    }
    else if (bmi>=18.5 && bmi<24.9)
    {
      return "Normalweight";
    }
    else
    {
      return "Overweight";
    }
  }
  Color getResultbackgroundColor(String category)
  {
    switch(category){
      case "Underweight":
        return Colors.orange;
      case "Normalweight":
        return Colors.green;
      case "Overweight":
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI Calculater",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20),),
        ),
      ),
      body:
      Column(
        children: [
          Center(
            child: Container(
              height: 450,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20)
              ),
              child:
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Center(
                            child: Text("Age",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),)),
                      ),
                      Container(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Age"
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Text("Height",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: hei,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter height (CM)"
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Text("Weight",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: wei,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter weight"
                          ),
                        ),
                      ),

                    ],
                  ),
                  ElevatedButton(onPressed: ()
                  {
                    setState(() {
                      calculateBmi();
                      showDialog(context: context, builder: (BuildContext context)
                      {
                        return AlertDialog(
                          backgroundColor: backgroundColor,
                          title: Center(child: Text("BMI")),
                          content: Container(
                            height: 100,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text("BMI: $Total",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 15),),
                                Text("Category: $resultCategory",
                                  style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context,"Ok"),
                                child: Text("Ok"))
                          ],
                        );
                      });
                    });
                  }, child: Text("Calculate",
                    style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
      ),)])
    );
  }
}


// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
// content: Container(
// height: 200,
// width: 250,
// child: Column(
// children: [
// Text("GST Rs: $calculatedGst"),
// Text("Total Rs.: $total"),
// // Text("BillAmount Rs.: $"),
// ],
// ),
// ),
// );