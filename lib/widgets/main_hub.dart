import 'package:flutter/material.dart';

class MainHub extends StatelessWidget {
  const MainHub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 140,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('BUTY'),
          SizedBox(width: 30),
          Text('/'),
          SizedBox(width: 30),
          Text('ODZIEŻ'),
          SizedBox(width: 30),
          Text('/'),
          SizedBox(width: 30),
          Text('AKCESORIA'),
          SizedBox(width: 30),
          Text('/'),
          SizedBox(width: 30),
          Text('PROMOCJE'),
          SizedBox(width: 30),
          Text('/'),
          SizedBox(width: 30),
          Text('KARTY PODARUNKOWE'),
        ],
      ),
    );
  }
}
