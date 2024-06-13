import '../../../../home/domain/entities/book_entity.dart';

abstract class SearchStates {}

class SearchStatesInitial extends SearchStates {}

class SearchStatesLoading extends SearchStates {}

class SearchStatesSuccsess extends SearchStates {
  final List<BookEntity> books;

  SearchStatesSuccsess({required this.books});
}

class SearchStatesFailed extends SearchStates {
  final String error;

  SearchStatesFailed({required this.error});
}
