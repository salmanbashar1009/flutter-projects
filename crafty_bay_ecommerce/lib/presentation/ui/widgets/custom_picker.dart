import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class CustomPicker extends StatefulWidget {
   final List<String> pickerName;
   final Function(int selectIndex) onSelected;
   final int initialSelected;

  const CustomPicker(this.pickerName, this.onSelected, this.initialSelected,
      {super.key});



  @override
  State<CustomPicker> createState() => _CustomPickerState();
}

class _CustomPickerState extends State<CustomPicker> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () {
              _selectedIndex = index;
              widget.onSelected(index);
              if (mounted) {
                setState(() {});
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: _selectedIndex == index ? primeColor : null),
              child: Text(widget.pickerName[index]),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8,
          );
        },
        itemCount: widget.pickerName.length);
  }
}
