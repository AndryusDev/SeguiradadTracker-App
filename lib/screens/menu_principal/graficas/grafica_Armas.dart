import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraficaArmas extends StatelessWidget {
  final int totalFuncionarios = 500;
  final int funcionariosConArmas = 320;

  @override
  Widget build(BuildContext context) {
    double porcentajeArmas = (funcionariosConArmas / totalFuncionarios) * 100;

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Distribución de Funcionarios con Armas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Indicador de porcentaje de armas
            _indicadorPorcentaje(porcentajeArmas),

            SizedBox(height: 20),

            // Gráfica de barras sin los nombres debajo
            _graficaBarras(),

            SizedBox(height: 20),

            // Nombres y colores de las barras en desplazamiento horizontal
            _nombresBarras(),

            SizedBox(height: 20),

            // Tabla de datos
            _crearTablaDatos(),

            SizedBox(height: 20),

            // Comisiones revocadas por vencimiento
            _comisionesRevocadas(),
          ],
        ),
      ),
    );
  }

  Widget _indicadorPorcentaje(double porcentaje) {
    return Column(
      children: [
        Text(
          "Funcionarios con armas: ${porcentaje.toStringAsFixed(1)}%",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        LinearProgressIndicator(
          value: porcentaje / 100,
          minHeight: 10,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ],
    );
  }

  Widget _graficaBarras() {
    return SizedBox(
      height:
          250, // Aumentamos la altura para que haya más espacio para los títulos
      child: BarChart(
        BarChartData(
          barGroups: [
            _crearBarra(0, 120, Colors.green, "Apoyo Interno"),
            _crearBarra(1, 80, Colors.green.shade700, "Apoyo Externo"),
            _crearBarra(2, 70, Colors.blue, "Comisión Interna"),
            _crearBarra(3, 50, Colors.blue.shade700, "Comisión Externa"),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 40),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ), // Desactivamos los títulos de abajo
            ),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: true),
        ),
      ),
    );
  }

  BarChartGroupData _crearBarra(int x, double y, Color color, String titulo) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 20,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }

  Widget _crearTablaDatos() {
    return Table(
      border: TableBorder.all(color: Colors.black12),
      children: [
        _filaTabla("Categoría", "Cantidad"),
        _filaTabla("Total Funcionarios", "$totalFuncionarios"),
        _filaTabla("Funcionarios con Armas", "$funcionariosConArmas"),
        _filaTabla(
          "Porcentaje con Armas",
          "${(funcionariosConArmas / totalFuncionarios * 100).toStringAsFixed(1)}%",
        ),
      ],
    );
  }

  TableRow _filaTabla(String columna1, String columna2) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(columna1, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(padding: EdgeInsets.all(8.0), child: Text(columna2)),
      ],
    );
  }

  // Widget para los nombres debajo de las barras con color y desplazamiento horizontal
  Widget _nombresBarras() {
    List<String> nombres = [
      "Apoyo Interno",
      "Apoyo Externo",
      "Comisión Interna",
      "Comisión Externa",
    ];

    List<Color> colores = [
      Colors.green,
      Colors.green.shade700,
      Colors.blue,
      Colors.blue.shade700,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(nombres.length, (index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: colores[index],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              nombres[index],
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }),
      ),
    );
  }

  // Widget para mostrar comisiones revocadas por vencimiento
  Widget _comisionesRevocadas() {
    List<String> comisiones = [
      "Comisión Externa 1 - Revocada por vencimiento",
      "Comisión Interna 2 - Revocada por vencimiento",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Comisiones Revocadas por Vencimiento",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Column(
          children:
              comisiones.map((comision) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    comision,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
