import 'package:projectr/services/api_services/wallet/iwalletService.dart';
import 'package:projectr/services/repositories/remote/wallet/wallet_repository.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/user_profile/user_withdrawal_bank_model.dart';
import 'package:projectr/shared/domain/models/wallet/bank_account_model.dart';
import 'package:projectr/shared/domain/models/wallet/nuban_account_model.dart';
import 'package:projectr/shared/domain/models/wallet/product_type_detail_model.dart';
import 'package:projectr/shared/domain/models/wallet/transfer_funds_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class WalletRepositoryImpl extends WalletRepository {
  final IWalletService service;

  WalletRepositoryImpl(this.service);

  @override
  Future<Either<AppException, List<NubanAccountModel>>>
      getNubanAccounts() async {
    return await service.getNubanAccounts();
  }

  @override
  Future<Either<AppException, NubanAccountModel>> createNubanAccount() async {
    return await service.createNubanAccount();
  }

  @override
  Future<Either<AppException, ProductTypeDetailModel>> getProductTypeDetail(
      {required String productName}) async {
    return await service.getProductTypeDetail(productName: productName);
  }

  @override
  Future<Either<AppException, Map<String, dynamic>>> getProductTypes() async {
    if (getProductTypeByForce != true && PRODUCT_TYPES.isNotEmpty) {
      return Right(PRODUCT_TYPES);
    }
    return await service.getProductTypes();
  }

  @override
  Future<Either<AppException, bool>> transferFunds(
      {required TransferFundsModel model}) async {
    return await service.transferFunds(model: model);
  }

  @override
  Future<Either<AppException, List<BankAccountModel>>> getBankAccounts() async {
    if (MY_BANK_ACCOUNTS.isNotEmpty) {
      return Right(MY_BANK_ACCOUNTS);
    }
    return await service.getBankAccounts();
  }

  @override
  Future<Either<AppException, List<UserWithdrawalBankDetails>>>
      getUserBankAccounts() {
    return service.getUserBankAccounts();
  }
}
