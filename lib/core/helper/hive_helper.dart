import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static void saveBooksData(String keyName, List<BookEntity> books) {
    var box = Hive.box(keyName);
    box.addAll(books);
  }

  static List<BookEntity> getBooksData(String keyName) {
    var box = Hive.box(keyName);
    var data = box.values.toList().cast<BookEntity>();
    return data;
  }
}
