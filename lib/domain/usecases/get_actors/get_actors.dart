import 'package:flix_movie/data/repositories/movie/movie_repository.dart';
import 'package:flix_movie/domain/entities/actor/actor.dart';
import 'package:flix_movie/domain/entities/result/result.dart';
import 'package:flix_movie/domain/usecases/get_actors/get_actors_param.dart';
import 'package:flix_movie/domain/usecases/usecase.dart';

class GetActors implements UseCase<Result<List<Actor>>, GetActorsParam> {
  final MovieRepository _movieRepository;

  GetActors({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Actor>>> call(GetActorsParam param) async {
    var actorListResult = await _movieRepository.getActors(id: param.movieId);

    return switch (actorListResult) {
      Success(value: final actorList) => Result.success(actorList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
