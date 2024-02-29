import 'package:flutter/material.dart';

class Gst extends StatefulWidget {
  const Gst({Key? key});

  @override
  State<Gst> createState() => _GstState();
}

class _GstState extends State<Gst> {
  double Amount = 0.0;
  double Tax = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Gst Calculator")),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 450,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Text(
                            "Amount",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            onChanged: (String value) {
                              try {
                                Amount = double.parse(value);
                              } catch (exception) {
                                Amount = 0.0;
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Amount",
                            ),
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
                          child: Text(
                            "GST %",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            onChanged: (String value) {
                              try {
                                Tax = double.parse(value);
                              } catch (exception) {
                                Tax = 0.0;
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Gst %",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      double calculatorGst = Amount * Tax / 100.0;
                      double sgst = calculatorGst / 2.0;
                      double cgst = calculatorGst  / 2.0;
                      double total = Amount + calculatorGst;
                      // Show a dialog with the calculated results
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Calculation Results'),
                            content: Column(
                              children: [
                                Text('Amount: $Amount'),
                                Text('CGST: $cgst'),
                                Text('SGST: $sgst'),
                                Text('Total: $total'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Exclusive"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        double calculatorGst = Amount * (18 / 118);
                        double gst = Amount  - calculatorGst;
                        double sgst = calculatorGst / 2.0;
                        double cgst = calculatorGst  / 2.0;
                        double total = Amount + gst;
                        // Show a dialog with the calculated results
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Calculation Results'),
                              content: Column(
                                children: [
                                  Text('Amount: $Amount'),
                                  Text('GST: $gst'),
                                  Text("Sgst: $sgst"),
                                  Text("Cgst: $cgst"),
                                  Text('Total: $total'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Close the dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text("Inclusive"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
