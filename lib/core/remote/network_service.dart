// Provide a instance od Dio

import 'package:bazar/core/remote/network_service_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provide the instance of Dio
final networkServiceProvider = Provider<Dio>((ref) {
  
  final options = BaseOptions(
    baseUrl: 'https://bazar.rdewan.dev/',
    connectTimeout: 1000 * 60,
    sendTimeout: 1000 * 60,
    receiveTimeout: 1000 * 60,    
  );

  // Add our custom interceptors
  final dio = Dio(options)
    ..interceptors.addAll([
      HttpFormatter(),
      ref.watch(networkServiceInterceptorProvider)
    ]);
    
  
  return dio;

});
