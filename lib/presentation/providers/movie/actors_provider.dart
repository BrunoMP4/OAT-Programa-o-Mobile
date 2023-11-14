import 'package:flix_movie/domain/entities/actor/actor.dart';
import 'package:flix_movie/domain/entities/result/result.dart';
import 'package:flix_movie/domain/usecases/get_actors/get_actors.dart';
import 'package:flix_movie/domain/usecases/get_actors/get_actors_param.dart';
import 'package:flix_movie/presentation/providers/usecases/get_actors_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(ActorsRef ref, {required int movieId}) async {
  GetActors getActors = ref.read(getActorsProvider);

  var actorResult = await getActors(GetActorsParam(movieId: movieId));

  return switch (actorResult) {
    Success(value: final actors) => actors,
    Failed(message: _) => []
  };
}
