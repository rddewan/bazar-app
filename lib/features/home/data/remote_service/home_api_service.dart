
import 'package:bazar/core/remote/network_service.dart';
import 'package:bazar/features/home/data/dto/response/product/product_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

final homeApiServiceProvider = Provider<HomeApiService>((ref) {

  final dio = ref.watch(networkServiceProvider);

  return HomeApiService(dio);
});

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio) => _HomeApiService(dio);

  @GET('api/v1/product/getProducts')
  Future<ProductResponse> getProducts(@Queries() Map<String,dynamic>  query);
}