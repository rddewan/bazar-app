

import 'dart:async';
import 'dart:io';

import 'package:bazar/core/error/failure.dart';
import 'package:bazar/core/status_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final baseRepositoryProvider = Provider<BaseRepository>((ref) {
  return BaseRepository();
});

class BaseRepository {

  Future<T> call<T>(FutureOr<T> Function() call) async  {
    try {

      return await call();

    } on DioError catch (e){

      if (e.error is SocketException) {
        throw Failure(message: e.message);
      }

      if (e.response?.statusCode == kServerErrorCode) {
        throw Failure(
          message: 'Server has some issue, please try again',
          code: e.response?.statusCode,
        );
      }
      
      throw Failure(
          message: e.response?.statusMessage ?? 'Something went wrong',
          code: e.response?.statusCode,
          exception: e,
      );
    }
  }

}