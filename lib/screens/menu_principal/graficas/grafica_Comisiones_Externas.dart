import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraficaComisionesServicioExternas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Hacemos que todo sea desplazable
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Distribución de Comisiones de Servicio Externas",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: PieChart(
                  PieChartData(
                    sections: _crearSecciones(),
                    sectionsSpace: 2,
                    centerSpaceRadius: 40,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Envolvemos la leyenda en un SingleChildScrollView
              SingleChildScrollView(
                // Permite el desplazamiento horizontal
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _leyendaItem(Colors.green, "Activas"),
                    _leyendaItem(Colors.red, "Expiradas"),
                    _leyendaItem(Colors.orange, "Por vencer"),
                    _leyendaItem(Colors.blue, "Por firma"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _crearTablaDatos(),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _crearSecciones() {
    return [
      PieChartSectionData(
        color: Colors.green, // Activas
        value: 50,
        title: '50%',
        radius: 55,
      ),
      PieChartSectionData(
        color: Colors.red, // Expiradas
        value: 20,
        title: '20%',
        radius: 55,
      ),
      PieChartSectionData(
        color: Colors.orange, // Por vencer
        value: 15,
        title: '15%',
        radius: 55,
      ),
      PieChartSectionData(
        color: Colors.blue, // En revisión
        value: 15,
        title: '15%',
        radius: 55,
      ),
    ];
  }

  Widget _leyendaItem(Color color, String texto) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        SizedBox(width: 5),
        Text(texto, style: TextStyle(fontSize: 14)),
        SizedBox(width: 10),
      ],
    );
  }

  Widget _crearTablaDatos() {
    return Table(
      border: TableBorder.all(color: Colors.black12),
      children: [
        _filaTabla("Categoría", "Cantidad"),
        _filaTabla("Activas", "50"),
        _filaTabla("Expiradas", "20"),
        _filaTabla("Por vencer", "15"),
        _filaTabla("Por firma", "15"),
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
}
