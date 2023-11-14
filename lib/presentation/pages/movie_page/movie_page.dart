import 'package:flix_movie/presentation/misc/methods.dart';
import 'package:flix_movie/presentation/pages/movie_page/methods/movie_list.dart';
import 'package:flix_movie/presentation/pages/movie_page/methods/promotion_list.dart';
import 'package:flix_movie/presentation/pages/movie_page/methods/search_bar.dart';
import 'package:flix_movie/presentation/pages/movie_page/methods/user_info.dart';
import 'package:flix_movie/presentation/providers/movie/now_playing_provider.dart';
import 'package:flix_movie/presentation/providers/movie/upcoming_provider.dart';
import 'package:flix_movie/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviePage extends ConsumerWidget {
  final List<String> promotionImageFileNames = [
    'popcorn.jpg',
    'buy1get1.jpg',
  ];

  MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo(ref),
            verticalSpace(40),
            searchBar(context),
            verticalSpace(24),
            ...movieList(
              title: 'Veja agora:',
              movies: ref.watch(nowPlayingProvider),
              onTap: (movie) {
                ref.read(routerProvider).pushNamed('detail', extra: movie);
              },
            ),
            verticalSpace(30),
            ...promotionList(promotionImageFileNames),
            verticalSpace(30),
            ...movieList(
                title: 'Por vir:', movies: ref.watch(upcomingProvider)),
            verticalSpace(100)
          ],
        ),
      ],
    );
  }
}