import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  final String title;
  final DateTime date;
  final double amount;
  final Key key;
  final Function deleteExpense;
  final String id;
  final IconData icon;
  const ExpenseItem(
    this.title,
    this.date,
    this.amount,
    this.key,
    this.deleteExpense,
    this.id,
    this.icon,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      onDismissed: (direction) {
        deleteExpense(id);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.only(right: 15),
        alignment: Alignment.centerRight,
        color: const Color.fromARGB(255, 226, 18, 3),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            icon,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          DateFormat('EEEE, MMMM d').format(date).toString(),
        ),
        trailing: Text(
          "\$${amount}",
          style: TextStyle(
              color: Color.fromARGB(255, 205, 32, 20),
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
