
import 'package:bazar/features/brand/data/dto/response/brand_response.dart';
import 'package:bazar/features/brand/domain/model/brand_model.dart';

abstract class BrandMapper {
  List<BrandModel> mapToBrandModel(List<BrandResponse> response);
}