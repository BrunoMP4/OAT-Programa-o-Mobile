import 'package:flix_movie/data/firebase/firebase_transaction_repository.dart';
import 'package:flix_movie/data/repositories/transaction/transaction_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_repository_provider.g.dart';

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) =>
    FirebaseTransactionRepository();
