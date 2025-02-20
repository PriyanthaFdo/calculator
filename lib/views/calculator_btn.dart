import 'package:calculator/constants/kjp_styles.dart';
import 'package:flutter/material.dart';

class CalculatorBtn extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final VoidCallback onTap;
  final String child;
  const CalculatorBtn({
    super.key,
    required this.onTap,
    this.child = "0",
    this.height = double.infinity,
    this.width = double.infinity,
    this.color = Colors.white,
  }) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: KjpStyles.borderRadius,
          border: Border.all(),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          final size = constraints.biggest.shortestSide / 1.8;
          return Text(
            child,
            style: TextStyle(
              fontSize: size,
              height: kTextHeightNone,
              fontWeight: FontWeight.bold,
            ),
          );
        }),
      ),
    );
  }
}
