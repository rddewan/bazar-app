
import 'package:bazar/core/error/failure.dart';
import 'package:bazar/features/brand/domain/model/brand_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class BrandService {
  Future<Result<Failure,List<BrandModel>>> getBrands();

}