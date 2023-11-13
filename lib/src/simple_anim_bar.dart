import 'package:flutter/material.dart';

class SimpleAnimBar extends StatelessWidget {
  const SimpleAnimBar({
    super.key,
    required this.controller,
    required this.onSelect,
  });
  final NavController controller;
  final void Function(int index) onSelect;
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: controller.items.length,
            itemExtent: phoneWidth / controller.items.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _BarItem(
              itemID: index,
              controller: controller,
              onSelect: onSelect,
            ),
          ),
        ),
        _BarIndicator(
          controller: controller,
        )
      ],
    );
  }
}

class _BarItem extends StatelessWidget {
  const _BarItem({
    required this.itemID,
    required this.controller,
    required this.onSelect,
  });
  final NavController controller;
  final int itemID;
  final void Function(int index) onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(itemID);
      },
      child: AnimatedContainer(
        duration: controller.duration,
        margin: const EdgeInsets.all(10),
        height: 35,
        decoration: BoxDecoration(
          color: controller.currentIndex == itemID
              ? controller.color
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          controller.items[itemID],
          color: controller.currentIndex == itemID
              ? Colors.white
              : controller.color,
        ),
      ),
    );
  }
}

class _BarIndicator extends StatelessWidget {
  const _BarIndicator({required this.controller});
  final NavController controller;

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        AnimatedContainer(
          width: phoneWidth / controller.items.length,
          duration: controller.duration,
          transformAlignment: Alignment.center,
          transform: Matrix4.translationValues(
            controller.currentIndex * phoneWidth / controller.items.length,
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

class NavController {
  int currentIndex;
  final List<IconData> items;
  final Duration duration;
  final Color color;
  NavController({
    required this.currentIndex,
    required this.items,
    required this.duration,
    required this.color,
  });
}
