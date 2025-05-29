import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';

part 'fetch_feature_books_state.dart';

class FetchFeatureBooksCubit extends Cubit<FetchFeatureBooksState> {
  FetchFeatureBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FetchFeatureBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks(List<BookEntity> books) async {
    emit(FetchFeatureBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FetchFeatureBooksFailure(failure.message));
      },
      (books) {
        emit(FetchFeatureBooksSuccess(books));
      },
    );
  }
}
