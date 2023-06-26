import 'package:flutter/material.dart';

class EditBudgetWindow extends StatefulWidget {
  final Function changeBudgetLimit;
  final double limitBudget;
  const EditBudgetWindow(this.changeBudgetLimit, this.limitBudget, {super.key});

  @override
  State<EditBudgetWindow> createState() => _EditBudgetWindowState();
}

class _EditBudgetWindowState extends State<EditBudgetWindow> {
  late TextEditingController _amountEditController;
  @override
  void initState() {
    _amountEditController = TextEditingController();
    _amountEditController.text = widget.limitBudget.toStringAsFixed(1);

    super.initState();
  }

  @override
  void dispose() {
    _amountEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextField(
              controller: _amountEditController,
              cursorColor: Colors.black,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  fontSize: 18,
                ),
                labelText: 'Monthly Limit Budget',
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff0771BD),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //
                // CANCEL BUTTON
                //
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 159, 158, 158),
                      fontSize: 20,
                    ),
                  ),
                ),

                //  ADD BUTTON
                GestureDetector(
                  onTap: () {
                    if (_amountEditController.text.isEmpty) {
                      return;
                    }
                    final amount = double.parse(_amountEditController.text);
                    if (amount > 0) {
                      widget.changeBudgetLimit(amount);
                    }
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 43, 133, 198),
                          Color.fromARGB(255, 89, 22, 222),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
