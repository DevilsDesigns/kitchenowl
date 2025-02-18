import 'package:flutter/material.dart';
import 'package:kitchenowl/models/item.dart';
import 'package:kitchenowl/widgets/selectable_button_card.dart';

class ShoppingItemWidget<T extends Item> extends StatelessWidget {
  final T item;
  final void Function(T)? onPressed;
  final void Function(T)? onLongPressed;
  final bool selected;
  final bool gridStyle;

  const ShoppingItemWidget({
    Key? key,
    required this.item,
    this.onPressed,
    this.onLongPressed,
    this.selected = false,
    this.gridStyle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return gridStyle
        ? SelectableButtonCard(
            title: item.name,
            selected: selected,
            description: (item is ItemWithDescription)
                ? (item as ItemWithDescription).description
                : null,
            onPressed: onPressed != null ? () => onPressed!(item) : null,
            onLongPressed:
                onLongPressed != null ? () => onLongPressed!(item) : null,
          )
        : Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              title:
                  Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
              selected: !selected,
              subtitle: (item is ItemWithDescription &&
                      (item as ItemWithDescription).description.isNotEmpty)
                  ? Text(
                      (item as ItemWithDescription).description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  : null,
              onTap: onPressed != null ? () => onPressed!(item) : null,
              onLongPress:
                  onLongPressed != null ? () => onLongPressed!(item) : null,
            ),
          );
  }
}
