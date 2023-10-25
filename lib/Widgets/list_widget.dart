// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListWidget extends StatelessWidget {
  final String name;
  final bool cValue;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletFuction;

  ListWidget(
      {Key? key,
      required this.name,
      required this.cValue,
      required this.onChanged,
      required this.deletFuction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          // dragDismissible: false,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletFuction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(14),
            ),
          ],
        ),
        child: Container(
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Checkbox(
                value: cValue,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                name,
                style: TextStyle(
                  decoration:
                      cValue ? TextDecoration.lineThrough : TextDecoration.none,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
