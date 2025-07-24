import 'package:flutter/material.dart';

class PaymentMethodsRow extends StatelessWidget {
  const PaymentMethodsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: [
        Image.asset('images/visa.png', height: 40),
        SizedBox(width: 10),
        Image.asset('images/mastercard.webp', height: 40),
        SizedBox(width: 10),
        Image.asset('images/blik.png', height: 40),
        SizedBox(width: 10),
        Image.asset('images/googlepay.png', height: 40),
        SizedBox(width: 10),
        Image.asset('images/applepay.png', height: 40),
      ],
    );
  }
}
