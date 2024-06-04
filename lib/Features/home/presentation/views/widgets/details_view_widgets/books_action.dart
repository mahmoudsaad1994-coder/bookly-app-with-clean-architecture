import 'package:flutter/material.dart';

import '../../../../../../core/utils/functions/isfree.dart';
import '../../../../../../core/utils/functions/launch_url.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../domain/entities/book_entity.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            text: isFree(book),
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          )),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                launchCustomUrl(context, book.previewBookLink ?? '');
              },
              fontSize: 16,
              text: 'Preview',
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
