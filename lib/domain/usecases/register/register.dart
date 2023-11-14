import 'package:flix_movie/data/repositories/authentication/authentication.dart';
import 'package:flix_movie/data/repositories/user/user_repository.dart';
import 'package:flix_movie/domain/entities/result/result.dart';
import 'package:flix_movie/domain/entities/user/user.dart';
import 'package:flix_movie/domain/usecases/register/register_param.dart';
import 'package:flix_movie/domain/usecases/usecase.dart';

class Register implements UseCase<Result<User>, RegisterParam> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  Register(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParam param) async {
    var uidResult = await _authentication.register(
        email: param.email, password: param.password);

    if (uidResult.isSuccess) {
      var userResult = await _userRepository.createUser(
          uid: uidResult.resultValue!,
          email: param.email,
          name: param.name,
          photoUrl: param.photoUrl);

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return Failed(uidResult.errorMessage!);
    }
  }
}
