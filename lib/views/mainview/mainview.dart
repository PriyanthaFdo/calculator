import 'package:calculator/constants/kjp_styles.dart';
import 'package:calculator/views/mainview/calculator_btn.dart';
import 'package:flutter/material.dart';

class Mainview extends StatelessWidget {
  const Mainview({super.key});

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
                    "23456789",
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
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "÷",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "×",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "⌫",
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
                        child: "7",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "8",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "9",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "-",
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
                        child: "4",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "5",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "6",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "+",
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
                        child: "1",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "2",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "3",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CalculatorBtn(
                        child: "%",
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
                      flex: 1,
                      child: CalculatorBtn(
                        child: ".",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: CalculatorBtn(
                        child: "0",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: CalculatorBtn(
                        child: "=",
                        onTap: () {},
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
