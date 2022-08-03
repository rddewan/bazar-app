import 'package:bazar/core/base/base_async_value_widget.dart';
import 'package:bazar/features/brand/domain/model/brand_model.dart';
import 'package:bazar/features/brand/presentation/controller/brand_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrandScreen extends ConsumerStatefulWidget {
  const BrandScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends ConsumerState<BrandScreen> {

  @override
  void initState() {    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(brandControllerProvider.notifier).getBrands();
    });
  }

  @override
  Widget build(BuildContext context) {
    final  value = ref.watch(brandControllerProvider.select((value) => value.brands));

    return BaseAsyncValueWidget(
      value: value, 
      data: (List<BrandModel> data) {
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final brand = data[index];

            return Container(
              color: Colors.indigo,
              child: Card(
                child: Column(
                  children: [
                    Image.network(brand.thumbnail),
                    Text(brand.name)
                  ],
                ),
              ),
            );
          },childCount: data.length,),
        );

      },
    );
  }
}