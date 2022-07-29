

import 'package:bazar/core/remote/network_service.dart';
import 'package:bazar/features/brand/data/dto/response/brand_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'brand_api_service.g.dart';

final bandApiServiceProvider = Provider<BandApiService>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return BandApiService(dio);
});

@RestApi()
abstract class BandApiService {
  factory BandApiService(Dio dio) => _BandApiService(dio);

  @GET('api/v1/brand/getBrands')
  Future<List<BrandResponse>> getBrands();

}