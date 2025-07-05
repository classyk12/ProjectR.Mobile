// import 'package:auto_route/auto_route.dart';
// import 'package:projectr/routes/app_router.gr.dart';

// @AutoRouterConfig()
// class AppRouter extends RootStackRouter {
//   @override
//   RouteType get defaultRouteType =>
//       const RouteType.adaptive(); //.cupertino, .adaptive ..etc

//   @override
//   List<AutoRoute> get routes => [
//         AutoRoute(page: SplashRoute.page, initial: true),
//         AutoRoute(page: OnboardingRoute.page),
//         AutoRoute(page: LoginRoute.page),
//         AutoRoute(page: AccountSelectionRoute.page),
//         AutoRoute(page: PersonalInformationRoute.page),
//         AutoRoute(page: IdentificationDetailRoute.page),
//         AutoRoute(page: OtherInformationRoute.page),
//         AutoRoute(page: NextOfKinDetailRoute.page),
//         AutoRoute(page: BankInformationRoute.page),
//         AutoRoute(page: UserDocumentationRoute.page),
//         AutoRoute(page: ResetPasswordRoute.page),
//         AutoRoute(page: LinkedAccountsRoute.page),
//         AutoRoute(page: VerifyEmailRoute.page),
//         AutoRoute(page: CreatePasswordRoute.page),
//         AutoRoute(page: BusinessInformationRoute.page),
//         AutoRoute(page: PrimaryContactInformationRoute.page),
//         AutoRoute(page: BusinessDocumentationRoute.page),
//         AutoRoute(page: UpgradeProfileRoute.page),
//         AutoRoute(page: RiskProfileAssessmentRoute.page),

//         // General dashboard
//         AutoRoute(page: DashboardHomeRoute.page),
//         AutoRoute(page: DashboardMoreRoute.page),
//         AutoRoute(page: DashboardPaymentRoute.page),
//         AutoRoute(page: PaymentDetailRoute.page),
//         AutoRoute(page: DashboardInvestRoute.page),
//         AutoRoute(page: DashboardReportRoute.page),
//         AutoRoute(page: DashboardSupportRoute.page),
//         AutoRoute(page: TreasuryBillsOnboardingRoute.page),
//         AutoRoute(page: NgBondsOnboardingRoute.page),
//         AutoRoute(page: FixedIncomeOnboardingRoute.page),
//         AutoRoute(page: CommercialPaperOnboardingRoute.page),
//         AutoRoute(page: ProductDetailRoute.page),
//         AutoRoute(page: CalculatorRoute.page),
//         AutoRoute(page: CalculatorSummaryRoute.page),
//         AutoRoute(page: AssetManagementProductRoute.page),
//         AutoRoute(page: AssetManagementProductDetailRoute.page),
//         AutoRoute(page: AssetManagementCalculatorRoute.page),
//         AutoRoute(page: AssetManagementCalculatorSummaryRoute.page),
//         AutoRoute(page: ProfileDetailsRoute.page),
//         AutoRoute(page: WithdrawalBankRoute.page),
//         AutoRoute(page: GiftVoucherRoute.page),
//         AutoRoute(page: ChangePasswordRoute.page),
//         AutoRoute(page: ChangePasswordVerifyEmailRoute.page),
//         AutoRoute(page: ResetTransactionPinRoute.page),
//         AutoRoute(page: TermsAndConditionsRoute.page),
//         AutoRoute(page: PrivacyPolicyRoute.page),

//         //wallet
//         AutoRoute(page: WalletRoute.page),
//         AutoRoute(page: WebRouteViewerRoute.page),

//         //playbooks
//         AutoRoute(page: PlaybookHomeRoute.page),

//         //Security Trading
//         AutoRoute(page: SecuritiesHomeRoute.page),
//         AutoRoute(page: SecuritiesPortfolioRoute.page),
//         AutoRoute(page: ExploreAssetsRoute.page),
//         AutoRoute(page: SecuritiesHomeRoute.page),
//         AutoRoute(page: SecuritiesMoreRoute.page),
//         AutoRoute(page: StockRecommendationRoute.page),
//         AutoRoute(page: SecuritiesWatchlistRoute.page),
//         AutoRoute(page: StockSummaryRoute.page),
//         AutoRoute(page: SecuritiesOnboardingRoute.page),
//         AutoRoute(page: FavouriteDetailRoute.page),
//         AutoRoute(page: AssetDetailRoute.page),
//         AutoRoute(page: TradeOrderRoute.page),
//         AutoRoute(page: TradeOrderSummaryRoute.page),
//         AutoRoute(page: SecuritiesFavouriteRoute.page),
//         AutoRoute(page: OrderBookRoute.page),
//         AutoRoute(page: OrderBookSummaryRoute.page),
//         AutoRoute(page: ActionCompletionRoute.page),
//         AutoRoute(page: TransactionRoute.page),
//         AutoRoute(page: TransactionDetailRoute.page),

//         //Asset Management
//         AutoRoute(page: AssetManagementDashboardRoute.page),
//         AutoRoute(page: AssetManagementMoreRoute.page),
//         AutoRoute(page: AssetManagementPortfolioRoute.page),
//         AutoRoute(page: AssetManagementTransactionRoute.page),
//         AutoRoute(page: AssetManagementInvestRoute.page),
//         AutoRoute(page: AssetManagementOnboardingOverviewRoute.page),
//         AutoRoute(page: AssetManagementOnboardingHomeRoute.page),
//         AutoRoute(page: AssetManagementChooseInvestmentPathRoute.page),
//         AutoRoute(page: PortfolioSummaryRoute.page),
//         AutoRoute(page: AssetManagementInvestConfirmationRoute.page),
//         AutoRoute(page: AssetManagementInvestSummaryRoute.page),
//         AutoRoute(page: SMATransactionRoute.page),
//         AutoRoute(page: SMAPortfolioRoute.page),
//         AutoRoute(page: SMAPortfolioSummaryRoute.page),
//         AutoRoute(page: CashAccountTransactionDetailRoute.page),

//         //Mutual Fund
//         AutoRoute(page: MutualFundDashboardRoute.page),
//         AutoRoute(page: MutualFundOnboardingOverviewRoute.page),
//         AutoRoute(page: MutualFundOnboardingHomeRoute.page),
//         AutoRoute(page: MutualFundProductRoute.page),
//         AutoRoute(page: MutualFundTransactionRoute.page),
//         AutoRoute(page: MutualFundReportRoute.page),
//         AutoRoute(page: MutualFundProductDetailRoute.page),
//         AutoRoute(page: SubscriptionRoute.page),
//         AutoRoute(page: SubscriptionSummaryRoute.page),
//         AutoRoute(page: RedemptionSummaryRoute.page),
//         AutoRoute(page: RedemptionRoute.page),
//         AutoRoute(page: FundDetailRoute.page),
//         AutoRoute(page: MyFundRoute.page),
//         AutoRoute(page: DollarSubscriptionRoute.page),
//         AutoRoute(page: PaymentAdviceRoute.page),
//         AutoRoute(page: DollarSubscriptionSummaryRoute.page),
//       ];

//   @override
//   List<AutoRouteGuard> get guards => [
//         // optionally add root guards here
//       ];
// }
