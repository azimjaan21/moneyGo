import 'package:flutter/material.dart';
import 'package:money_go/models/expense.dart';

import 'budget.dart';
import 'expenses_list.dart';

class Body extends StatelessWidget {
  final Function deleteExpense;
  final List<Expense> expenses;
  final double totalExpenseByMonth;
  final String name;
  const Body(this.deleteExpense, this.expenses, this.totalExpenseByMonth,this.name,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Stack(
        children: [
          BudgetWidget(totalExpenseByMonth),
          ExpensesListWidget(expenses, deleteExpense, name),
        ],
      ),
    );
  }
}
