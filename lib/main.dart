import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';

  void onNumberPress(String number) {
    setState(() {
      if (display == '0') {
        display = number;
      } else {
        display += number;
      }
    });
  }

  void onOperatorPress(String operator) {
    setState(() {
      display += operator;
    });
  }

  void onClear() {
    setState(() {
      display = '0';
    });
  }

  void onCalculate() {
    try {
      setState(() {
        display = (double.parse(display)).toString();
      });
    } catch (e) {
      setState(() {
        display = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[900],
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: const TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  final button = buttons[index];
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: button['color'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: () {
                      final value = button['value'];
                      if (value == 'C') {
                        onClear();
                      } else if (value == '=') {
                        onCalculate();
                      } else if ('+-*/%'.contains(value)) {
                        onOperatorPress(value);
                      } else {
                        onNumberPress(value);
                      }
                    },
                    // child: Text(
                    //   button['value'],
                    //   style: const TextStyle(
                    //     fontSize: 24,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    child: Text(
                      button['value'],
                      style: TextStyle(
                        fontSize: 24,
                        color: button['value'] == 'C'
                            ? Colors.orange
                            : Colors
                                .white, // Faqat "5" raqamining matn rangi qizil bo'ladi
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> buttons = [
  {
    'value': 'C',
    'color': Colors.grey[700],
  },
  {'value': '%', 'color': Colors.grey},
  {'value': '+/-', 'color': Colors.grey},
  {'value': '/', 'color': Colors.grey},
  {'value': '7', 'color': Colors.grey[800]},
  {'value': '8', 'color': Colors.grey[800]},
  {'value': '9', 'color': Colors.grey[800]},
  {'value': '*', 'color': Colors.grey},
  {'value': '4', 'color': Colors.grey[800]},
  {'value': '5', 'color': Colors.grey[800]},
  {'value': '6', 'color': Colors.grey[800]},
  {'value': '-', 'color': Colors.grey},
  {'value': '1', 'color': Colors.grey[800]},
  {'value': '2', 'color': Colors.grey[800]},
  {'value': '3', 'color': Colors.grey[800]},
  {'value': '+', 'color': Colors.grey},
  {'value': '.', 'color': Colors.grey[800]},
  {'value': '0', 'color': Colors.grey[800]},
  {'value': '<', 'color': Colors.grey},
  {'value': '=', 'color': Colors.grey[700]},
];
