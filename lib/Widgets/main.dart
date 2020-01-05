import 'package:expenses/Widgets/new_transaction.dart';
import 'package:expenses/Widgets/transaction_list.dart';
//import 'package:expenses/Widgets/user_transaction.dart';
import '../Widgets/chart.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white)
            ) 
        ),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<Transaction> _userTransaction = [
    //Transaction(id: 't1',name: 'Shoes',price: 69.99,date: DateTime.now()),
    //Transaction(id:'t2',name:'Groceries',price:29.99,date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions{
    return _userTransaction.where(
      (tx){
          return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
      }
    ).toList();
  }

  void _addNewTransaction(String txTitle,double txAmount, DateTime chosenDate)
  {
    final newTx=Transaction(name:txTitle,price: txAmount,date: chosenDate,id:DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }
  
  
  
  
  void startAddNewTransaction(BuildContext ctx)
  {
    showModalBottomSheet(context: ctx,builder:(_){
        return GestureDetector(
         child:NewTransaction(_addNewTransaction),onTap: (){},
         behavior: HitTestBehavior.opaque,);

    } );
  }
  void deleteTransaction(String id)
  {
      setState(() {
        _userTransaction.removeWhere((tx){
          return tx.id==id;
        });
      });
  }
  @override
  String titleInput;
  String amountInput;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App', style: TextStyle(fontFamily: 'Open Sans'),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),onPressed:()=>startAddNewTransaction(context) ,)
        ],
      ),
      body: SingleChildScrollView(
      child :Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(_recentTransactions),
      TransactionList(_userTransaction,deleteTransaction),
          //NewTransaction(_addNewTransaction),
         
        ],
      ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:FloatingActionButton(child: Icon(Icons.add),onPressed: ()=>startAddNewTransaction(context),),
    );
  }
 
}


