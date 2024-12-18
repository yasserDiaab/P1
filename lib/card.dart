import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      required this.image,
      required this.text1,
      required this.text2});
  final String image;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(image),
        ),
        Row(
          children: [
            Text(
              text1,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text2,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xff50BF9E),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
