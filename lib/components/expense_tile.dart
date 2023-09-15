import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({
    super.key,
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.deleteTapped,
  });

  final String name;
  final String amount;
  final DateTime dateTime;
  final void Function(BuildContext)? deleteTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            // delete button
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white60,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: ListTile(
            title: Text(
              name,
              style: GoogleFonts.robotoMono(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              '${dateTime.day} / ${dateTime.month} / ${dateTime.year}',
              style: GoogleFonts.robotoMono(),
            ),
            trailing: Text(
              "₹$amount.00",
              style: GoogleFonts.robotoMono(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
