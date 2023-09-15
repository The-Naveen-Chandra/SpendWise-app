import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spendwise_app/components/custom_alert_button.dart';
import 'package:spendwise_app/components/custom_textfield.dart';
import 'package:spendwise_app/components/expense_summary.dart';
import 'package:spendwise_app/components/expense_tile.dart';
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

  @override
  void initState() {
    super.initState();

    // prepare data on startup
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  // save expense function
  void saveExpense() {
    // only save if both fields are filled
    if (newExpenseNameController.text.isNotEmpty &&
        newExpenseAmountController.text.isNotEmpty) {
      // Create expense item
      ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now(),
      );

      // add the new expense
      Provider.of<ExpenseData>(context, listen: false)
          .addNewExpense(newExpense);
    }

    // pop the context
    Navigator.pop(context);
    clearController();
  }

  // delete expense function
  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
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
              isNumber: true,
              isPrefixIcon: true,
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.currency_rupee_rounded,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "SpendWise",
                style: GoogleFonts.robotoMono(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
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
        body: ListView(
          children: [
            // weekly summary
            ExpenseSummary(
              startOfWeek: value.startOfWeekDate(),
            ),

            const SizedBox(
              height: 20,
            ),

            // expense list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.getAllExpenseList().length,
              itemBuilder: (context, index) =>
                  // Expense tile
                  ExpenseTile(
                name: value.getAllExpenseList()[index].name,
                amount: value.getAllExpenseList()[index].amount,
                dateTime: value.getAllExpenseList()[index].dateTime,
                deleteTapped: (p0) =>
                    deleteExpense(value.getAllExpenseList()[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
