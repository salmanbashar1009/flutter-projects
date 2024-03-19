import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_manager_app/ui/utils/assets_utils.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(
            AssetsUtils.bgSVG,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(child: child)
      ],
    );
  }
}
