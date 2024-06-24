import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CombinedPage extends StatefulWidget {
  @override
  _CombinedPageState createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage> {
  final CollectionReference _incomeCollection =
      FirebaseFirestore.instance.collection('income');
  final CollectionReference _expenseCollection =
      FirebaseFirestore.instance.collection('expenses');

  List<Map<String, dynamic>> _combinedList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final incomeSnapshot = await _incomeCollection.orderBy('date', descending: true).get();
    final expenseSnapshot = await _expenseCollection.orderBy('date', descending: true).get();

    final incomeList = incomeSnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['type'] = 'Income';
      return data;
    }).toList();

    final expenseList = expenseSnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['type'] = 'Expense';
      return data;
    }).toList();

    setState(() {
      _combinedList = [...incomeList, ...expenseList];
      _combinedList.sort((a, b) => (b['date'] as Timestamp).compareTo(a['date'] as Timestamp));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Combined Income & Expenses'),
      ),
      body: _combinedList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _combinedList.length,
              itemBuilder: (context, index) {
                final item = _combinedList[index];
                final date = (item['date'] as Timestamp).toDate();

                return ListTile(
                  title: Text(item['description']),
                  subtitle: Text(
                    '${item['type']}: \$${item['amount']}, Date: ${date.toLocal()}',
                  ),
                );
              },
            ),
    );
  }
}