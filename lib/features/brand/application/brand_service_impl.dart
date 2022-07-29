

import 'package:bazar/core/base/base_service.dart';
import 'package:bazar/core/base_url_provider.dart';
import 'package:bazar/core/error/failure.dart';
import 'package:bazar/features/brand/application/brand_service.dart';
import 'package:bazar/features/brand/data/dto/response/brand_response.dart';
import 'package:bazar/features/brand/data/repository/brand_repository.dart';
import 'package:bazar/features/brand/data/repository/brand_repository_impl.dart';
import 'package:bazar/features/brand/domain/mapper/brand_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:bazar/features/brand/domain/model/brand_model.dart';
import 'package:bazar/common/extension/string_to_bool.dart';

final brandServiceProvider = Provider<BrandService>((ref) {

  final brandRepository = ref.watch(brandRepositoryProvider);
  final baseService = ref.watch(baseServiceProvider);
  final baseUrl = ref.watch(baseUrlProvider);

  return BrandServiceImpl(brandRepository,baseService,baseUrl);

});

class BrandServiceImpl implements BrandService,BrandMapper {
  final BrandRepository _brandRepository;
  final BaseService _baseService;
  final String _baseUrl;

  BrandServiceImpl(this._brandRepository,this._baseService, this._baseUrl);
  
  @override
  Future<Result<Failure, List<BrandModel>>> getBrands() async {
    
    final result = await _baseService.call<Failure,List<BrandModel>>(() async {
      final data = await _brandRepository.getBrands()
        .then((value) => mapToBrandModel(value));

        return Success(data);
      
    });

    return result;
    
  }

  @override
  List<BrandModel> mapToBrandModel(List<BrandResponse> response) {
    
     return response.map((e) => BrandModel(
      id: e.id, 
      name: e.name, 
      description: e.description, 
      thumbnail: '$_baseUrl${e.thumbnail}', 
      image: '$_baseUrl${e.image}', 
      isActive: e.isActive.parseBool()
    )).toList();
  }
  
}