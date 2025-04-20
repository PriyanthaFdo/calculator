import 'dart:io';

import 'package:calculator/core/constants/k_values.dart';
import 'package:calculator/core/constants/kjp_styles.dart';
import 'package:calculator/core/pop_ups/error_view.dart';
import 'package:calculator/views/calculator_btn.dart';
import 'package:flutter/foundation.dart';
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
    '÷',
    'x',
  ];

  static const _functions = [
    '=',
    '←',
    'C',
    '%',
    '+-',
  ];

  static const _memoryFunctions = [
    "mc",
    "m+",
    "m-",
    "mr"
  ];

  String _displayValue = '0';
  String _previousKey = '';
  String _operationDisplay = "";
  double _storedValue = 0;
  String? _storedOperation;
  bool _resetDisplay = false;

  double? _memory;

  void _keyPress(String key) {
    try {
      if (_numbers.contains(key)) {
        _numberPress(key);
      } else if (_operations.contains(key)) {
        _operationPress(key);
      } else if (_functions.contains(key)) {
        _functionPress(key);
      } else if (_memoryFunctions.contains(key)) {
        _memoryFunc(key);
      } else if (key == '.') {
        if (_resetDisplay) {
          _displayValue = '0.';
        }
        if (!_displayValue.contains('.')) {
          _displayValue += key;
        }
        _resetDisplay = false;
      }

      _previousKey = key;

      // update UI
      setState(() {});
    } catch (e, s) {
      debugPrint('$e');
      debugPrintStack(stackTrace: s);
      showError(context, e.toString());
    }
  }

  void _numberPress(String key) {
    if (_displayValue == '0' || _resetDisplay) {
      _displayValue = key;
      _resetDisplay = false;
      if (_previousKey == '=') {
        _operationDisplay = "";
      }
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
      _operationCalculation(key);
    }
    _storedValue = double.parse(_displayValue);
    _storedOperation = key;
    _operationDisplay = key;
    _resetDisplay = true;
  }

  void _operationCalculation(String key) {
    switch (_storedOperation) {
      case '+':
        _displayValue = "${_storedValue + double.parse(_displayValue)}";
        break;
      case '-':
        _displayValue = "${_storedValue - double.parse(_displayValue)}";
        break;
      case '÷':
        if (_displayValue == '0') {
          _error();
          return;
        }
        _displayValue = "${_storedValue / double.parse(_displayValue)}";
        break;
      case 'x':
        _displayValue = "${_storedValue * double.parse(_displayValue)}";
        break;

      default:
    }
  }

  void _functionPress(String key) {
    if (key == 'C') {
      _displayValue = '0';
      _storedValue = 0;
      _storedOperation = "";
      _operationDisplay = "";
    } else if (key == '←') {
      _displayValue = _displayValue.characters.skipLast(1).string;
    } else if (key == '=') {
      if (_previousKey == '=') {
        return;
      }
      _operationCalculation(key);
      _storedOperation = null;
      _resetDisplay = true;
      _operationDisplay = "=";
    } else if (key == "+-") {
      if (_displayValue.contains("-")) {
        _displayValue = _displayValue.replaceAll("-", "");
      } else {
        _displayValue = "-$_displayValue";
      }
    } else if (key == "%") {
      final val = double.tryParse(_displayValue);
      if (val != null && _storedValue != 0) {
        _displayValue = "${(_storedValue * val) / 100}";
      }
    }
  }

  void _error() {
    _displayValue = 'Error';
    _storedOperation = null;
    _previousKey = '';
    _storedValue = 0;
    _resetDisplay = true;
  }

  void _memoryFunc(String key) {
    switch (key) {
      case "mc":
        if (_previousKey == "mc") {
          _memory = null;
        } else {
          _displayValue = "${_memory ?? 0}";
        }
        break;
      case "m+":
        _memory = (_memory ?? 0) + (double.tryParse(_displayValue) ?? 0);
        _displayValue = "${_memory ?? 0}";
        break;
      case "m-":
        _memory = (_memory ?? 0) - (double.tryParse(_displayValue) ?? 0);
        _displayValue = "${_memory ?? 0}";
        break;
      case "mr":
        _displayValue = "${_memory ?? 0}";
        break;
      default:
    }
    _resetDisplay = true;
  }

  Widget responsiveHandler({required BuildContext context, required Widget child}) {
    return Row(
      children: [
        if (kIsWeb || !Platform.isAndroid) Spacer(),
        Expanded(child: child),
        if (kIsWeb || !Platform.isAndroid) Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: kIsDebugMode
          ? FloatingActionButton(
              onPressed: () => throw "Test Error",
              child: Icon(Icons.error),
            )
          : null,
      body: responsiveHandler(
        context: context,
        child: Container(
          padding: KjpStyles.genericSpacing,
          decoration: BoxDecoration(color: Colors.grey[600]),
          width: MediaQuery.of(context).orientation == Orientation.landscape //
              ? MediaQuery.of(context).size.height * 0.6
              : null,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: KjpStyles.genericSpacing,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: KjpStyles.borderRadius,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _memory != null ? "M" : "",
                        style: TextStyle(fontSize: 18, height: 0),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            _operationDisplay,
                            style: TextStyle(fontSize: 18, height: 0),
                          ),
                          Text(
                            _displayValue,
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ],
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
                        onTap: () => _keyPress("mc"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "m+",
                        onTap: () => _keyPress("m+"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "m-",
                        onTap: () => _keyPress("m-"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "mr",
                        onTap: () => _keyPress("mr"),
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
                        onTap: () => _keyPress('÷'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "×",
                        onTap: () => _keyPress('x'),
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
                      child: CalculatorBtn(
                        child: "+/-",
                        onTap: () => _keyPress('+-'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
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
