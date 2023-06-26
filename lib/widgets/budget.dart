import 'package:flutter/material.dart';
import 'package:money_go/widgets/currency_buttons.dart';
import 'package:money_go/widgets/edit_budget_sheet.dart';
import 'package:money_go/widgets/progressbar.dart';

class BudgetWidget extends StatefulWidget {
  final double totalExpenseByMonth;

  BudgetWidget(this.totalExpenseByMonth, {super.key});

  @override
  State<BudgetWidget> createState() => _BudgetWidgetState();
}

class _BudgetWidgetState extends State<BudgetWidget> {
  double limitBudget = 100;

  void showMonthlyLimitBudget(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return EditBudgetWindow(changeBudgetLimit, limitBudget);
      },
    );
  }

  void changeBudgetLimit(double amount) {
    setState(() {
      limitBudget = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    var totalLimitPercentage = 100 * widget.totalExpenseByMonth / limitBudget;
    totalLimitPercentage =
        totalLimitPercentage > 100 ? 100 : totalLimitPercentage;

    var percent = totalLimitPercentage.toStringAsFixed(1);

    return LayoutBuilder(builder: (context, constraints) {

      return Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: constraints.maxHeight,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 17,
            left: 13,
            right: 15,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Monthly budget:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            showMonthlyLimitBudget(context);
                          },
                          icon: Icon(Icons.edit),
                          label: Text(
                            limitBudget.toString(),
                          ),
                        ),
                        CurrencyDropDownButton(),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 68,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
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
                      child: Center(
                        child: Text(
                          '${percent}%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 68, 218, 9),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ProgressBar(totalLimitPercentage),
            ],
          ),
        ),
      );
    });
  }
}
