import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class ProductDetailsSlider extends StatefulWidget {
  const ProductDetailsSlider({super.key});

  @override
  State<ProductDetailsSlider> createState() => _ProductDetailsSliderState();
}

class _ProductDetailsSliderState extends State<ProductDetailsSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              height: 325,
              aspectRatio: 16 / 9,
              autoPlay: false,
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: SizedBox(
                          height: 180,
                          width: 180,
                          child: Image.asset(
                            "assets/images/shoe.png",
                            fit: BoxFit.cover,
                          )),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 16,
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedSlider,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < 5; i++) {
                list.add(Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: value == i ? primeColor : Colors.white),
                ));
              }
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center, children: list);
            },
          ),
        ),
      ],
    );
  }
}
