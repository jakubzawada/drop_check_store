import 'package:flutter/material.dart';

class BrandHub extends StatelessWidget {
  const BrandHub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Marki',
            style: TextStyle(fontSize: 50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/adidasLogo.png'),
                width: 400,
                height: 400,
              ),
              SizedBox(width: 120),
              Image(
                image: AssetImage('images/NikeLogo.png'),
                width: 400,
                height: 400,
              ),
              SizedBox(width: 120),
              Image(
                image: AssetImage('images/JordanLogo.png'),
                width: 300,
                height: 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
