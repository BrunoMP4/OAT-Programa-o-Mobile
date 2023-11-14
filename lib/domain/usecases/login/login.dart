import 'package:flix_movie/data/repositories/authentication/authentication.dart';
import 'package:flix_movie/data/repositories/user/user_repository.dart';
import 'package:flix_movie/domain/entities/result/result.dart';
import 'package:flix_movie/domain/entities/user/user.dart';
import 'package:flix_movie/domain/usecases/usecase.dart';

part 'login_params.dart';

class Login implements UseCase<Result<User>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepository;

  Login({required this.authentication, required this.userRepository});

  @override
  Future<Result<User>> call(LoginParams param) async {
    var idResult = await authentication.login(
        email: param.email, password: param.password);
    if (idResult is Success) {
      var userResult = await userRepository.getUser(uid: idResult.resultValue!);

      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(:final message) => Result.failed(message)
      };
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
