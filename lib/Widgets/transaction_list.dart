import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

//import 'package:flutter/src/rendering/box.dart';
class TransactionList extends StatelessWidget {
  @override
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);
  Widget build(BuildContext context) {
    return  Container(
      height: 500,
            child:transactions.isEmpty?Column(children: <Widget>[
              Text('No transaction',
              style: Theme.of(context).textTheme.title,
              
              ),
              SizedBox(
                height:10,
              ),
              Container(
                height: 200,
              child:Image.asset('assets/images/waiting.png',fit: BoxFit.cover,)
              )
            ],)  :
            ListView.builder(
              itemBuilder: (ctx,index){
              //   return Card( //to make multiple cards of diff transactions
              //     child: Row(children: <Widget>[
              //       Container(
                      
              //         padding: EdgeInsets.all(10),
              //         margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),//add margin
              //         decoration: BoxDecoration(border: Border.all(
              //           color: Colors.black,
              //           width: 2
              //                                 )),//add margins
              //         child: Text('\$${transactions[index].price.toStringAsFixed(2)}' ,   //tx.price.toString(), //PRICE
                      
              //         style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Theme.of(context).primaryColor, ),),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(transactions[index].name , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color:Colors.blue),),
              //         Text(DateFormat.yMMMd().format(transactions[index].date),//Date
              //         style: TextStyle(color:Colors.blueGrey,fontSize: 13),)
              //         ],
              //       )
              //     ],)
              // );
                return  Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child:ListTile(leading: CircleAvatar(radius: 30,
                  child:Padding(
                  padding:EdgeInsets.all(6),
                  child:FittedBox(child:Text('\$${transactions[index].price}'))),
                  ),
                  title: Text(transactions[index].name),
                  subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,onPressed: ()=>deleteTx(transactions[index].id),),
                ));


              },
              itemCount: transactions.length,
                 //Convert map to list in every prog       
            )
          ) ;
  }
}