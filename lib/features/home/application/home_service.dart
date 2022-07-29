

import 'package:bazar/core/error/failure.dart';
import 'package:bazar/features/home/domain/models/product/product_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class HomeService {
  Future<Result<Failure,List<ProductModel>>> getProducts(Map<String,dynamic>  query);
 }