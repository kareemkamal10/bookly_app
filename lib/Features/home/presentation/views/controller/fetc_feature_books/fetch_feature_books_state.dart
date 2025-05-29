part of 'fetch_feature_books_cubit.dart';
abstract class FetchFeatureBooksState {}

class FetchFeatureBooksInitial extends FetchFeatureBooksState {}

class FetchFeatureBooksLoading extends FetchFeatureBooksState {}

class FetchFeatureBooksFailure extends FetchFeatureBooksState {
  final String errMessage;

  FetchFeatureBooksFailure(this.errMessage);
}

class FetchFeatureBooksSuccess extends FetchFeatureBooksState {
  final List<BookEntity> books;

  FetchFeatureBooksSuccess(this.books);
}
