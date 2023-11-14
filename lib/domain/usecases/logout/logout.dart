import 'package:flix_movie/data/repositories/authentication/authentication.dart';
import 'package:flix_movie/domain/entities/result/result.dart';
import 'package:flix_movie/domain/usecases/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication})
      : _authentication = authentication;

  @override
  Future<Result<void>> call(void _) {
    return _authentication.logout();
  }
}
