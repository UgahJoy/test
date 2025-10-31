import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State createState() => _LineChartSmaple2();
}

class _LineChartSmaple2 extends State<LineChartSample2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<FlSpot> spots = const [
    FlSpot(0, 3),
    FlSpot(2.6, 2),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(12, 4),
    FlSpot(13, 5),
    FlSpot(15, 9),
    FlSpot(19, 8),
    FlSpot(21, 2),
    FlSpot(25, 5),
    FlSpot(27, 12),
    FlSpot(30, 4),
    FlSpot(33, 9),
    FlSpot(36, 10),
    FlSpot(37, 9),
    FlSpot(40, 8),
    FlSpot(42, 2),
    FlSpot(45, 12),
    FlSpot(51, 9),
    FlSpot(57, 6),
    FlSpot(60, 5),
    FlSpot(66, 7),
    FlSpot(70, 9),
  ];
  // double paddingAmount = 0.3;
  // late List<FlSpot> paddedSpots;
  // paddedSpots = spots.map((e) {
  //   return FlSpot(e.x + paddingAmount, e.y );
  // }).toList();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 12,
          top: 40,
          bottom: 12,
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => LineChart(mainData(_animation.value)),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    if (value == meta.max) {
      return Text(" ");
    } else if (value == meta.min) {
      return Text(" ");
    }
    return SideTitleWidget(
      meta: meta,
      fitInside: SideTitleFitInsideData(
        enabled: true,
        axisPosition: 38,
        parentAxisSize: 0,
        distanceFromEdge: 4,
      ),
      child: Text(value.toStringAsFixed(0), style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
    if (value == meta.max) {
      return Text(" ", style: style, textAlign: TextAlign.left);
    } else if (value == meta.min) {
      return Text(" ", style: style, textAlign: TextAlign.left);
    }

    return Text(
      value.toStringAsFixed(0),
      style: style,
      textAlign: TextAlign.left,
    );
  }

  LineChartData mainData(double animatedValue) {
    final double minY = getMinNum(spots.map((e) => e.y).toList());
    List<FlSpot> animatedSpots = spots.map((e) {
      final double targetY = (e.y + (yInterval! * 0.2)).toDouble();
      final double targetX = e.x.toDouble();
      final double animatedval = minY + (targetY - minY) * animatedValue;
      return FlSpot(targetX, animatedval);
    }).toList();
    List<FlSpot> animatedSpots2 = spots.map((e) {
      final double targetY = (e.y).toDouble();
      final double targetX = (e.x).toDouble();

      final double animatedVlue = minY + (targetY - minY) * animatedValue;
      return FlSpot(targetX, animatedVlue);
    }).toList();
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        drawHorizontalLine: true,
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        checkToShowHorizontalLine: (double value) {
          return value % 2 == 0;
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(color: Colors.grey.shade200, strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: xInterval,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: yInterval,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: const Color(0xff37434d)),
          left: BorderSide(color: const Color(0xff37434d)),
        ),
      ),
      minX: getMinNum(spots.map((e) => e.x).toList()),
      maxX: getMaxNum(spots.map((e) => e.x).toList()),
      minY: minY,
      maxY: getMaxNum(spots.map((e) => e.y).toList()),
      lineBarsData: [
        LineChartBarData(
          color: Colors.green,
          spots: animatedSpots,
          barWidth: 0,
          isCurved: true,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: AlignmentGeometry.center,
              end: AlignmentGeometry.bottomCenter,

              colors: [const Color(0xFF3EF6A9), Colors.black],
            ),
          ),
        ),
        LineChartBarData(
          color: Colors.green,
          spots: animatedSpots2,
          barWidth: 2,
          isCurved: true,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }

  double getMaxNum(List<num> yvalues) {
    if (yvalues.isEmpty) {
      return 0.0;
    }
    double maxYValue = yvalues[0].toDouble();
    for (int n = 0; n < yvalues.length; n++) {
      if (maxYValue < yvalues[n]) {
        maxYValue = yvalues[n].toDouble();
      }
    }
    return maxYValue;
  }

  double getMinNum(List<num> minYVal) {
    if (minYVal.isEmpty) {
      return 0.0;
    }
    double minYValue = minYVal[0].toDouble();
    for (int x = 0; x < minYVal.length; x++) {
      if (minYValue > minYVal[x]) {
        minYValue = minYVal[x].toDouble();
      }
    }
    return minYValue;
  }

  double? get yInterval {
    double maxY = getMaxNum(spots.map((e) => e.y).toList());
    double minY = getMinNum(spots.map((e) => e.y).toList());
    final double range = maxY - minY;

    return (range / 7) + (range * 0.05);
  }

  double? get xInterval {
    double maxX = getMaxNum(spots.map((e) => e.x).toList());
    double minX = getMinNum(spots.map((e) => e.x).toList());
    final double range = maxX - minX;
    return (range / 9) + (range * 0.05);
  }
}
/* 



          
          */