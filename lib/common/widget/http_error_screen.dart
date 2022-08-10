import 'package:flutter/material.dart';

class HttpErrorScreen extends StatelessWidget {
  final String data;
  const HttpErrorScreen({required this.data,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(data),
      ),
    );
  }
}