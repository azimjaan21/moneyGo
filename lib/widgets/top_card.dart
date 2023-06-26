import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:money_go/widgets/currency_buttons.dart';

class TopCardWidget extends StatelessWidget {
  final Function showCalendar;
  final DateTime selectedDate;
  final Function() previousMonth;
  final Function() nextMonth;
  final double totalExpenseByMonth;
  const TopCardWidget(
      this.showCalendar, this.selectedDate, this.previousMonth, this.nextMonth,this.totalExpenseByMonth,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final isLastDay = selectedDate.year == DateTime.now().year &&
        selectedDate.month == DateTime.now().month + 1;
    final isFirstDay =
        selectedDate.year == DateTime(2022) && selectedDate.month == 1;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                showCalendar(context);
              },
              child: Text(
                DateFormat(' MMMM, yyyy ').format(selectedDate),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isFirstDay ? Colors.grey : Colors.black,
                  width: 2,
                ),
              ),
              child: Center(
                child: IconButton(
                  padding: const EdgeInsets.only(left: 5),
                  onPressed: previousMonth,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: isFirstDay ? Colors.grey : Colors.black,
                    size: 23,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                 Text(
                  totalExpenseByMonth.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CurrencyDropDownButton(),
              ],
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isLastDay ? Colors.grey : Colors.black,
                  width: 2,
                ),
              ),
              child: Center(
                child: IconButton(
                  padding: const EdgeInsets.only(left: 5),
                  onPressed: nextMonth,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: isLastDay ? Colors.grey : Colors.black,
                    size: 23,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
