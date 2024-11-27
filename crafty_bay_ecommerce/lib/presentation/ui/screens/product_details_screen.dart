import 'package:crafty_bay_ecommerce/data/model/Product_details.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/review_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/style.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/custom_picker.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/home/product_details_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
            if (productDetailsController.getProductDetailsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Column(
                children: [
                  productDetailsAppBar,
                  ProductDetailsSlider(
                    imageList: [
                      productDetailsController.productDetails.img1 ?? "",
                      productDetailsController.productDetails.img2 ?? "",
                      productDetailsController.productDetails.img3 ?? "",
                      productDetailsController.productDetails.img3 ?? "",
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: productDetails(
                          productDetailsController.productDetails,
                          productDetailsController.productColor),
                    ),
                  ),
                  // Container(
                  //   height: 80,
                  //   decoration: BoxDecoration(
                  //       color: primeColor.withOpacity(0.15),
                  //       borderRadius: BorderRadius.circular(24)),
                  //   child: Center(
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //       child: ListTile(
                  //         title: Text(
                  //           "Price:",
                  //           style: Theme
                  //               .of(context)
                  //               .textTheme
                  //               .titleMedium!
                  //               .copyWith(fontSize: 16),
                  //         ),
                  //         subtitle: Text(
                  //           "\$100:",
                  //           style: Theme
                  //               .of(context)
                  //               .textTheme
                  //               .titleLarge!
                  //               .copyWith(color: primeColor),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                  cartBottomContainer(productDetailsController.productDetails,productDetailsController.productColor,productDetailsController.productSized)
                ],
              ),
            );
          }),
      // floatingActionButton: SizedBox(
      //     width: 100,
      //     height: 40,
      //     child:
      //         GetBuilder<AddToCartController>(builder: (addToCartController) {
      //       if (addToCartController.addToCartInProgress) {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       return FloatingActionButton(
      //         onPressed: () async {
      //           final result = await addToCartController.addToCart(
      //               ProductDetailsData().product?.id ?? 0,
      //               ProductDetailsData().color ?? " ",
      //               ProductDetailsData().size ?? "",
      //               quantity);
      //
      //           if ( result) {
      //             Get.snackbar("Done!", "This product has been added.",
      //                 snackPosition: SnackPosition.BOTTOM);
      //             Get.to(()=> const CartListScreen());
      //           }
      //         },
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(5)),
      //         child: Text(
      //           "add to cart",
      //           style: Theme.of(context)
      //               .textTheme
      //               .titleMedium!
      //               .copyWith(color: Colors.white),
      //         ),
      //       );
      //     })),
    );
  }

  Padding productDetails(ProductDetailsData productDetails,
      List<String> colors) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  productDetails.product?.title ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: CustomStepper(
                    lowerLimit: 1,
                    upperLimit: 10,
                    stepValue: 1,
                    value: 1,
                    onChange: (newValue) {
                      quantity = newValue;
                    }),
              )
            ],
          ),
          Row(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.amber,
                  ),
                  Text(
                    " ${productDetails.product?.star ?? 0} ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Get.to(const ReviewScreen(),
                        transition: Transition.rightToLeft);
                  },
                  child: const Text(
                    "Review",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )),
              Card(
                color: primeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Color",
            style: mediumTextStyle(Colors.black54),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 35,
            child: SizedBox(
              height: 35,
              child: CustomPicker(productDetails.color?.split(",") ?? [],
                      (int selectIndex) {
                    _selectedColorIndex = selectIndex;
                  }, 0),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Size",
            style: mediumTextStyle(Colors.black54),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 35,
            child: SizedBox(
              height: 35,
              child: CustomPicker(productDetails.size?.split(",") ?? [],
                      (int selectedIndex) {
                    _selectedColorIndex = selectedIndex;
                  }, 0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Description",
            style: mediumTextStyle(Colors.black54),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(productDetails.product?.shortDes ?? "",
              style: smallTextStyle(Colors.black38)),
        ],
      ),
    );
  }

  Container cartBottomContainer(ProductDetailsData productDetails,
      List<String> colors,
      List<String> sizes,) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: primeColor.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Price",
                style: mediumTextStyle(Colors.black54),
              ),
              Text(
                "\$100",
                style: largeTextStyle(primeColor),
              ),
            ],
          ),
          SizedBox(
            child: GetBuilder<AddToCartController>(
                builder: (addToCartController) {
                  if (addToCartController.addToCartInProgress) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return ElevatedButton(
                      onPressed: () async {
                        final result =await addToCartController.addToCart(
                            productDetails.productId!,
                            colors[_selectedColorIndex],
                            sizes[_selectedSizeIndex], quantity);

                        if(result){
                          Get.snackbar("Done", "Added to cart");
                        }
                      },
                      child: Text(
                        "add to cart",
                        style: TextStyle(color: Colors.white),
                      ));
                }
            ),
          )
        ],
      ),
    );
  }

  Container addToCartBottomcontainer() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 100,
      decoration: BoxDecoration(
          color: primeColor.withOpacity(0.15),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Price",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Text("\$100",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: primeColor)),
                ),
              ],
            ),
            SizedBox(
              height: 35,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add to cart', style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                    color: Colors.white
                ),),
              ),
            )


          ],
        ),
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      backgroundColor: Colors.white70,
      surfaceTintColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      title: Text("Product Details",
          style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w700)),
    );
  }
}
