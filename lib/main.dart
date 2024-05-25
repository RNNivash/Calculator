import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double size = 0;
  String inputValue = '';
  String calculatedValue = '';
  String operator = '';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5.1;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff7D1F94),
          title: Text(
            'CALCULATOR 🧮',
            style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  ),
          ),
        ),
        backgroundColor: Color(0xff1A0620),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Text(
                  inputValue,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 96)),
                          ReusableContainer('C', Color(0xff5B4E60)),
                          ReusableContainer('%', Color(0xff5B4E60)),
                          ReusableContainer('/', Color(0xff7D1F94)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          ReusableContainer('7', Color(0xff332636)),
                          ReusableContainer('8', Color(0xff332636)),
                          ReusableContainer('9', Color(0xff332636)),
                          ReusableContainer('x', Color(0xff7D1F94)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          ReusableContainer('4', Color(0xff332636)),
                          ReusableContainer('5', Color(0xff332636)),
                          ReusableContainer('6', Color(0xff332636)),
                          ReusableContainer('-', Color(0xff7D1F94)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          ReusableContainer('1', Color(0xff332636)),
                          ReusableContainer('2', Color(0xff332636)),
                          ReusableContainer('3', Color(0xff332636)),
                          ReusableContainer('+', Color(0xff7D1F94)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          ReusableContainer('.', Color(0xff332636)),
                          ReusableContainer('0', Color(0xff332636)),
                          ReusableContainer('←', Color(0xff332636)),
                          ReusableContainer('=', Color(0xff7D1F94)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ReusableContainer(String text, Color bgColor) {
    return InkWell(
      onTap: () {
        setState(() {
          if (text == 'C') {
            inputValue = '';
            calculatedValue = '';
            operator = '';
          } else if (text == '+' ||
              text == '-' ||
              text == 'x' ||
              text == '/' ||
              text == '%') {
            calculatedValue = inputValue;
            inputValue = '';
            operator = text;
          } else if (text == '=') {
            double cal = double.parse(calculatedValue);
            double input = double.parse(inputValue);
            double result = 0.0;
            if (operator == '+') {
              result = cal + input;
            } else if (operator == '-') {
              result = cal - input;
            } else if (operator == 'x') {
              result = cal * input;
            } else if (operator == '/') {
              result = cal / input;
            } else if (operator == '%') {
              result = cal % input;
            }

            if (result % 1 == 0) {
              inputValue = result.toInt().toString();
            } else {
              inputValue = result.toString();
            }
          } else if (text == '←') {
            if (inputValue.isNotEmpty) {
              inputValue = inputValue.substring(0, inputValue.length - 1);
            }
          } else {
            inputValue += text;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
