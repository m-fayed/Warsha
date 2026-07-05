import 'package:flutter/material.dart';

class AddCarManualDivider extends StatelessWidget {
  const AddCarManualDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade200, thickness: 1)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'or fill manually',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade200, thickness: 1)),
      ],
    );
  }
}
