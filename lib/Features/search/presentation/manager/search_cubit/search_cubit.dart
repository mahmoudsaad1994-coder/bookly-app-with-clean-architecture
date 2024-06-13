import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/domain/use_cases/fech_search_books_use_case.dart';
import 'search.states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.fetchSearchBooksUseCase) : super(SearchStatesInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  final FetchSearchBooksUseCase fetchSearchBooksUseCase;

  Future<void> fetchSearchBooks({required String search}) async {
    emit(SearchStatesLoading());
    var result = await fetchSearchBooksUseCase.call(search);
    result.fold((failure) {
      emit(SearchStatesFailed(error: failure.message));
    }, (books) {
      emit(SearchStatesSuccsess(books: books));
    });
  }
}
