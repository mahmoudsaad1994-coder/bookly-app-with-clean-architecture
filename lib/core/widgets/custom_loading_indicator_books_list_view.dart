import 'package:flutter/material.dart';

import 'custom_fading_widget.dart';
import 'custom_book_image_loading_indicator.dart';

class CustomLoadingIndicatorBooksListView extends StatelessWidget {
  const CustomLoadingIndicatorBooksListView({super.key, required this.widgetHight});
  final num widgetHight;
  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * widgetHight,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
