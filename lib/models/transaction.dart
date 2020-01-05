import 'package:flutter/foundation.dart';//Note this
class Transaction
{
  String id;
  String name;
  double price;
  DateTime date;

  Transaction({//put in curly braces as it belongs to list
    @required this.id,//Since all these fie;ds are required
    @required this.name,
    @required this.price,
    @required this.date});
}