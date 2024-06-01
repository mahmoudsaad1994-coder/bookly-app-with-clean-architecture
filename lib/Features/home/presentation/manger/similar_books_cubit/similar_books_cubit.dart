import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/fetch_similar_books_use_case.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.fetchSimilarBooksUseCase})
      : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchNewestBooks({required String catagory}) async {
    emit(SimilarBooksLoading());
    var result = await fetchSimilarBooksUseCase.call(catagory);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.message));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
