import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
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
    return books;
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
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
