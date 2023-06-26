import 'package:flutter/material.dart';
import 'package:money_go/models/expense.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'expense_item.dart';

class ExpensesListWidget extends StatelessWidget {
  final Function deleteExpense;
  final List<Expense> expenses;
  final String name;
  const ExpensesListWidget(this.expenses, this.deleteExpense, this.name,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: EdgeInsets.only(top: 127),
        padding: EdgeInsets.only(
          top: 0,
          left: 10,
          right: 10,
          bottom: 0,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          //color: Color(0xff7356f7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffbebebe),
              offset: Offset(10, 10),
              blurRadius: 30,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color(0xffbebebe),
              offset: Offset(-1, -1),
              blurRadius: 30,
              spreadRadius: 1,
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: constraints.maxHeight - 127,
        //////////////////// Expenses List ////////////////////////
        child: expenses.length > 0
            ? ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (ctx, i) => ExpenseItem(
                      expenses[i].title,
                      expenses[i].date,
                      expenses[i].amount,
                      ValueKey(expenses[i].id),
                      deleteExpense,
                      expenses[i].id,
                      expenses[i].icon,
                    ))
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(textAlign: TextAlign.center,
                  text: TextSpan(

                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                        text: '$name,',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      TextSpan(
                        text: ' you have no any expense \nfor this month!',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: SvgPicture.asset(
                    height: 222,
                    'assets/images/noex.svg'
                    ,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
      );
    });
  }
}
