import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Updates extends StatelessWidget {
  final int index;
  const Updates({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: double.infinity,

          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey),
            color: Colors.grey[200],
          ),
          child: Row(
            children: [
              UpdateIcons(
                index: index,
                image: index % 2 == 1 ? Icons.abc_outlined : Icons.access_alarm,
              ),
              Gap(12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delisting coins",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(6),
                    Text(
                      "View the list of coins we are delisting",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        index % 2 == 1
            ? Positioned(
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(14),
                        bottomRight: Radius.circular(0),
                        bottomLeft: Radius.circular(8),
                      ),

                      color: Colors.red.withValues(alpha: 0.1),
                    ),
                    child: Text(
                      "Urgent Notice",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class UpdateIcons extends StatelessWidget {
  final IconData? image;
  final int index;
  const UpdateIcons({super.key, required this.image, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(image, size: 18),
            index % 2 == 1
                ? Positioned(
                    right: 1,
                    top: -2,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
