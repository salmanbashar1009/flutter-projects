import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class ProductDetailsSlider extends StatefulWidget {
  const ProductDetailsSlider({super.key, required this.imageList});
  final List<String> imageList;

  @override
  State<ProductDetailsSlider> createState() => _ProductDetailsSliderState();
}

class _ProductDetailsSliderState extends State<ProductDetailsSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  height: 260,
                  aspectRatio: 16 / 9,
                  autoPlay: false,
                  onPageChanged: (int page, _) {
                    _selectedSlider.value = page;
                  }),
              items: widget.imageList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1
                            )
                          ],
                          image: DecorationImage(
                            image: NetworkImage(i)
                          )
                        ),
                        alignment: Alignment.center,
                        );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
        SizedBox(height: 12),
        ValueListenableBuilder(
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
                    color: value == i ? primeColor : Colors.grey),
              ));
            }
            return Row(
                mainAxisAlignment: MainAxisAlignment.center, children: list);
          },
        ),
      ],
    );
  }
}
