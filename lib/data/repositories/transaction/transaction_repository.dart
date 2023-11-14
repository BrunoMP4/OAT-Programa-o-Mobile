import 'package:flix_movie/domain/entities/result/result.dart';
import 'package:flix_movie/domain/entities/transaction/transaction.dart';

abstract interface class TransactionRepository {
  Future<Result<Transaction>> createTransaction(
      {required Transaction transaction});
  Future<Result<List<Transaction>>> getUserTransactions({required String uid});
}
