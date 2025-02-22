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
  ];

  static const _functions = [
    '=',
    '←',
    'C',
    '%',
  ];

  String _displayValue = '0';
  String _previousKey = '';
  double _storedValue = 0;
  String? _storedOperation;
  bool _resetUI = false;

  void _keyPress(String key) {
    if (_numbers.contains(key)) {
      _numberPress(key);
    } else if (_operations.contains(key)) {
      _operationPress(key);
    } else if (_functions.contains(key)) {
      _functionPress(key);
    } else if (key == '.') {
      // Decimal point
      if (!_displayValue.contains('.')) {
        _displayValue += key;
      }
    }

    _previousKey = key;

    // update UI
    setState(() {});
  }

  void _numberPress(String key) {
    if (_displayValue == '0' || _resetUI) {
      _displayValue = key;
      _resetUI = false;
    } else {
      _displayValue += key;
    }
  }

  void _operationPress(String key) {
    if (_previousKey == key) {
      return;
    } else if (_operations.contains(_previousKey)) {
      _storedOperation = key;
    } else {
      switch (_storedOperation) {
        case '+':
          _displayValue = "${_storedValue + double.parse(_displayValue)}";
          break;
        case '-':
          _displayValue = "${_storedValue - double.parse(_displayValue)}";
          break;
        case '/':
          if (_displayValue == '0') {
            _error();
            return;
          }
          _displayValue = "${_storedValue / double.parse(_displayValue)}";
          break;
        case '*':
          _displayValue = "${_storedValue * double.parse(_displayValue)}";
          break;

        default:
      }
    }
    _storedValue = double.parse(_displayValue);
    _storedOperation = key;
    _resetUI = true;
  }

  void _functionPress(String key) {
    if (key == 'C') {
      _displayValue = '0';
    } else if (key == '←') {
      _displayValue = _displayValue.characters.skipLast(1).string;
    }
  }

  void _error() {
    _displayValue = 'Error';
    _storedOperation = null;
    _previousKey = '';
    _storedValue = 0;
    _resetUI = true;
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
