import 'package:flutter/material.dart';

import 'package:intl/intl.dart';



class NewTransaction extends StatefulWidget {
  @override
  final Function addTx;
  

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final  _titleController= TextEditingController();

  final _amountController= TextEditingController();
  DateTime _selectedDate;
  void _submitData()
  {
    final enteredTitle=_titleController.text;
    final enteredAmount=double.parse(_amountController.text);
    if(enteredTitle.isEmpty || enteredAmount<=0 || _selectedDate==null)
    {
      return;
    }
    widget.addTx(_titleController.text,double.parse(_amountController.text),_selectedDate);
    Navigator.of(context).pop();
  }                                                                                                
  void _presentDatePicker()
  {
    showDatePicker(context:context,initialDate: DateTime.now(),firstDate: DateTime(2019),lastDate: DateTime.now() ).then((pickedDate){
      if(pickedDate==null)
      {
        return;
      }
      setState(() {
        _selectedDate=pickedDate;
      });
      
    });
  }
  Widget build(BuildContext context) {

    return  Card(
            child:Container(
             child:Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(decoration: InputDecoration(labelText: 'Title'),
                controller:_titleController,
                onSubmitted: (_)=>_submitData(),),

                TextField(decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType:TextInputType.number ,onSubmitted:(_)=> _submitData(),),
                Container(
                height: 70,
                child:Row(
                  children: <Widget>[
                    Expanded
                    (child:Text(_selectedDate==null?'No text chosen': 'Date : ${DateFormat.yMd().format(_selectedDate)}',),),
                    FlatButton(textColor: Theme.of(context).primaryColor,
                      child: Text('Choose date',
                      style:TextStyle(fontWeight: FontWeight.bold) ,),
                      onPressed: _presentDatePicker,)

                  ],
                ),),
                
                RaisedButton(child: Text('Add transaction',),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData ,)
              ],
            ),
          ),
      );
  }
}