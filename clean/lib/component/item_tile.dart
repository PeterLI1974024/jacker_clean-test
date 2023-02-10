import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String name;
  final String price;
  final Function()? onPressed1;
  final Function()? onPressed2;
  const ItemTile(
      {super.key,
      required this.name,
      required this.price,
      required this.onPressed1,
      required this.onPressed2});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 400,
        child: ListTile(
            title: Text(name),
            subtitle: Text(price),
            trailing: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 12,
                children: [
                  IconButton(
                    onPressed: () {
                      onPressed1;
                    },
                    icon: const Icon(Icons.remove_circle,
                        color: Color(0xff36BBD9)),
                  ),
                  IconButton(
                    onPressed: () {
                      onPressed2;
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Color(0xff36BBD9),
                    ),
                  ),
                ])));
  }
}
