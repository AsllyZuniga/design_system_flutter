import 'package:flutter/material.dart';
import 'package:flutter_application_test/atoms/custom_button_icon.dart';
import 'package:flutter_application_test/utils/colors.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String inputText = ''; // Texto de entrada actual

  void addToInput(String char) {
    setState(() {
      inputText += char;
    });
  }

  void clearInput() {
    setState(() {
      inputText = '';
    });
  }

  void calculateResult() {
    setState(() {
      try {
        inputText = evaluateExpression(inputText).toString();
      } catch (e) {
        inputText = 'Error';
      }
    });
  }

  double evaluateExpression(String expression) {
    List<String> terms = expression.split(RegExp(r'(\+|-|\*|/)'));
    List<String> operators = expression.split(RegExp(r'[0-9.]'));

    terms.removeWhere((element) => element.isEmpty);
    operators.removeWhere((element) => element.isEmpty);

    double result = double.parse(terms[0]);

    for (int i = 1; i < terms.length; i++) {
      double value = double.parse(terms[i]);
      String operator = operators[i - 1];

      switch (operator) {
        case '+':
          result += value;
          break;
        case '-':
          result -= value;
          break;
        case '*':
          result *= value;
          break;
        case '/':
          if (value == 0) {
            throw Exception('División por cero');
          }
          result /= value;
          break;
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
      ),
      child: Column(
        children: [
          const Text('Calculadora'),
          Container(
            width: 150,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  Text(
                    inputText,
                    style: TextStyle(
                      color: inputText.startsWith('-')
                          ? CustomColors.error
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildButtonRow(['7', '8', '9', '/']),
          buildButtonRow(['4', '5', '6', '*']),
          buildButtonRow(['1', '2', '3', '-']),
          buildButtonRow(['0', '+', '=', 'C']),
        ],
      ),
    );
  }

  Widget buildButtonRow(List<String> texts) {
    return Row(
      children: texts
          .map((text) => buildButton(
                text,
                onPressed: () {
                  if (text == '=') {
                    calculateResult();
                  } else if (text == 'C') {
                    clearInput();
                  } else {
                    addToInput(text);
                  }
                },
              ))
          .toList(),
    );
  }

  Widget buildButton(String text, {VoidCallback? onPressed}) {
    return CustomIconButton(
      child: Text(
        text,
        style: TextStyle(color: CustomColors.primaryColor),
      ),
      onPressed: onPressed,
    );
  }
}
