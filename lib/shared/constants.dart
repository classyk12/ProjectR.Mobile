import 'package:projectr/shared/domain/models/account_creation/signup_model.dart';
import 'package:projectr/shared/domain/models/authentication/login_model.dart';
import 'package:projectr/shared/domain/models/kyc_be/embassy_model.dart';
import 'package:projectr/shared/domain/models/neulogic/cash_account_model.dart';
import 'package:projectr/shared/domain/models/neulogic/cash_account_transaction_model.dart';
import 'package:projectr/shared/domain/models/neulogic/mutual_funds/mutual_fund_account_model.dart';
import 'package:projectr/shared/domain/models/neulogic/relationship_model.dart';
import 'package:projectr/shared/domain/models/risk_profile_assessment/risk_profile_assessment_model.dart';
import 'package:projectr/shared/domain/models/utility/bank_model.dart';
import 'package:projectr/shared/domain/models/utility/country_model.dart';
import 'package:projectr/shared/domain/models/wallet/bank_account_model.dart';
import 'package:projectr/shared/domain/models/zanibal/equities_model.dart';
import 'package:projectr/shared/domain/models/zanibal/investment_account_model.dart';
import 'package:projectr/shared/enums.dart';

const String APP_THEME_STORAGE_KEY = 'CURRENT_APP_THEME';
const String VISITED_STORAGE_KEY = 'visited';
const String SECURITIES_VISITED_STORAGE_KEY = 'securities_visited';
const String ASSET_MANAGEMENT_VISITED_STORAGE_KEY = 'assetManagement_visited';
const String SELECTED_INVESTMENT_PATH_KEY = 'investment-path';
const String SELF_INVESTMENT_KEY = 'self-investment';
const String MANAGED_PORTFOLIO_KEY = 'managed-portfolio';
const String BIOMETRICS_STORAGE_KEY = 'biometrics';
const String PLUSJAKARTASANS = 'PlusJakartaSans';
const String INTER = 'Inter';
const String INDIVIDUAL = 'Individual';
const String CORPORATE = 'Corporate';
const String DATE_FORMATTER_YEAR_FIRST = "yyyy-MM-dd";
const String DATE_FORMATTER_DAY_FIRST = "dd/MM/yyyy";
const String COUNTRIES_STORAGE_KEY = 'CountrysKey';
const String LOGIN_USER_STORAGE_KEY = 'LoginUserKey';
const String SOCKET_EVENT_KEY = 'zanibalMessage';
const String TOP_LOSERS_KEY = 'TopLosers';
const String TOP_GAINERS_KEY = 'TopGainers';
const bool MOCK_ID_VALIDATION_RESPONSE = true;
const String SECURITIES_STATS_CACHE_KEY = 'SecuritiesStat';

const String DOLLAR_FUND_TRUST_DEED_FILE_PATH =
    'assets/pdfs/CardinalStone_Dollar_Fund _Trust_Deed_Signed.pdf';
const String DOLLAR_FUND_TRUST_PROSPECTUS_FILE_PATH =
    'assets/pdfs/CardinalStone_Dollar_Fund_Prospectus_Signed.pdf';

const String EQUITY_FUND_TRUST_DEED_FILE_PATH =
    'assets/pdfs/CardinalStone_Equity_Fund _Trust Deed_Signed.pdf';
const String EQUITY_FUND_TRUST_PROSPECTUS_FILE_PATH =
    'assets/pdfs/CardinalStone_Equity_Fund_Prospectus_Signed.pdf';

const String FIXED_INCOME_FUND_PROSPECTUS_FILE_PATH =
    'assets/pdfs/CardinalStone_Fixed_Income_Alpha_Fund_Prospectus.pdf';
const String FIXED_INCOME_FUND_TRUST_DEED_FILE_PATH =
    'assets/pdfs/CardinalStone_Fixed_Income_Alpha_Fund_Trust_Deed.pdf';

const String MONEY_MARKET_FUND_PROSPECTUS_FILE_PATH =
    'assets/pdfs/CardinalStone_Money_Market_Fund_Prospectus_Executed.pdf';
const String MONEY_MARKET_FUND_TRUST_TRUST_DEED_FILE_PATH =
    'assets/pdfs/CardinalStone_Money_Market_Fund_Trust_Deed_Executed.pdf';

///key event listened to from socket for securitie
const String SECURITIES_STATS_KEY = 'SecurityStats';

const double MINIMUM_TRANSFER_AMOUNT = 1000;

///This class holds a static version of api class models. This is to enale static access to them anywhere in the app without having to rely on reading them from a provider
SignUpModel ACCOUNT_CREATION_MODEL = SignUpModel();
LoginUser? USER_DATA = LoginUser.initial();
String AUTH_TOKEN = '';
AppThemeMode CURRENT_APP_THEME_MODE = AppThemeMode.light;
String SELECTED_INVESTMENT_PATH = '';
List<InvestmentAccountModel> INVESTMENT_ACCOUNTS = <InvestmentAccountModel>[];
List<Equities> EQUITIES_LIST = <Equities>[];
List<EmbassyModel> EMBASSIES_LIST = <EmbassyModel>[];
List<MutualFundAccountModel> MY_MUTUAL_FUNDS_LIST = <MutualFundAccountModel>[];
List<BankAccountModel> MY_BANK_ACCOUNTS = <BankAccountModel>[];
List<CountryModel> COUNTRIES_LIST = <CountryModel>[];
List<RelationShipModel> RELATIONSHIP_LIST = <RelationShipModel>[];
List<BankModel> BANK_LIST = <BankModel>[];
Map<String, dynamic> PRODUCT_TYPES = <String, dynamic>{};
List<FixedIncomeCashAccountModel> CASH_ACCOUNTS =
    <FixedIncomeCashAccountModel>[];

resetValuesOnLogout() {
  USER_DATA = LoginUser.initial();
  AUTH_TOKEN = '';
  SELECTED_INVESTMENT_PATH = '';
  INVESTMENT_ACCOUNTS = <InvestmentAccountModel>[];
  MY_MUTUAL_FUNDS_LIST = <MutualFundAccountModel>[];
  MY_BANK_ACCOUNTS = <BankAccountModel>[];
  PRODUCT_TYPES = <String, dynamic>{};
  CASH_ACCOUNTS = <FixedIncomeCashAccountModel>[];
}

///This flag indicates if a new update of the product type should be gotten from the api irrespecitive if a cache value exist before
bool getProductTypeByForce = false;

List<String> getIdentificationTypes() =>
    ['Voters Card', 'International Passport', 'NIN Slip', 'Driver\'s License'];

List<Section> sections() => [
      Section(
        title: 'Ability to Take Risk',
        description:
            'Clients\' ability to take risk is a function of factors such as their investment horizon, financial situation, and experience in handling financial products. The following questions aim to capture the client\'s ability to handle varying degrees of risk.',
        questions: [
          Question(
            questionText: 'What is your age range?',
            options: [
              'Above 55 years',
              '35 to 55 years',
              'Below 35 years',
            ],
          ),
          Question(
            questionText: 'How long do you intend to hold this investment?',
            options: [
              '1 year',
              '1-3 year',
              'Above 3year',
            ],
          ),
          Question(
            questionText: 'What volume of funds are you investing?',
            options: [
              'Below ₦5 million',
              '₦5 million to ₦25 million',
              'Above ₦25 million',
            ],
          ),
          Question(
            questionText: 'What are your liquidity needs?',
            questionDescription:
                '> How quickly would you need access to your funds in an emergency?',
            options: [
              'Immediately (within a month)',
              'Within 1 to 3 months',
              'More than 1 year',
            ],
          ),
          Question(
            questionText: 'How would you describe your investment experience?',
            questionDescription:
                '> How familiar are you with investing in stocks, bonds, or other financial assets?',
            options: [
              'Very inexperienced',
              'Somewhat inexperienced',
              'Somewhat experienced',
              'Experienced',
              'Very experienced',
            ],
          ),
          Question(
            questionText:
                'How stable are your current and future income sources (salary, pensions, other income)?',
            options: [
              'Very unstable',
              'Unstable',
              'Somewhat stable',
              'Stable',
              'Very stable',
            ],
          ),
        ],
      ),
      Section(
        title: 'Willingness to Take Risk',
        description:
            'The willingness to take risk refers to the psychological comfort a client has with potential losses and market volatility. These questions assess the client\'s tolerance for risk.',
        questions: [
          Question(
            questionText:
                'When faced with market downturns (e.g., a 15% decline in your portfolio\'s value), what would you likely do?',
            options: [
              'Sell all investments to avoid further loss',
              'Sell a portion of investments to limit further loss',
              'Hold and wait for the market to recover',
              'Buy more to take advantage of lower prices',
            ],
          ),
          Question(
            questionText:
                'What best describes your attitude towards taking financial risks?',
            options: [
              'Very cautious and risk-reverse-careful',
              'A thoughtful risk taker',
              'Sometimes daring',
              'Daring',
            ],
          ),
          Question(
            questionText:
                'Would you accept fluctuations in your portfolio’s value in exchange for higher potential returns?',
            options: [
              'Strongly disagree',
              'Disagree',
              'Somewhat agree',
              'Agree',
              'Strongly agree',
            ],
          ),
          Question(
            questionText: 'What is your primary investment objective?',
            options: [
              'Capital Preservation',
              'Income',
              'Growth',
            ],
          ),
          Question(
            questionText:
                'How do you feel about inflation or interest rate changes impacting your investments?',
            options: [
              'Not concerned',
              'Somewhat concerned',
              'Highly concerned',
            ],
          ),
          Question(
            questionText:
                'Which of the following best describes your preference?',
            options: [
              'A product with a 6% annual return and little to no risk of losing your initial investment',
              'A product with a 17% annual return but with the risk of losing up to 15% of your initial investment',
              'A balanced mix of both products',
            ],
          ),
          Question(
            questionText:
                'I am willing to accept significant short-term losses in order to achieve long-term gains.',
            options: [
              'Strongly disagree',
              'Disagree',
              'Somewhat agree',
              'Agree',
              'Strongly agree',
            ],
          ),
          Question(
            questionText:
                'In your experience with past investments, how have you reacted to major market corrections (e.g., during recessions)?',
            options: [
              'Sold most of my investments to avoid further losses',
              'Reduced exposure to risky assets, but kept some investments',
              'Held on to my investments until the market recovered',
              'Bought more investments during the downturn',
            ],
          ),
        ],
      ),
      Section(
        title: 'Capacity to Withstand Risk',
        description:
            'This section assesses the financial strength of clients, allowing us to determine if they can sustain potential losses without jeopardizing their financial security.',
        questions: [
          Question(
            questionText:
                'Do you have alternative sources of income or savings that can sustain your lifestyle in case of significant investment losses?',
            options: [
              'Yes, I have ample sources of income/savings',
              'Yes, but they are limited',
              'No, I depend solely on my investments'
            ],
          ),
          Question(
            questionText:
                'How concerned are you about meeting your liquidity needs through your investments in the next 2 to 3 years?',
            options: [
              'Very concerned',
              'Somewhat concerned',
              'Not concerned at all'
            ],
          ),
          Question(
            questionText:
                'How willing are you to lock up your investment without accessing it for at least 5 years?',
            options: [
              'Very unwilling',
              'Somewhat unwilling',
              'Willing',
              'Very willing',
            ],
          ),
        ],
      ),
    ];

List<CashAccountTransactionModel> transactionsDummyData = [
  CashAccountTransactionModel(
    accountName: "John Doe",
    accountNo: "1234567890",
    alternateAccountNo: null,
    businessDate: "2025-02-06",
    chequeReference: null,
    currencyId: "USD",
    currencyName: "United States Dollar",
    customerNo: "CUST001",
    effectiveDate: "2025-02-06",
    isReversed: "No",
    nubanAccountNo: null,
    processingDate: "2025-02-06",
    transactionAmount: 1500.75,
    transactionDescription: "ATM Withdrawal",
    transactionNumber: 100001,
    transactionReference: "TXN123456",
    transactionType: "Debit",
  ),
  CashAccountTransactionModel(
    accountName: "Jane Smith",
    accountNo: "9876543210",
    alternateAccountNo: null,
    businessDate: "2025-02-05",
    chequeReference: "CHQ-20250205",
    currencyId: "NGN",
    currencyName: "Nigerian Naira",
    customerNo: "CUST002",
    effectiveDate: "2025-02-05",
    isReversed: "No",
    nubanAccountNo: "0012345678",
    processingDate: "2025-02-05",
    transactionAmount: 50000.00,
    transactionDescription: "Cheque Deposit",
    transactionNumber: 100002,
    transactionReference: "TXN987654",
    transactionType: "Credit",
  ),
  CashAccountTransactionModel(
    accountName: "Alice Johnson",
    accountNo: "1122334455",
    alternateAccountNo: null,
    businessDate: "2025-02-04",
    chequeReference: null,
    currencyId: "USD",
    currencyName: "United States Dollar",
    customerNo: "CUST003",
    effectiveDate: "2025-02-04",
    isReversed: "No",
    nubanAccountNo: "0098765432",
    processingDate: "2025-02-04",
    transactionAmount: 300.50,
    transactionDescription: "POS Purchase",
    transactionNumber: 100003,
    transactionReference: "TXN112233",
    transactionType: "Debit",
  ),
  CashAccountTransactionModel(
    accountName: "Bob Williams",
    accountNo: "2233445566",
    alternateAccountNo: null,
    businessDate: "2025-02-03",
    chequeReference: null,
    currencyId: "GBP",
    currencyName: "British Pound",
    customerNo: "CUST004",
    effectiveDate: "2025-02-03",
    isReversed: "Yes",
    nubanAccountNo: null,
    processingDate: "2025-02-03",
    transactionAmount: 1200.00,
    transactionDescription: "Fund Transfer",
    transactionNumber: 100004,
    transactionReference: "TXN223344",
    transactionType: "Credit",
  ),
  CashAccountTransactionModel(
    accountName: "Emily Davis",
    accountNo: "3344556677",
    alternateAccountNo: null,
    businessDate: "2025-02-02",
    chequeReference: "CHQ-20250202",
    currencyId: "EUR",
    currencyName: "Euro",
    customerNo: "CUST005",
    effectiveDate: "2025-02-02",
    isReversed: "No",
    nubanAccountNo: "0011223344",
    processingDate: "2025-02-02",
    transactionAmount: 750.25,
    transactionDescription: "Cheque Payment",
    transactionNumber: 100005,
    transactionReference: "TXN334455",
    transactionType: "Debit",
  ),
  CashAccountTransactionModel(
    accountName: "Michael Brown",
    accountNo: "4455667788",
    alternateAccountNo: null,
    businessDate: "2025-02-01",
    chequeReference: null,
    currencyId: "USD",
    currencyName: "United States Dollar",
    customerNo: "CUST006",
    effectiveDate: "2025-02-01",
    isReversed: "No",
    nubanAccountNo: "0088997766",
    processingDate: "2025-02-01",
    transactionAmount: 2000.00,
    transactionDescription: "Salary Payment",
    transactionNumber: 100006,
    transactionReference: "TXN445566",
    transactionType: "Credit",
  ),
];
