
// ignore_for_file: nullable_type_in_catch_clause

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';



final baseServiceProvider = Provider<BaseService>((ref) {
  return BaseService();
});

class BaseService {
  
  Future<Result<Failure,S>> call<Failure,S>(Future<Result<Failure,S>> Function() call) async {
    try {
      return await call();
    } on Failure catch (error) {
      return Error(error);
    }
  }
}