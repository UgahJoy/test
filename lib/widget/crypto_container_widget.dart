import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CryptoContainerWidget extends StatelessWidget {
  const CryptoContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey.withValues(alpha: 0.12),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Crypto",
              // style: subHeader.copyWith(
              //   fontSize: 13,
              //   color: AppColors.scaffoldBgColor,
              //   fontWeight: FontWeight.w600,
              //   height: 1.4,
              //),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Icon(Icons.expand_more_outlined, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class CountrySelectorWidget extends StatelessWidget {
  const CountrySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),

        color: Colors.grey.withValues(alpha: 0.12),
      ),
      child: Row(
        children: [
          Image.asset("assets/flag.png", height: 20),
          Gap(4),
          Image.asset("assets/expand_more.png", height: 16),
        ],
      ),
    );
  }
}

class NotIcon extends StatelessWidget {
  const NotIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Image.asset("assets/not_icon.png", height: 20),
        Positioned(
          right: 0,
          child: Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Center(
              child: Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
