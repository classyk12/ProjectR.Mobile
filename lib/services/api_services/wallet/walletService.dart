import 'package:projectr/services/api_services/wallet/iwalletService.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/domain/models/user_profile/user_withdrawal_bank_model.dart';
import 'package:projectr/shared/domain/models/wallet/bank_account_model.dart';
import 'package:projectr/shared/domain/models/wallet/nuban_account_model.dart';
import 'package:projectr/shared/domain/models/wallet/product_type_detail_model.dart';
import 'package:projectr/shared/domain/models/wallet/transfer_funds_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class WalletService implements IWalletService {
  final NetworkService networkService;

  WalletService(this.networkService);
  @override
  Future<Either<AppException, List<NubanAccountModel>>>
      getNubanAccounts() async {
    try {
      final eitherType = await networkService.get(
        'wallet/nuban-accounts',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting nuban accounts.',
            ),
          );
        },
        (response) {
          var res = response.data['data'];
          final data = List<NubanAccountModel>.from(
              res.map((x) => NubanAccountModel.fromMap(x)));
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting nuban accounts.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<BankAccountModel>>> getBankAccounts() async {
    try {
      final eitherType = await networkService.get(
        'wallet/bank-accounts',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting bank accounts.',
            ),
          );
        },
        (response) {
          var res = response.data['data'];
          final data = List<BankAccountModel>.from(
              res.map((x) => BankAccountModel.fromJson(x)));
          MY_BANK_ACCOUNTS = data;
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting bank accounts.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, NubanAccountModel>> createNubanAccount() async {
    try {
      final eitherType = await networkService.post(
          'wallet/create-nuban-account',
          data: {"productType": "NGN Wallet"});
      return eitherType.fold(
        (exception) {
          return Left(
            AppException(
              error: exception.message,
              message: exception.error ??
                  'Unknown error occurred while creating wallet',
            ),
          );
        },
        (response) {
          var res = response.data;
          final data = NubanAccountModel.fromMap(res);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while creating wallet',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, ProductTypeDetailModel>> getProductTypeDetail(
      {required String productName}) async {
    try {
      final eitherType = await networkService.get(
        'wallet/account-details/product-type?productType=$productName',
      );
      return eitherType.fold(
        (exception) {
          //  var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: exception.message,
              message: exception.message ??
                  'Unknown error occurred while getting product detail.',
            ),
          );
        },
        (response) {
          var res = response.data;
          final data = ProductTypeDetailModel.fromMap(res);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting product detail.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Map<String, dynamic>>> getProductTypes() async {
    try {
      final eitherType = await networkService.get(
        'wallet/account-details/check-all-product-types',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting products.',
            ),
          );
        },
        (response) {
          var res = response.data;
          PRODUCT_TYPES = res;
          return Right(res);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting products.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> transferFunds(
      {required TransferFundsModel model}) async {
    try {
      var json = model.toMap();
      final eitherType =
          await networkService.post('wallet/transfer', data: json);
      return eitherType.fold(
        (exception) {
          //  var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: exception.error,
              message: exception.error ??
                  'Unknown error occurred while initiating fund transfer.',
            ),
          );
        },
        (response) {
          return const Right(true);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while initiating fund transfer.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<UserWithdrawalBankDetails>>>
      getUserBankAccounts() async {
    try {
      final eitherType = await networkService.get(
        'wallet/bank-accounts',
      );
      return eitherType.fold(
        (exception) {
          //  var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: exception.error,
              message: exception.error ??
                  'Unknown error occurred while getting bank details.',
            ),
          );
        },
        (response) {
          var res = response.data['data'];
          final data = List<UserWithdrawalBankDetails>.from(
              res.map((x) => UserWithdrawalBankDetails.fromMap(x)));
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting bank details.',
          error: 'Error!',
        ),
      );
    }
  }
}
