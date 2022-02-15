import 'package:flutter/foundation.dart';
import 'package:lec7/database/transaction_db.dart';
import 'package:lec7/model/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void initData() async {
    var db = TransactionDB(dbName: 'transactions.db');
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: 'transactions.db');
    await db.insertData(statement);

    transactions = await db.loadAllData();
    //transactions.add(statement);
    //transactions.insert(0, statement);
    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
