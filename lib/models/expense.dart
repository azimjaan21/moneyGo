import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;

  Expense({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    this.icon = Icons.attach_money,
  });
}

class Expenses {
  List<Expense> _items = [
    // Expense(
    //   id: 'e1',
    //   title: 'Shopping',
    //   date: DateTime.now(),
    //   amount: 70,
    // ),
    // Expense(
    //   id: 'e2',
    //   title: 'Back home',
    //   date: DateTime.now(),
    //   amount: 10,
    // ),
    // Expense(
    //   id: 'e3',
    //   title: 'Driver License',
    //   date: DateTime.now(),
    //   amount: 28,
    // ),
    // Expense(
    //   id: 'e4',
    //   title: 'Clothes',
    //   date: DateTime.now(),
    //   amount: 55,
    // ),
    // Expense(
    //   id: 'e5',
    //   title: 'Apartment bill',
    //   date: DateTime.now(),
    //   amount: 75,
    // ),
  ];

  List<Expense> get items {
    return _items;
  }

  List<Expense> itemsSortByMonth(DateTime date) {
    return _items
        .where((expense) =>
            expense.date.month == date.month && expense.date.year == date.year)
        .toList();
  }

  double totalExpenseByMonth(DateTime date) {
    final expensesByMonth = itemsSortByMonth(date);
    return expensesByMonth.fold(0, (previousValue, expense) {
      return previousValue + expense.amount;
    });
  }

  void addNewExpense(String title, double amount, DateTime date, IconData icon) {
    _items.add(
      Expense(
        id: '${_items.length + 1}',
        title: title,
        date: date,
        amount: amount,
        icon: icon,
      ),
    );
  }

  void delete(String id) {
    items.removeWhere((element) => element.id == id);
  }
}
