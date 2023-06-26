import 'package:flutter/material.dart';
import 'package:money_go/widgets/add_expenses.dart';
import 'package:money_go/widgets/body.dart';
import 'dart:io';
import '../models/expense.dart';

import 'package:money_go/widgets/top_card.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final File? image;
  HomeScreen({required this.image, required this.name});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Expenses expensesData = Expenses();
  DateTime selectedDate = DateTime.now();

  void _showCalendar(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  void previousMonth() {
    if (selectedDate.year == DateTime(2022) && selectedDate.month == 1) {
      return;
    }
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month - 1,
        selectedDate.day,
      );
    });
  }

  void nextMonth() {
    setState(() {
      if (selectedDate.year == DateTime.now().year &&
          selectedDate.month == DateTime.now().month + 1) {
        return;
      }
      selectedDate =
          DateTime(selectedDate.year, selectedDate.month + 1, selectedDate.day);
    });
  }

  void showAddExpenseScreen(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddExpensesWidget(addnewExpense),
    );
  }

  void addnewExpense(
      String title, double amount, DateTime date, IconData icon) {
    setState(() {
      expensesData.addNewExpense(title, amount, date, icon);
    });
  }

  void deleteExpense(String id) {
    expensesData.delete(id);
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final deviceHeight = MediaQuery.of(context).size.height - 64 - topPadding;
   
    

    return Scaffold(
      backgroundColor:  Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                TopAppBar(widget: widget),
      
                ///////////////////////////////////// TOP CARD /////////////////////////////////////////
      
                Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffbebebe),
                          offset: Offset(10, 10),
                          blurRadius: 30,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-10, -10),
                          blurRadius: 30,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: TopCardWidget(
                      _showCalendar,
                      selectedDate,
                      previousMonth,
                      nextMonth,
                      expensesData.totalExpenseByMonth(selectedDate),
                    ),
                  ),
                ),
      
                ////////////////////////////////// BUDGET AND EXPANSES LIST ///////////////////////////////////////////////////////////////
      
                Container(
                  height: deviceHeight * 0.7,
                  child: Body(
                    deleteExpense,
                    expensesData.itemsSortByMonth(selectedDate),
                    expensesData.totalExpenseByMonth(selectedDate),
                    widget.name,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff7356f7),
        onPressed: () {
          showAddExpenseScreen(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

///////////////////////////      APPBAR        ///////////////////////////////

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
    required this.widget,
  });

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: FileImage(widget.image!),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'money',
                ),
                TextSpan(
                  text: 'Go',
                  style: TextStyle(
                    color: Color(0xff7356f7),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
