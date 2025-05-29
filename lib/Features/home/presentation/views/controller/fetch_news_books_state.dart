part of 'fetch_news_books_cubit.dart';

abstract class FetchNewsBooksState {}

class FetchNewsBooksInitial extends FetchNewsBooksState {}

class FetchNewsBooksLoading extends FetchNewsBooksState {}

class FetchNewsBooksFailure extends FetchNewsBooksState {
  final String errMessage;

  FetchNewsBooksFailure(this.errMessage);
}

class FetchNewsBooksSuccess extends FetchNewsBooksState {
  final List<BookEntity> books;

  FetchNewsBooksSuccess(this.books);
}


