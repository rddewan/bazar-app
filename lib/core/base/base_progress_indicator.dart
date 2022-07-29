import 'package:flutter/material.dart';


class BaseProgressIndicator extends StatelessWidget {
  final Color? valueColor;
  final Color? backgroundColor;
  const BaseProgressIndicator({Key? key, this.valueColor, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: backgroundColor ?? Colors.green,
            valueColor: AlwaysStoppedAnimation<Color>(valueColor ?? Colors.greenAccent),
          ),
        );
  }
}