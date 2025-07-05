import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/user_profile/user_withdrawal_bank_model.dart';
import 'package:projectr/shared/domain/models/wallet/bank_account_model.dart';
import 'package:projectr/shared/domain/models/wallet/nuban_account_model.dart';
import 'package:projectr/shared/domain/models/wallet/product_type_detail_model.dart';
import 'package:projectr/shared/domain/models/wallet/transfer_funds_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class IWalletService {
  Future<Either<AppException, List<NubanAccountModel>>> getNubanAccounts();

  Future<Either<AppException, NubanAccountModel>> createNubanAccount();

  Future<Either<AppException, ProductTypeDetailModel>> getProductTypeDetail(
      {required String productName});

  Future<Either<AppException, Map<String, dynamic>>> getProductTypes();

  Future<Either<AppException, bool>> transferFunds(
      {required TransferFundsModel model});

  Future<Either<AppException, List<BankAccountModel>>> getBankAccounts();

  Future<Either<AppException, List<UserWithdrawalBankDetails>>>
      getUserBankAccounts();
}
