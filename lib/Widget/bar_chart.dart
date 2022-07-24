import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double>? expenses;
  BarChart({this.expenses});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses!.forEach(
      (double price) {
        if (price > mostExpensive) {
          mostExpensive = price;
        }
      },
    );
    return Column(
      children: [
        SizedBox(height: 20),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                lable: 'Su',
                amountSpent: expenses![0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                lable: 'Mo',
                amountSpent: expenses![1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                lable: 'Tu',
                amountSpent: expenses![2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                lable: 'We',
                amountSpent: expenses![3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                lable: 'TH',
                amountSpent: expenses![4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                lable: 'Fr',
                amountSpent: expenses![5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                lable: 'Sa',
                amountSpent: expenses![6],
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final String? lable;
  final double? amountSpent, mostExpensive;
  final double _maxBarHeight = 150;
  const Bar({
    super.key,
    this.lable,
    this.amountSpent,
    this.mostExpensive,
  });
  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent! / mostExpensive! * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent!.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        SizedBox(height: 8),
        Text(
          lable!,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
