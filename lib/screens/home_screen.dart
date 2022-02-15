import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lec7/model/transactions.dart';
import 'package:lec7/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormScreen();
                  }));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, child) {
            var count = provider.transactions.length;
            if (count <= 0) {
              return Center(
                child: Text(
                  'ไม่พบข้อมูล',
                  style: TextStyle(fontSize: 35),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: provider.transactions.length,
                  itemBuilder: (context, int index) {
                    Transactions data = provider.transactions[index];
                    return Card(
                      elevation: 5,
                      //margin: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: FittedBox(
                            child: Text(data.amount.toString()),
                          ),
                        ),
                        title: Text(data.title),
                        subtitle: Text(DateFormat("dd/MM/yyyy HH:mm:ss")
                            .format(data.date)),
                      ),
                    );
                  });
            }
          },
        ));
  }
}
