
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:intl/intl.dart';

class AddExpensesWidget extends StatefulWidget {
  final Function addnewExpense;
  const AddExpensesWidget(this.addnewExpense, {super.key});

  @override
  State<AddExpensesWidget> createState() => _AddExpensesWidgetState();
}

class _AddExpensesWidgetState extends State<AddExpensesWidget> {
  final _textController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? selectedDate;
  IconData? selectedIcon;

  void showAddCalendar(BuildContext context) {
   
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value != null) {
          setState(() {
            selectedDate = value;
          });
        }
      },
    );
  }

  void chooseIconPicker(BuildContext context) {
    FlutterIconPicker.showIconPicker(
      context,
      iconPackModes: [IconPack.cupertino],
    ).then((icon) {
      if (icon == null) {
        return;
      }
     setState(() {
        selectedIcon = icon;
     });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: selectedIcon == null? Text(
                      'Choose Icon',
                    ) : null,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(40),
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
                    child: GestureDetector(
                      onTap: () {
                        //chooseicon
                        chooseIconPicker(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        backgroundImage: null,
                        radius: 30,
                        child:  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: selectedIcon == null? Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.black,
                            size: 30,
                          ): Icon(
                            selectedIcon,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: 
              TextField(
                controller: _textController,
                cursorColor: Colors.black,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                  labelText: 'Expense Name',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff0771BD),
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                controller: _amountController,
                cursorColor: Colors.black,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                  labelText: 'Expense Amount',
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
            TextButton.icon(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                ),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(
                    color: Colors.white,
                  ),
                ),
                iconColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 255, 255, 255),
                ),
                alignment: Alignment.center,
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 89, 22, 222),
                ),
              ),
              onPressed: () {
                showAddCalendar(context);
              },
              label: const Text(
                'Select Date',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              icon: const Icon(
                Icons.calendar_month,
                size: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                    color: Color.fromARGB(255, 104, 7, 189),
                  ),
                ),
                child: Center(
                    // ignore: unnecessary_null_comparison
                    child: selectedDate == null
                        ? Text(
                            'No date selected...',
                            style: TextStyle(
                                color: Color.fromARGB(255, 129, 127, 127),
                                fontSize: 16),
                          )
                        : Text(
                            DateFormat("EEEE, d MMMM").format(selectedDate!),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 2, 2, 2),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )),
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
                      if (_textController.text.isEmpty ||
                          _amountController.text.isEmpty ||
                          selectedDate == null || selectedIcon == null) {
                        return;
                      }
                      var title = _textController.text;
                      var amount = double.parse(_amountController.text);

                      // addNewExpense Function()
                      widget.addnewExpense(title, amount, selectedDate, selectedIcon);
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
                        'Add',
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
      ),
    );
  }
}
