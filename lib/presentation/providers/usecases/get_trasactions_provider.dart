import 'package:flix_movie/domain/usecases/get_transactions/get_transactions.dart';
import 'package:flix_movie/presentation/providers/repositories/transaction_repository/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_trasactions_provider.g.dart';

@riverpod
GetTransactions getTransactions(GetTransactionsRef ref) => GetTransactions(
    transactionRepository: ref.watch(transactionRepositoryProvider));
