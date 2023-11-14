import 'package:flix_movie/domain/entities/movie_detail/movie_detail.dart';
import 'package:flix_movie/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieOverview(AsyncValue<MovieDetail?> asyncMovieDetail) => [
      const Text(
        'Visão geral',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      verticalSpace(10),
      asyncMovieDetail.when(
        data: (movieDetail) =>
            Text(movieDetail != null ? movieDetail.overview : ''),
        error: (error, stackTrace) => const Text(
            "Falha ao carregar a visão geral do filme. Por favor, tente novamente mais tarde."),
        loading: () => const CircularProgressIndicator(),
      )
    ];
