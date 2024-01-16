part of '../simple_anim_bar.dart';

class _BarIndicator extends StatelessWidget {
  const _BarIndicator({
    required this.controller,
    required this.items,
  });
  final SABController controller;
  final List<IconData> items;

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        AnimatedContainer(
          width: phoneWidth / items.length,
          duration: controller.duration,
          transformAlignment: Alignment.center,
          transform: Matrix4.translationValues(
            controller.currentIndex * phoneWidth / items.length,
            0,
            0,
          ),
          child: Center(
            child: Align(
              child: Container(
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                  color: controller.color,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
