import 'package:flutter/material.dart';

class SimpleAnimBar extends StatelessWidget {
  const SimpleAnimBar(
      {super.key,
      required this.controller,
      required this.onSelect,
      required this.items});
  final NavController controller;
  final List<IconData> items;

  final void Function(int index) onSelect;
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: items.length,
              itemExtent: phoneWidth / items.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _BarItem(
                itemID: index,
                controller: controller,
                onSelect: onSelect,
                items: items,
              ),
            ),
          ),
          _BarIndicator(
            controller: controller,
            items: items,
          )
        ],
      ),
    );
  }
}

class _BarItem extends StatelessWidget {
  const _BarItem({
    required this.itemID,
    required this.controller,
    required this.onSelect,
    required this.items,
  });
  final NavController controller;
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

class _BarIndicator extends StatelessWidget {
  const _BarIndicator({
    required this.controller,
    required this.items,
  });
  final NavController controller;
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

class NavController {
  int currentIndex;
  final Duration duration;
  final Color color;
  NavController({
    required this.currentIndex,
    required this.duration,
    required this.color,
  });
}
