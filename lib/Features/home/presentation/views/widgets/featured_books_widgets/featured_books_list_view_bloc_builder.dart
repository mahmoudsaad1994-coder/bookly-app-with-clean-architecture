import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/core/utils/functions/build_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/functions/show_toast.dart';
import '../../../../../../core/widgets/custom_loading_indicator_books_list_view.dart';
import 'featured_list_view.dart';

class FeatuedBooksListViewBlocBuilder extends StatefulWidget {
  const FeatuedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeatuedBooksListViewBlocBuilder> createState() =>
      _FeatuedBooksListViewBlocBuilderState();
}

class _FeatuedBooksListViewBlocBuilderState
    extends State<FeatuedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errMessage),
          );
        }
        if (state is FeaturedBooksFailure) {
          showToast(text: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else {
          return const CustomLoadingIndicatorBooksListView(widgetHight: .3,);
        }
      },
    );
  }
}
