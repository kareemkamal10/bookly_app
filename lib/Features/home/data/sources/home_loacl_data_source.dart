import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/consts/constants.dart';
import 'package:bookly/core/helper/hive_helper.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    List<BookEntity> data = HiveHelper.getBooksData(kFeaturedBooks);
    return data;
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // Implement logic to fetch newest books from local storage
    List<BookEntity> data = HiveHelper.getBooksData(kNewestBooks);
    return data;
  }
}
