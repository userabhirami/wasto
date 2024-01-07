import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:wasto/utils/colorConstant.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  // Data for the pie chart
  Map<String, double> dataMap = {
    "Plastic": 70,
    "E-Waste": 30,
  };
  List<Color> colorList = [
    const Color(0xff3EE094),
    const Color(0xff3398F6),
  ];

  /*final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ]; */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analysis"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Text(
              "Pie-Chart",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: PieChart(
              dataMap: dataMap,
              colorList: colorList,
              chartRadius: MediaQuery.of(context).size.width / 2,
              centerText: "Collecion Report",
              ringStrokeWidth: 24,
              animationDuration: const Duration(seconds: 3),
              chartValuesOptions: const ChartValuesOptions(
                  showChartValues: true,
                  showChartValuesOutside: true,
                  showChartValuesInPercentage: true,
                  showChartValueBackground: false),
              legendOptions: const LegendOptions(
                  showLegends: true,
                  legendShape: BoxShape.rectangle,
                  legendTextStyle: TextStyle(fontSize: 15),
                  legendPosition: LegendPosition.bottom,
                  showLegendsInRow: true),
              //  gradientList: gradientList,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Text(
              "Bar Chart",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center()
        ],
      ),
    );
  }
}
