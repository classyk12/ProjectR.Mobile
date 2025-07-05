import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/user_profile/user_withdrawal_bank_model.dart';
import 'package:projectr/shared/domain/models/wallet/bank_account_model.dart';
import 'package:projectr/shared/domain/models/wallet/nuban_account_model.dart';
import 'package:projectr/shared/domain/models/wallet/product_type_detail_model.dart';
import 'package:projectr/shared/domain/models/wallet/transfer_funds_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class WalletRepository {
  ///get nuban accounts
  Future<Either<AppException, List<NubanAccountModel>>> getNubanAccounts();

  ///create  account
  Future<Either<AppException, NubanAccountModel>> createNubanAccount();

  ///transfer  funds from wallet to busineeses or vice versa
  Future<Either<AppException, bool>> transferFunds(
      {required TransferFundsModel model});

//get all product types
  Future<Either<AppException, Map<String, dynamic>>> getProductTypes();

  //get all product types details
  Future<Either<AppException, ProductTypeDetailModel>> getProductTypeDetail(
      {required String productName});

  ///get user bank accounts
  Future<Either<AppException, List<BankAccountModel>>> getBankAccounts();

  ///get user withdrawal bank accounts
  Future<Either<AppException, List<UserWithdrawalBankDetails>>>
      getUserBankAccounts();
}
