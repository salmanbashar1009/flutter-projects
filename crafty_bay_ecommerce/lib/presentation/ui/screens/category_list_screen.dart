import 'package:crafty_bay_ecommerce/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/product_list_by_category_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: IconButton(
                onPressed: () {
                  Get.find<MainBottomNavBarController>().backToHome();
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
          title: Text(
            "Categories",
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              if(categoryListController.getCategoriesInProgress){
                return const Center(child: CircularProgressIndicator(),);
              }
              return GridView.builder(
                  itemCount:categoryListController.categoryListModel.data?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, mainAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    return  FittedBox(child: CatergoryCard(categoryListData:categoryListController.categoryListModel.data![index],onTap: (){
                      Get.to(()=> ProductListByCategoryScreen(categoryId: categoryListController.categoryListModel.data![index].id,));
                    },));
                  });
            }
          ),
        ));
  }
}
