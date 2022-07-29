

import 'package:bazar/core/base/base_repository.dart';
import 'package:bazar/features/brand/data/dto/response/brand_response.dart';
import 'package:bazar/features/brand/data/remote_service/brand_api_service.dart';
import 'package:bazar/features/brand/data/repository/brand_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brandRepositoryProvider = Provider<BrandRepository>((ref) {

  final brandApiService = ref.watch(bandApiServiceProvider);
  final baseRepository = ref.watch(baseRepositoryProvider);

  return BrandRepositoryImpl(brandApiService,baseRepository);

});

class BrandRepositoryImpl implements BrandRepository {
  final BandApiService _brandApiService;
  final BaseRepository _baseRepository;

  BrandRepositoryImpl(this._brandApiService, this._baseRepository);
  
  @override
  Future<List<BrandResponse>> getBrands() {
    return _baseRepository.call(() => _brandApiService.getBrands());
  }
  
}