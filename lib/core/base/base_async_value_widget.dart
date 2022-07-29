
import 'package:bazar/core/base/base_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class BaseAsyncValueWidget<T> extends StatelessWidget {
  const BaseAsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
  }) : super(key: key);

  final AsyncValue<T> value;
  final Widget Function(T) data;  

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data, 
      error: (e,s) => Center(child: Text(e.toString()),), 
      loading: () => const BaseProgressIndicator(),
    );
  }


}