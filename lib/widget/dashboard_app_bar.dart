import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test/widget/crypto_container_widget.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Column(
          children: [
            Gap(40),
            Row(
              children: [
                CryptoContainerWidget(),
                Spacer(),
                Icon(Icons.search, size: 20, color: Colors.white),
                Gap(16),
                Icon(Icons.phone, size: 20, color: Colors.white),
                Gap(16),
                // NotIcon(),
                Gap(16),
                // CountrySelectorWidget(),
              ],
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
