import 'package:projectr/services/api_services/utility/utility_service.dart';
import 'package:projectr/services/repositories/remote/utility/utility_repository.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/data/local/shared_pref_service.dart';
import 'package:projectr/shared/domain/models/customer/name_enquiry_model.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/utility/bank_model.dart';
import 'package:projectr/shared/domain/models/utility/country_model.dart';
import 'package:projectr/shared/domain/models/utility/states_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class UtilityRepositoryImpl extends UtilityRepository {
  final IUtilityService dataSource;
  final SharedPrefsService cacheService;

  UtilityRepositoryImpl(this.dataSource, this.cacheService);

  @override
  Future<Either<AppException, List<CountryModel>>> getCountries() async {
    if (COUNTRIES_LIST.isNotEmpty) {
      return Right(COUNTRIES_LIST);
    }
    return await dataSource.getCountry();
  }

  @override
  Future<Either<AppException, Map<String, dynamic>>>
      getLocalGovernments() async {
    return await dataSource.getLocalGovernments();
  }

  @override
  Future<Either<AppException, List<StatesModel>>> getStates(
      {required int countryId}) async {
    return await dataSource.getStates(countryId: countryId);
  }

  @override
  Future<Either<AppException, List<BankModel>>> getBanks() async {
    if (BANK_LIST.isNotEmpty) {
      return Right(BANK_LIST);
    }
    return await dataSource.getBanks();
  }

  @override
  Future<Either<AppException, ValidateAccountModelResponse>>
      validateBankAccountDetails(
          {required ValidateBankAccountModel model}) async {
    return await dataSource.validateBankAccountDetails(model: model);
  }
}
