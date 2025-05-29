import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/consts/constants.dart';
import 'package:bookly/core/helper/hive_helper.dart';
import 'package:bookly/core/helper/log_helper.dart';
import 'package:bookly/core/network/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final data = await apiService.get(
        endPoint: '/volumes?Filtering=free-ebooks&q=computer science');
    List<BookEntity> books = getBooksList(data);
    HiveHelper.saveBooksData(kFeaturedBooks, books);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    final data = apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
    return data.then((value) => getBooksList(value));
  }

  List<BookEntity> getBooksList(Map<String, dynamic>? data) {
    List<BookEntity> books = [];
    if (data == null || data['items'] == null) {
      logError('Error fetching featured books: No data or items found');
    } else {
      for (var bookMap in data['items']) {
        books.add(BookModel.fromJson(bookMap));
      }
    }
    HiveHelper.saveBooksData(kNewestBooks, books);
    return books;
  }
}
