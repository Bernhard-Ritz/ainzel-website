import '/components/home_about_ainzel_widget.dart';
import '/components/home_banking_widget.dart';
import '/components/home_business_plan_widget.dart';
import '/components/home_company_profile_widget.dart';
import '/components/home_contact_us_widget.dart';
import '/components/home_corporate_risk_report_widget.dart';
import '/components/home_credit_write_up_widget.dart';
import '/components/home_custom_report_widget.dart';
import '/components/home_e_s_g_report_widget.dart';
import '/components/home_help_widget.dart';
import '/components/home_high_tech_widget.dart';
import '/components/home_main2_widget.dart';
import '/components/home_main3_widget.dart';
import '/components/home_pharma_widget.dart';
import '/components/home_professional_services_widget.dart';
import '/components/home_public_sector_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HomeMain2 component.
  late HomeMain2Model homeMain2Model;
  // Model for HomeBanking component.
  late HomeBankingModel homeBankingModel;
  // Model for HomeHighTech component.
  late HomeHighTechModel homeHighTechModel;
  // Model for HomePharma component.
  late HomePharmaModel homePharmaModel;
  // Model for HomeProfessionalServices component.
  late HomeProfessionalServicesModel homeProfessionalServicesModel;
  // Model for HomePublicSector component.
  late HomePublicSectorModel homePublicSectorModel;
  // Model for HomeCompanyProfile component.
  late HomeCompanyProfileModel homeCompanyProfileModel;
  // Model for HomeCreditWriteUp component.
  late HomeCreditWriteUpModel homeCreditWriteUpModel;
  // Model for HomeCorporateRiskReport component.
  late HomeCorporateRiskReportModel homeCorporateRiskReportModel;
  // Model for HomeBusinessPlan component.
  late HomeBusinessPlanModel homeBusinessPlanModel;
  // Model for HomeESGReport component.
  late HomeESGReportModel homeESGReportModel;
  // Model for HomeCustomReport component.
  late HomeCustomReportModel homeCustomReportModel;
  // Model for HomeAboutAinzel component.
  late HomeAboutAinzelModel homeAboutAinzelModel;
  // Model for HomeHelp component.
  late HomeHelpModel homeHelpModel;
  // Model for HomeContactUs component.
  late HomeContactUsModel homeContactUsModel;
  // Model for HomeMain3 component.
  late HomeMain3Model homeMain3Model;

  @override
  void initState(BuildContext context) {
    homeMain2Model = createModel(context, () => HomeMain2Model());
    homeBankingModel = createModel(context, () => HomeBankingModel());
    homeHighTechModel = createModel(context, () => HomeHighTechModel());
    homePharmaModel = createModel(context, () => HomePharmaModel());
    homeProfessionalServicesModel =
        createModel(context, () => HomeProfessionalServicesModel());
    homePublicSectorModel = createModel(context, () => HomePublicSectorModel());
    homeCompanyProfileModel =
        createModel(context, () => HomeCompanyProfileModel());
    homeCreditWriteUpModel =
        createModel(context, () => HomeCreditWriteUpModel());
    homeCorporateRiskReportModel =
        createModel(context, () => HomeCorporateRiskReportModel());
    homeBusinessPlanModel = createModel(context, () => HomeBusinessPlanModel());
    homeESGReportModel = createModel(context, () => HomeESGReportModel());
    homeCustomReportModel = createModel(context, () => HomeCustomReportModel());
    homeAboutAinzelModel = createModel(context, () => HomeAboutAinzelModel());
    homeHelpModel = createModel(context, () => HomeHelpModel());
    homeContactUsModel = createModel(context, () => HomeContactUsModel());
    homeMain3Model = createModel(context, () => HomeMain3Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    homeMain2Model.dispose();
    homeBankingModel.dispose();
    homeHighTechModel.dispose();
    homePharmaModel.dispose();
    homeProfessionalServicesModel.dispose();
    homePublicSectorModel.dispose();
    homeCompanyProfileModel.dispose();
    homeCreditWriteUpModel.dispose();
    homeCorporateRiskReportModel.dispose();
    homeBusinessPlanModel.dispose();
    homeESGReportModel.dispose();
    homeCustomReportModel.dispose();
    homeAboutAinzelModel.dispose();
    homeHelpModel.dispose();
    homeContactUsModel.dispose();
    homeMain3Model.dispose();
  }
}
