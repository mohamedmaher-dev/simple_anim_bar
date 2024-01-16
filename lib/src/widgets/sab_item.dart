import 'package:flutter/material.dart';

import '../controller/sab_controller.dart';

class SABItem extends StatelessWidget {
  const SABItem({
    super.key,
    required this.itemID,
    required this.controller,
    required this.onSelect,
    required this.items,
  });
  final SABController controller;
  final List<IconData> items;

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
          items[itemID],
          color: controller.currentIndex == itemID
              ? Colors.white
              : controller.color,
        ),
      ),
    );
  }
}
