import 'package:bazar/core/base/base_async_value_widget.dart';
import 'package:bazar/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {

  @override
  void initState() {    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeControllerProvider.notifier).getProducts();      
    });
  }

  @override
  Widget build(BuildContext context) {
    final productModel = ref.watch(homeControllerProvider.select((value) => value.products));
    return BaseAsyncValueWidget(
        value: productModel,
        data: (products) {
          return SliverList(            
            delegate: SliverChildBuilderDelegate((context, index) {
              final product = products[index];
              return Card(
                child: Column(
                  children: [
                    Image.network(product.thumbnail),
                    Text(product.sku),
                    Text(product.name),
                    Text(product.shortDescription)
                  ],
                ),
              );
            }, childCount: products.length),
          );
        },     
    );
  }
}