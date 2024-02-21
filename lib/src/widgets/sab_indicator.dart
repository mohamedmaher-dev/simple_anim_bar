part of '../simple_anim_bar.dart';

class _BarIndicator extends StatelessWidget {
  const _BarIndicator({
    required this.controller,
    required this.items,
    required this.width,
  });
  final SABController controller;
  final List<IconData> items;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          width: width / items.length,
          duration: controller.duration,
          transformAlignment: Alignment.center,
          transform: Matrix4.translationValues(
            controller.currentIndex * width / items.length,
            0,
            0,
          ),
          child: Center(
            child: Align(
              child: Container(
                width: width,
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
