// Provide a instance od Dio

import 'dart:io';

import 'package:bazar/core/remote/network_service_interceptor.dart';
import 'package:dio/adapter.dart';
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
    
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) { 
      // Hook into the findProxy callback to set the client's proxy.
      client.findProxy = (url) {
        // replace you proxy ip and port here
        return 'PROXY 192.168.1.10:9090';
      };
      
      // This is a workaround to allow Proxyman to receive
      // SSL payloads when your app is running on Android.
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => Platform.isAndroid;

      return client;
      
    }; 
  
  return dio;

});
