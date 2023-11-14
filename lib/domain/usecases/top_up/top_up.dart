import 'package:flix_movie/data/repositories/transaction/transaction_repository.dart';
import 'package:flix_movie/domain/entities/result/result.dart';
import 'package:flix_movie/domain/entities/transaction/transaction.dart';
import 'package:flix_movie/domain/usecases/create_transaction/create_transaction.dart';
import 'package:flix_movie/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:flix_movie/domain/usecases/top_up/top_up_param.dart';
import 'package:flix_movie/domain/usecases/usecase.dart';

class TopUp implements UseCase<Result<void>, TopUpParam> {
  final TransactionRepository _transactionRepository;

  TopUp({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(TopUpParam params) async {
    CreateTransaction createTransaction =
        CreateTransaction(transactionRepository: _transactionRepository);

    int trasactionTime = DateTime.now().microsecondsSinceEpoch;

    var createTransactionResult = await createTransaction(
        CreateTransactionParam(
            transaction: Transaction(
                id: 'flix-topup-$trasactionTime-${params.userId}',
                uid: params.userId,
                title: 'Top Up',
                adminFee: 0,
                total: -params.amount,
                transactionTime: trasactionTime)));

    return switch (createTransactionResult) {
      Success(value: _) => const Result.success(null),
      Failed(message: _) => const Result.failed('Failed to top up')
    };
  }
}
