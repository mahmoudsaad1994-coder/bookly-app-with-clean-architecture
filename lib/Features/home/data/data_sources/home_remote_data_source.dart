import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/save_books.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
  Future<List<BookEntity>> fetchSearchBooks({required String search});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&Sorting=relevance ');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSearchBooks({required String search}) async {
    var data = await apiService.get(endPoint: 'volumes?q=$search');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
