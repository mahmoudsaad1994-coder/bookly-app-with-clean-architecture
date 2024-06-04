import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final num? ratingCount;
  @HiveField(7)
  final String? catagory;
  @HiveField(8)
  final String? previewBookLink;
  @HiveField(9)
  final String? forSaleAbility;
  @HiveField(10)
  final String? infoBookLink;

  BookEntity({
    required this.image,
    required this.title,
    required this.infoBookLink,
    required this.forSaleAbility,
    required this.previewBookLink,
    required this.catagory,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.bookId,
  });
}
