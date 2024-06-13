import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';

class FetchSearchBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchSearchBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(String param) async {
    return await homeRepo.fetchSearchBooks(search: param);
  }
}
