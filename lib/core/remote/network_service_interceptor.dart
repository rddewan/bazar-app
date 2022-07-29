
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final networkServiceInterceptorProvider = Provider<NetworkServiceInterceptor>((ref) {
  return NetworkServiceInterceptor();
});

/// NetworkServiceInterceptor will override the onRequest method from  Dio Interceptor class
/// onRequest method will add out custom headers
class NetworkServiceInterceptor extends Interceptor {
  NetworkServiceInterceptor();
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
     options.headers['Accept'] = 'application/json';
    
    super.onRequest(options, handler);
  }
  
}
