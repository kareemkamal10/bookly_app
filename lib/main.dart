import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/data/sources/home_loacl_data_source.dart';
import 'package:bookly/Features/home/data/sources/home_remote_data_sourc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Features/home/presentation/views/controller/fetc_feature_books/fetch_feature_books_cubit.dart';
import 'package:bookly/core/consts/constants.dart';
import 'package:bookly/core/network/api_service.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);

  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = true; // For debugging oversized images
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchFeatureBooksCubit(
            FetchFeaturedBooksUseCase(
              HomeRepoImpl(
                homeLocalDataSource: HomeLocalDataSourceImpl(),
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                  ApiService(
                    Dio(),
                  ),
                ),
              ),
              )
            )
          ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
