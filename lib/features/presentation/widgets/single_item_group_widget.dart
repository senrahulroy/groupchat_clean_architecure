import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SingleItemGroupWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const SingleItemGroupWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50)),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                const Gap(10),
                Container(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Group Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Gap(6),
                      Text('Recent Message'),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 60, right: 10),
              child: Divider(
                thickness: 1.50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
