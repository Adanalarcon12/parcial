import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class EgresosChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfico de Egresos'),
      ),
      body: EgresosChart(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'home'); // Navegar a home.dart
        },
        child: Icon(Icons.home),
      ),
    );
  }
}

class EgresosChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('expenses').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No hay egresos registrados.'));
        }

        final expensesDocs = snapshot.data!.docs;

        // Procesar los datos
        Map<String, double> egresosMap = {};
        for (var doc in expensesDocs) {
          final fecha = (doc['date'] as Timestamp).toDate();
          final formattedDate = DateFormat('dd/MM/yyyy').format(fecha);
          final monto = doc['amount'] as double;

          if (egresosMap.containsKey(formattedDate)) {
            egresosMap[formattedDate] = egresosMap[formattedDate]! + monto;
          } else {
            egresosMap[formattedDate] = monto;
          }
        }

        // Convertir los datos a un formato adecuado para el gráfico
        final sortedKeys = egresosMap.keys.toList()
          ..sort((a, b) => DateFormat('dd/MM/yyyy').parse(a).compareTo(DateFormat('dd/MM/yyyy').parse(b)));
        List<FlSpot> dataSpots = [];
        for (var key in sortedKeys) {
          dataSpots.add(FlSpot(DateFormat('dd/MM/yyyy').parse(key).millisecondsSinceEpoch.toDouble(), egresosMap[key]!));
        }

        // Calcular el intervalo dinámicamente
        double interval = (dataSpots.last.x - dataSpots.first.x) / 6;
        if (interval <= 0) {
          interval = 1; // Establecer un valor por defecto si la diferencia es cero o negativa
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    interval: interval,
                    getTitlesWidget: (value, meta) {
                      DateTime date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 10,
                        child: Text(DateFormat('dd/MM').format(date)),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    // Configuraciones adicionales según sea necesario
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        child: Text(value.toString()),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: dataSpots,
                  isCurved: true,
                  barWidth: 3,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.3),
                        Colors.blue.withOpacity(0.1),
                      ],
                      stops: [0.3, 1.0],
                    ),
                  ),
                  dotData: FlDotData(show: false),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
