import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/functions/show_toast.dart';
import '../../../../../../core/widgets/custom_book_item.dart';
import '../../../../../../core/widgets/custom_loading_indicator_books_list_view.dart';
import '../../../manger/similar_books_cubit/similar_books_cubit.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CustomBookImage(
                        image: state.books[index].image ?? '',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return showToast(text: state.errMessage);
        } else {
          return const CustomLoadingIndicatorBooksListView(widgetHight: .15);
        }
      },
    );
  }
}
