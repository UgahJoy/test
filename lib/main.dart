import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/my_line_chart.dart';
import 'package:gap/gap.dart';
import 'package:test/widget/dashboard_app_bar.dart';
import 'package:test/widget/stay_updated_widget.dart';
import 'package:test/widget/trade_actions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double scrollOffSet = 0.0;
  final ScrollController _scrollController = ScrollController();
  double opacity = 0;
  bool isExpanded = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      scrollOffSet = _scrollController.offset;
      if (scrollOffSet >= 50.0) {
        opacity = 1;
        setState(() {});
      } else {
        opacity = 0;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.green),
          child: Column(
            children: [
              DashboardAppBar(),

              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Opacity(
                        opacity: opacity,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 500),
                          child: Text("E0"),
                        ),
                      ),
                      Gap(12),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: [
                              Text("Your GBP Balance"),
                              Gap(20),
                              Text("E0"),
                              Gap(20),
                              TradeActions(
                                isExpanded: isExpanded,
                                onTap: (val) {
                                  setState(() {
                                    isExpanded = !val;
                                  });
                                },
                              ),
                              Gap(20),
                              LineChartSample2(),
                              Gap(20),
                              StayUpdatedWidget(),
                              Gap(20),
                              LineChartSample2(),
                              Gap(20),
                              LineChartSample2(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







/* 

*/