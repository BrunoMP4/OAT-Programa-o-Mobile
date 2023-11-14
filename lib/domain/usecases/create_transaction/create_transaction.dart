import 'package:flix_movie/data/repositories/transaction/transaction_repository.dart';
import 'package:flix_movie/domain/entities/result/result.dart';
import 'package:flix_movie/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:flix_movie/domain/usecases/usecase.dart';

class CreateTransaction
    implements UseCase<Result<void>, CreateTransactionParam> {
  final TransactionRepository _transactionRepository;

  CreateTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(CreateTransactionParam params) async {
    int transactionTime = DateTime.now().microsecondsSinceEpoch;

    var result = await _transactionRepository.createTransaction(
        transaction: params.transaction.copyWith(
            transactionTime: transactionTime,
            id: (params.transaction.id == null)
                ? 'flix-$transactionTime-${params.transaction.uid}'
                : params.transaction.id));

    return switch (result) {
      Success(value: _) => const Result.success(null),
      Failed(message: final message) => Result.failed(message)
    };
  }
}
