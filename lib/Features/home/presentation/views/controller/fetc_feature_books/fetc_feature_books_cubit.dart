import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';

part 'fetc_feature_books_state.dart';

class FetcFeatureBooksCubit extends Cubit<FetcFeatureBooksState> {
  FetcFeatureBooksCubit() : super(FetcFeatureBooksInitial());

  
}
