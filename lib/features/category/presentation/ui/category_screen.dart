
import 'package:bazar/core/base/base_async_value_widget.dart';
import 'package:bazar/features/category/presentation/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  
  @override
  void initState() {    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(categoryControllerProvider.notifier).getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(categoryControllerProvider.select((value) => value.categories));

    return BaseAsyncValueWidget(
        value: value, 
        data: (data) {
          return SliverList(
            delegate:SliverChildBuilderDelegate((context,index) {
              final category = data[index];
      
              return Container(
                color: Colors.greenAccent,
                child: Card(
                  child: Column(
                    children: [
                      Image.network(category.thumbnail),
                      Text(category.name)
                    ],
                  ),
                ),
              );
            },childCount: data.length),
          );
        }
      );

  }
}