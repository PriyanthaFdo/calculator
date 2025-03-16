import 'package:flutter/material.dart';

/// Created By Priyantha Fernando
/// on 30-Oct-2023
///
/// This widget can be used to easily deactivate any widget.
/// This will remove all pointer interactions
/// and add an opacity when deactivated
class Deactivate extends StatelessWidget {
  final Widget child;
  final bool deactivate;
  final double deactivatedOpacity;
  final String? toolTipOnDeactivate;

  const Deactivate({
    super.key,
    required this.child,
    required this.deactivate,
    this.deactivatedOpacity = 0.3,
    this.toolTipOnDeactivate,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipOnDeactivate != null && deactivate ? toolTipOnDeactivate : "",
      child: IgnorePointer(
        ignoring: deactivate,
        child: Opacity(
          opacity: deactivate ? deactivatedOpacity : 1,
          child: child,
        ),
      ),
    );
  }
}
