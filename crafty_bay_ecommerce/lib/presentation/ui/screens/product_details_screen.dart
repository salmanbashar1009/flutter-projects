import 'package:crafty_bay_ecommerce/presentation/ui/screens/review_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/style.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/home/product_details_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  static int _selectedColor = 0;
  static int _selectedSize = 0;

  List<Color> colors = [
    Colors.black87,
    Colors.cyan,
    Colors.brown,
    Colors.grey,
    Colors.blueAccent,
  ];

  List<String> sizes = [
    "S",
    "M",
    "L",
    "XL",
    "2L",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Stack(
              children: [
                const ProductDetailsSlider(),
                AppBar(
                  backgroundColor: Colors.transparent,
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
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
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
                            "Happy New Year Special Deal Save 30%",
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
                        const Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                            Text(
                              "4.8",
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
                              Get.to(const ReviewScreen(), transition: Transition.rightToLeft);
                            },
                            child: const Text(
                              "Review",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
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
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(28),
                              onTap: () {
                                _selectedColor = index;
                                if (mounted) {
                                  setState(() {});
                                }
                              },
                              child: CircleAvatar(
                                  backgroundColor: colors[index],
                                  child: _selectedColor == index
                                      ? const Icon(
                                          Icons.done,
                                          color: Colors.white,
                                          size: 18,
                                        )
                                      : null),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 8,
                            );
                          },
                          itemCount: colors.length),
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
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(28),
                              onTap: () {
                                _selectedSize = index;
                                if (mounted) {
                                  setState(() {});
                                }
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: _selectedSize == index
                                            ? primeColor
                                            : Colors.black87),
                                    shape: BoxShape.circle,
                                    color: _selectedSize == index
                                        ? primeColor
                                        : Colors.transparent),
                                child: Center(
                                  child: Text(
                                    sizes[index],
                                    style: TextStyle(
                                        color: _selectedSize == index
                                            ? Colors.white
                                            : Colors.black87,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 16,
                            );
                          },
                          itemCount: colors.length),
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
                    Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam luctus, neque a ullamcorper molestie, ex nisl aliquet lectus, vel volutpat mi nisi vel velit. Maecenas id mauris purus. Suspendisse a malesuada neque, malesuada vulputate lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam quis facilisis elit, ut rutrum nibh. Ut suscipit, dolor eget lobortis dapibus, arcu ligula pharetra tortor, vel dapibus justo leo id velit. Aenean laoreet nisi ut turpis ullamcorper ornare.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam luctus, neque a ullamcorper molestie, ex nisl aliquet lectus, vel volutpat mi nisi vel velit. Maecenas id mauris purus. Suspendisse a malesuada neque, malesuada vulputate lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam quis facilisis elit, ut rutrum nibh. Ut suscipit, dolor eget lobortis dapibus, arcu ligula pharetra tortor, vel dapibus justo leo id velit. Aenean laoreet nisi ut turpis ullamcorper ornare. ''',
                        style: smallTextStyle(Colors.black38)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: primeColor.withOpacity(0.15),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Price",style: mediumTextStyle(Colors.black54),),
                    Text("\$100",style: largeTextStyle(primeColor),),
                  ],
                ),
                ElevatedButton(onPressed: (){}, child: Text("Add To Cart",style: smallTextStyle(Colors.white),))
              ],
            ),
          )
        ],
      ),
    );
  }
}
