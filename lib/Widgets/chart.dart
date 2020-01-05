import 'package:expenses/Widgets/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Chart extends StatelessWidget {
  @override
  final List<Transaction> recentTransactions;

Chart(this.recentTransactions);

  List<Map<String,Object>> get groupedTransactionValues{//to build 7 bars of weekdays
    return List.generate(7, (index){
      double totalSum=0.0;
      final weekDay = DateTime.now().subtract(Duration(days: index));//wen index is 0, it points to today, wen 1 points to yesterday and so on
      for(var i=0;i<recentTransactions.length;i++)
      {
        if(recentTransactions[i].date.day==weekDay.day && recentTransactions[i].date.month==weekDay.month && recentTransactions[i].date.year==weekDay.year) 
        {
          totalSum+=recentTransactions[i].price;
        }
      }
      return {'day':DateFormat.E().format(weekDay).substring(0),'amount':totalSum};
    }).reversed.toList();//generator function countains an anonymous function which performs tasks on th data
  }
  double get totalSpending{
    return groupedTransactionValues.fold(0.0 ,(sum,item){
      return sum+item['amount'];
    });
  }
  Widget build(BuildContext context) {
    return Card(elevation: 6,margin: EdgeInsets.all(20),
    child:Container(
      padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: 
        groupedTransactionValues.map((data){

          return Flexible(
            fit: FlexFit.tight, 
          child:ChartBar(data['day'], data['amount'],
          totalSpending == 0.0 ?0.0 : (data['amount'] as double)/totalSpending));

        }).toList()
    
    ),
    )  
    );
  }
}