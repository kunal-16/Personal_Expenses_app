import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  @override
final String label;
final double spendingAmount;
final double spendingPct;
ChartBar(this.label,this.spendingAmount,this.spendingPct);

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child:FittedBox(child:Text('\$${spendingAmount.toStringAsFixed(0)}'),),),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border:Border.all(color: Colors.grey,width: 1.0),
                  color: Color.fromRGBO(220, 220, 200, 1),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPct,
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
                  
                ),
              )
            ],
          ),

        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
      
    );
  }
}