import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

import '../../../constants.dart';

String isFree(BookEntity book) {
  return book.forSaleAbility == kForSale ? '${book.price} EGP' : 'Free';
}
