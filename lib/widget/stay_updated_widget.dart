import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test/widget/updates.dart';

class StayUpdatedWidget extends StatefulWidget {
  const StayUpdatedWidget({super.key});

  @override
  State<StayUpdatedWidget> createState() => _StayUpdatedWidgetState();
}

class _StayUpdatedWidgetState extends State<StayUpdatedWidget> {
  int index = 0;
  int currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(28),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Stay Updated",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Gap(12),
        CarouselSlider.builder(
          itemBuilder: (context, index, realIndex) => Updates(index: index),
          carouselController: _carouselController,
          itemCount: 6,
          options: CarouselOptions(
            autoPlayAnimationDuration: Duration(seconds: 2),
            viewportFraction: 0.9,
            autoPlay: true,
            height: 90,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            6,
            (index) => InkWell(
              onTap: () {
                setState(() {
                  _carouselController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                });
              },
              child: Container(
                margin: EdgeInsets.all(4),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentIndex ? Colors.grey[100] : Colors.grey,
                ),
              ),
            ),
          ),
        ),
        Gap(20),
      ],
    );
  }
}
