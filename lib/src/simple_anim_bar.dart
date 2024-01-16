import 'package:flutter/material.dart';
import 'controller/sab_controller.dart';
import 'widgets/sab_item.dart';
part 'widgets/sab_indicator.dart';

class SimpleAnimBar extends StatelessWidget {
  const SimpleAnimBar(
      {super.key,
      required this.controller,
      required this.onSelect,
      required this.items});
  final SABController controller;
  final List<IconData> items;

  final void Function(int index) onSelect;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        LayoutBuilder(
          builder: (context, constraints) => Container(
            height: 50,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: items.length,
              itemExtent: constraints.maxWidth / items.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SABItem(
                itemID: index,
                controller: controller,
                onSelect: onSelect,
                items: items,
              ),
            ),
          ),
        ),
        _BarIndicator(
          controller: controller,
          items: items,
        )
      ],
    );
  }
}
