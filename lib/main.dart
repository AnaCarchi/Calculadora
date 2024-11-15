import 'package:flutter/material.dart';

void main() => runApp(const CalculadoraApp());

class CalculadoraApp extends StatefulWidget {
  const CalculadoraApp({super.key});

  @override
  State<CalculadoraApp> createState() => _CalculadoraAppState();
}

class _CalculadoraAppState extends State<CalculadoraApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      num1 = double.parse(_output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_output);

      switch (operand) {
        case "+":
          _output = (num1 + num2).toString();
          break;
        case "-":
          _output = (num1 - num2).toString();
          break;
        case "x":
          _output = (num1 * num2).toString();
          break;
        case "/":
          _output = (num1 / num2).toString();
          break;
      }

      operand = "";
      num1 = 0.0;
      num2 = 0.0;
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output = _output + buttonText;
      }
    }

    setState(() {
      output = _output;
    });
  }

  Widget buildButton(String buttonText, Color color) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: MaterialButton(
          padding: const EdgeInsets.all(24.0),
          color: color,
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 137, 219),
      appBar: AppBar(
        title: const Text("Calculadora"),
        backgroundColor: Color.fromARGB(255, 253, 253, 253),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0,
                ),
                child: Text(
                  output,
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(color: Colors.white),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        buildButton("7", Colors.grey),
                        buildButton("8", Colors.grey),
                        buildButton("9", Colors.grey),
                        buildButton("/", Colors.blue),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("4", Colors.grey),
                        buildButton("5", Colors.grey),
                        buildButton("6", Colors.grey),
                        buildButton("x", Colors.blue),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("1", Colors.grey),
                        buildButton("2", Colors.grey),
                        buildButton("3", Colors.grey),
                        buildButton("-", Colors.blue),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("0", Colors.grey),
                        buildButton(".", Colors.grey),
                        buildButton("C", Colors.red),
                        buildButton("+", Colors.blue),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: buildButton("=", Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
