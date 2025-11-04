import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TradeActions extends StatelessWidget {
  final Function(bool) onTap;
  final bool isExpanded;
  const TradeActions({
    super.key,
    required this.onTap,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),

              color: Colors.grey[100],
            ),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ActionItems(
                          image: "assets/deposite.png",
                          onTap: () {},
                          text: "Deposit",
                        ),
                      ),
                      Expanded(
                        child: ActionItems(
                          image: "assets/buy.png",
                          onTap: () {},
                          text: "Buy",
                        ),
                      ),
                      Expanded(
                        child: ActionItems(
                          image: "assets/withdraw.png",
                          onTap: () {},
                          text: "Withdraw",
                        ),
                      ),
                      Expanded(
                        child: ActionItems(
                          image: "assets/sell.png",
                          onTap: () {},
                          text: "Sell",
                        ),
                      ),
                    ],
                  ),
                  if (isExpanded)
                    Column(
                      children: [
                        Gap(20),
                        Row(
                          children: [
                            Expanded(
                              child: ActionItems(
                                image: "assets/deposite.png",
                                onTap: () {},
                                text: "Deposit",
                              ),
                            ),
                            Expanded(
                              child: ActionItems(
                                image: "assets/buy.png",
                                onTap: () {},
                                text: "Buy",
                              ),
                            ),
                            Expanded(
                              child: ActionItems(
                                image: "assets/withdraw.png",
                                onTap: () {},
                                text: "Withdraw",
                              ),
                            ),
                            Expanded(
                              child: ActionItems(
                                image: "assets/sell.png",
                                onTap: () {},
                                text: "Sell",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),

              color: Colors.grey[100],
            ),
            child: InkWell(
              onTap: () {
                onTap(isExpanded);
              },
              child: Text(
                !isExpanded ? "See more" : "See less",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Gap(28),
        ],
      ),
    );
  }
}

class ActionItems extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  const ActionItems({
    super.key,
    required this.onTap,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: Colors.black26,
            shape: BoxShape.circle,
          ),
          child: Center(child: Image.asset(image, height: 24)),
        ),
        Gap(8),
        Text(text, maxLines: 1, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
