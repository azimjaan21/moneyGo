import 'package:flutter/material.dart';

class CurrencyDropDownButton extends StatefulWidget {
  const CurrencyDropDownButton({super.key});

  @override
  State<CurrencyDropDownButton> createState() => _CurrencyDropDownButtonState();
}

class _CurrencyDropDownButtonState extends State<CurrencyDropDownButton> {
  String dropdownValue = 'USD';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Colors.white,
      alignment: Alignment.bottomRight,
      iconSize: 25,
      borderRadius: BorderRadius.circular(20),
      underline: Container(
        width: 2,
        color: Colors.grey[300],
      ),
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Color(0xff7356f7),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: const [
        DropdownMenuItem(
          value: "UZS",
          child: Text(
            "UZS",
            style: TextStyle(
                color: Color(0xff7356f7),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        DropdownMenuItem(
          value: "USD",
          child: Text(
            "USD",
            style: TextStyle(
                color: Color(0xff7356f7),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        DropdownMenuItem(
          value: "RUB",
          child: Text(
            "RUB",
            style: TextStyle(
                color: Color(0xff7356f7),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
