import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal){
    print("Constructor ChartBar");
  }

  @override
  Widget build(BuildContext context) {
    print("Build() Chart");
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                    child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),

            // toStringAsFixed() used for roundoff
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ), // space before bar
            Container(
                height: constraints.maxHeight * 0.6,
                width: 10,
                child: Stack(children: <Widget>[
                  // bar, stack helps in overlap in 3 dimension( elevation, bringtofront)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromARGB(128, 112, 128, 144),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ])),

            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            // space before bar
            Container(height: constraints.maxHeight * 0.15, child : FittedBox(child: Text(label)))
          ],
        );
      },
    );
  }
}
