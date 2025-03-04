import 'package:flutter/material.dart';

class BestsellerProducts extends StatelessWidget {
  const BestsellerProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 40.0, bottom: 40),
      child: Row(
        children: [
          Column(
            children: [
              Image(
                image: AssetImage('images/Jordan1BleachedCoral.webp'),
                width: 400,
                height: 400,
              ),
              Text('Jordan 1 Bleached Coral'),
              Text('1249 PLN'),
            ],
          ),
          Column(
            children: [
              Image(
                image: AssetImage('images/Jordan4RedCement.webp'),
                width: 400,
                height: 400,
              ),
              Text('Jordan 4 Red Cement'),
              Text('1849 PLN'),
            ],
          ),
          Column(
            children: [
              Image(
                image: AssetImage('images/NewBalanceSeaSaltWhite.webp'),
                width: 400,
                height: 400,
              ),
              Text('New Balance Sea Salt White'),
              Text('869 PLN'),
            ],
          ),
          Column(
            children: [
              Image(
                image: AssetImage('images/YeezyOnyx350.webp'),
                width: 400,
                height: 400,
              ),
              Text('Yeezy Onyx 350'),
              Text('1189 PLN'),
            ],
          ),
        ],
      ),
    );
  }
}
