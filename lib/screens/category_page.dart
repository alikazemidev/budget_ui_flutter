import 'package:budget_ui/Widget/radial_painter.dart';
import 'package:budget_ui/helpers/color_helper.dart';
import 'package:budget_ui/models/category_model.dart';
import 'package:budget_ui/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryScreen extends StatefulWidget {
  final Category? category;

  const CategoryScreen({super.key, this.category});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category!.expenses!.forEach(
      (Expense expense) {
        totalAmountSpent += expense.cost!;
      },
    );
    final double amountLeft = widget.category!.maxAmount! - totalAmountSpent;
    final double precent = amountLeft / widget.category!.maxAmount!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.category!.name.toString(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  bgColor: Colors.grey.shade200,
                  lineColor: getColor(context, precent),
                  percent: precent,
                  width: 15,
                ),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)}/\$${widget.category!.maxAmount!.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            _buildExpenses()
          ],
        ),
      ),
    );
  }

  _buildExpenses() {
    List<Widget> expensesList = [];
    widget.category!.expenses!.forEach(
      (Expense expense) {
        expensesList.add(
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    expense.name!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '-\$${expense.cost!.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return Column(
      children: expensesList,
    );
  }
}
