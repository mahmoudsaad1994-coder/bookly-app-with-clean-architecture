import 'package:flutter/material.dart';

class BookLoadingListViewItem extends StatelessWidget {
  const BookLoadingListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              color: Colors.grey[50],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .6,
                  height: 4,
                  color: Colors.grey[50],
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  height: 4,
                  color: Colors.grey[50],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 4,
                      color: Colors.grey[50],
                    ),
                    const Spacer(),
                    Container(
                      width: 10,
                      height: 4,
                      color: Colors.grey[50],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
