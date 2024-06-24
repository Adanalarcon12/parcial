import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IncomePage extends StatefulWidget {
  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final CollectionReference _incomeCollection =
      FirebaseFirestore.instance.collection('agregar');

  Future<void> _addIncome() async {
    final description = _descriptionController.text;
    final amount = double.tryParse(_amountController.text) ?? 0;

    if (description.isNotEmpty && amount > 0) {
      await _incomeCollection.add({
        'descripcion': description,
        'monto': amount,
        'date': Timestamp.now(),
      });

      _descriptionController.clear();
      _amountController.clear();
    }
  }

  Future<void> _deleteIncome(String docId) async {
    await _incomeCollection.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripcion'),
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
            onPressed: _addIncome,
            child: const Text('Confirmar'),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _incomeCollection.orderBy('date', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: const CircularProgressIndicator());
                }

                final incomes = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: incomes.length,
                  itemBuilder: (context, index) {
                    final income = incomes[index];
                    final data = income.data() as Map<String, dynamic>;
                    final date = (data['date'] as Timestamp).toDate();

                    return ListTile(
                      title: Text(data['descripcion']),
                      subtitle: Text(
                          'Monto: \$${data['monto']}, Fecha: ${date.toLocal()}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteIncome(income.id),
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