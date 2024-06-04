import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/functions/show_toast.dart';
import '../../../../domain/entities/book_entity.dart';
import '../../../manger/newset_books_cubit/newest_books_cubit.dart';
import 'newest_books_list_view.dart';
import 'newest_books_loading_indicator.dart';

class NewestBooksListViewBlocBuilder extends StatefulWidget {
  const NewestBooksListViewBlocBuilder({super.key});

  @override
  State<NewestBooksListViewBlocBuilder> createState() =>
      _NewestBooksListViewBlocBuilderState();
}

class _NewestBooksListViewBlocBuilderState
    extends State<NewestBooksListViewBlocBuilder> {
  final List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewestBooksFailure) {
          showToast(text: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksLoading || state is NewestBooksFailure) {
          return const NewestBooksListViewLoadingIndicator();
        } else {
          return NewestBooksListView(
            books: books,
          );
        }
      },
    );
  }
}
