import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spendwise_app/components/custom_alert_button.dart';
import 'package:spendwise_app/components/custom_textfield.dart';
import 'package:spendwise_app/data/expense_data.dart';
import 'package:spendwise_app/models/expense_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text field controllers
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  // save expense function
  void saveExpense() {
    // Create expense item
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: newExpenseAmountController.text,
      dateTime: DateTime.now(),
    );

    // add the new expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    // pop the context
    Navigator.pop(context);
    clearController();
  }

  // cancel expense function
  void cancelExpense() {
    Navigator.pop(context);
    clearController();
  }

  // clear controllers
  void clearController() {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  // add new expense
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Add new expense",
          style: GoogleFonts.robotoMono(
            fontWeight: FontWeight.w500,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // expense name
            CustomTextField(
              controller: newExpenseNameController,
              hintText: "Expense title",
            ),

            const SizedBox(
              height: 20,
            ),

            // expense amount
            CustomTextField(
              controller: newExpenseAmountController,
              hintText: "Expense amount",
            ),
          ],
        ),
        actions: [
          // save button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Save button
              CustomAlertButton(
                onPressed: saveExpense,
                title: "Save",
              ),

              // cancel button
              CustomAlertButton(
                onPressed: cancelExpense,
                title: "Cancel",
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(5.0, 5.0),
              ),
            ],
          ),
          child: FloatingActionButton(
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            backgroundColor: Colors.white,
            onPressed: addNewExpense,
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: value.getAllExpenseList().length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              value.getAllExpenseList()[index].name,
            ),
            subtitle: Text(
              value.getAllExpenseList()[index].dateTime.toString(),
            ),
            trailing: Text(
              "₹${value.getAllExpenseList()[index].amount}",
            ),
          ),
        ),
      ),
    );
  }
}
