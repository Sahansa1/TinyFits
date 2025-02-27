import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tinyfits_app/theme/colors.dart';
import 'package:tinyfits_app/screens/custom_drawer.dart';

class GrowthChartPage extends StatefulWidget {
  final List<Map<String, dynamic>> pastMeasurements;

  const GrowthChartPage({super.key, required this.pastMeasurements});

  @override
  _GrowthChartPageState createState() => _GrowthChartPageState();
}

class _GrowthChartPageState extends State<GrowthChartPage> {
  bool showHeightChart = true; // Toggle between Height and Weight

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo3.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      //**************************************************************************************** */
      endDrawer: CustomDrawer(
        userName: "John Doe", // HARDCODED
        userEmail: "johndoe@email.com", // HARDCODED
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Header Section with "Growth Chart" Title**
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Growth Chart',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// **Toggle Switch for Height/Weight Chart**
            Center(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildToggleButton("Height Chart", true),
                    _buildToggleButton("Weight Chart", false),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// **Graph Container**
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: LineChart(
                  _buildChartData(showHeightChart),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Builds the toggle buttons for switching between charts**
  Widget _buildToggleButton(String text, bool isHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showHeightChart = isHeight;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: showHeightChart == isHeight
              ? AppColors.themeBlue
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: showHeightChart == isHeight ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  /// **Builds Chart Data for Height or Weight**
  LineChartData _buildChartData(bool isHeightChart) {
    List<FlSpot> dataPoints = [];
    List<String> dates = [];

    for (var i = 0; i < widget.pastMeasurements.length; i++) {
      var record = widget.pastMeasurements[i];

      /// **Skip null values (Don't plot them as 0)**
      double? value = isHeightChart ? record['height'] : record['weight'];
      if (value != null) {
        dataPoints.add(FlSpot(i.toDouble(), value.toDouble()));
        dates.add(record['date']);
      }
    }

    return LineChartData(
      gridData: FlGridData(show: true, drawVerticalLine: true),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 5,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 1,
            getTitlesWidget: (value, meta) {
              int index = value.toInt();
              return index >= 0 && index < dates.length
                  ? Text(
                      dates[index],
                      style: const TextStyle(fontSize: 10),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey, width: 1),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: dataPoints,
          isCurved: true,
          color: AppColors.themeBlue,
          barWidth: 3,
          belowBarData: BarAreaData(
              show: true, color: AppColors.themeBlue.withOpacity(0.3)),
          dotData: FlDotData(show: true),
        ),
      ],
    );
  }
}
