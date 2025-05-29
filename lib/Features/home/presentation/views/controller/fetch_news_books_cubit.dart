import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';

part 'fetch_news_books_state.dart';

class FetchNewsBooksCubit extends Cubit<FetchNewsBooksState> {
  FetchNewsBooksCubit(this.fetchNewsBooksUseCase)
      : super(FetchNewsBooksInitial());

  final FetchNewestdBooksUseCase fetchNewsBooksUseCase;

  Future<void> fetchNewsBooks() async {
    emit(FetchNewsBooksLoading());
    var result = await fetchNewsBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FetchNewsBooksFailure(failure.message));
      },
      (books) {
        emit(FetchNewsBooksSuccess(books));
      },
    );
  }
}
