import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search.states.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import '../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/data/repos/home_repo_impl.dart';
import '../../../../home/domain/entities/book_entity.dart';
import '../../../../home/domain/use_cases/fech_search_books_use_case.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {
        if (state is SearchStatesFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(buildErrorWidget(state.error));
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchTextField(),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Search Result',
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: state is SearchStatesSuccsess
                    ? SearchResultListView(books: state.books)
                    : state is SearchStatesLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const Center()),
          ],
        ),
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(),
        );
      },
    );
  }
}
