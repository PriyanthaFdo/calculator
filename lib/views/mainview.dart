import 'package:calculator/core/constants/kjp_styles.dart';
import 'package:calculator/views/calculator_btn.dart';
import 'package:flutter/material.dart';

class Mainview extends StatefulWidget {
  const Mainview({super.key});

  @override
  State<Mainview> createState() => _MainviewState();
}

class _MainviewState extends State<Mainview> {
  static const _numbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ];

  static const _operations = [
    '+',
    '-',
    '/',
    '*',
    '=',
    '←',
    'C',
    '%',
  ];

  String _displayValue = '0';

  void _keyPress(String key) {
    if (_numbers.contains(key)) {
      _numberPress(key);
    } else if (_operations.contains(key)) {
      _operationSelect(key);
    } else if (key == '.') {
      // Decimal point
      if (!_displayValue.contains('.')) {
        _displayValue += key;
      }
    }

    // update UI
    setState(() {});
  }

  void _numberPress(String key) {
    if (_displayValue == '0') {
      _displayValue = key;
    } else {
      _displayValue += key;
    }
  }

  void _operationSelect(String key) {
    switch (key) {
      case 'C':
        _displayValue = '0';
        break;
      case '←':
        _displayValue = _displayValue.characters.skipLast(1).string;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: KjpStyles.genericSpacing,
          padding: KjpStyles.genericSpacing,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            border: Border.all(),
            borderRadius: KjpStyles.borderRadius,
          ),
          width: MediaQuery.of(context).orientation == Orientation.landscape //
              ? MediaQuery.of(context).size.height * 0.6
              : null,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: KjpStyles.genericSpacing,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: KjpStyles.borderRadius,
                  ),
                  child: Text(
                    _displayValue,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CalculatorBtn(
                        child: "mc",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "m+",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "m-",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "mr",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CalculatorBtn(
                        child: "C",
                        onTap: () => _keyPress('C'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "÷",
                        onTap: () => _keyPress('/'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "×",
                        onTap: () => _keyPress('*'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "⌫",
                        onTap: () => _keyPress('←'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CalculatorBtn(
                        child: "7",
                        onTap: () => _keyPress('7'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "8",
                        onTap: () => _keyPress('8'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "9",
                        onTap: () => _keyPress('9'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "-",
                        onTap: () => _keyPress('-'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CalculatorBtn(
                        child: "4",
                        onTap: () => _keyPress('4'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "5",
                        onTap: () => _keyPress('5'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "6",
                        onTap: () => _keyPress('6'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "+",
                        onTap: () => _keyPress('+'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CalculatorBtn(
                        child: "1",
                        onTap: () => _keyPress('1'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "2",
                        onTap: () => _keyPress('2'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "3",
                        onTap: () => _keyPress('3'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "%",
                        onTap: () => _keyPress('%'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CalculatorBtn(
                        child: ".",
                        onTap: () => _keyPress('.'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: CalculatorBtn(
                        child: "0",
                        onTap: () => _keyPress('0'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: CalculatorBtn(
                        child: "=",
                        onTap: () => _keyPress('='),
                      ),
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
