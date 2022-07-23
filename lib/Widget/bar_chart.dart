import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double>? expenses;
  BarChart({this.expenses});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Weekly Spending',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            Text(
              'Nov 10, 2019  -  Nov 16 , 2019',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Bar(lable: 'su', amountSpent: expenses![0], mostExpensive: 200),
          ],
        ),
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final String? lable;
  final double? amountSpent, mostExpensive;

  const Bar({super.key, this.lable, this.amountSpent, this.mostExpensive});
  @override
  Widget build(BuildContext context) {
    var barHeight;
    return Text('');
  }
}
