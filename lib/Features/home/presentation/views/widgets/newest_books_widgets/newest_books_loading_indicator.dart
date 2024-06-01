import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_fading_widget.dart';
import 'newest_books_image_loading_indicator.dart';

class NewestBooksListViewLoadingIndicator extends StatelessWidget {
  const NewestBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.builder(
        itemCount: 15,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: BookLoadingListViewItem(),
          );
        },
      ),
    );
  }
}
