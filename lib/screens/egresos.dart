import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final CollectionReference _expenseCollection =
      FirebaseFirestore.instance.collection('expenses');

  Future<void> _addExpense() async {
    final description = _descriptionController.text;
    final amount = double.tryParse(_amountController.text) ?? 0;

    if (description.isNotEmpty && amount > 0) {
      await _expenseCollection.add({
        'description': description,
        'amount': amount,
        'date': Timestamp.now(),
      });

      _descriptionController.clear();
      _amountController.clear();
    }
  }

  Future<void> _deleteExpense(String docId) async {
    await _expenseCollection.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Egreso'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Monto'),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: _addExpense,
            child: const Text('Confirmar'),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _expenseCollection.orderBy('date', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: const CircularProgressIndicator());
                }

                final expenses = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    final expense = expenses[index];
                    final data = expense.data() as Map<String, dynamic>;
                    final date = (data['date'] as Timestamp).toDate();

                    return ListTile(
                      title: Text(data['description']),
                      subtitle: Text(
                          'Monto: \$${data['amount']}, Fecha: ${date.toLocal()}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteExpense(expense.id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
