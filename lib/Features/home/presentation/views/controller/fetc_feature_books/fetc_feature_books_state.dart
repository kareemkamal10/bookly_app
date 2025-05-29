part of 'fetc_feature_books_cubit.dart';

abstract class FetcFeatureBooksState {}

class FetcFeatureBooksInitial extends FetcFeatureBooksState {}

class FetcFeatureBooksLoading extends FetcFeatureBooksState {}

class FetcFeatureBooksFailure extends FetcFeatureBooksState {
  final String errMessage;

  FetcFeatureBooksFailure(this.errMessage);
}

class FetcFeatureBooksSuccess extends FetcFeatureBooksState {
  final List<BookEntity> books;

  FetcFeatureBooksSuccess(this.books);
}


