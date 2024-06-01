import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/widgets/custom_book_item.dart';
import '../../../../domain/entities/book_entity.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomBookImage(
          image: book.image ?? '',
        ),
      ),
    );
  }
}
