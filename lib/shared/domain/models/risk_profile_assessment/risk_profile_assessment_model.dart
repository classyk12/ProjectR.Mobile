// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Section {
  final String title;
  final String description;
  final List<Question> questions;

  Section({
    required this.questions,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'questions': questions.map((question) => question.toJson()).toList(),
    };
  }
}

class Question {
  final String questionText;
  final String? questionDescription;
  final List<String> options;

  Question({
    required this.questionText,
    this.questionDescription,
    required this.options,
  });
  Map<String, dynamic> toJson() {
    return {
      'questionText': questionText,
      'questionDescription': questionDescription,
      'options': options,
    };
  }
}

class RiskProfileAssessmentModel {
  int? ageRange;
  int? investmentDuration;
  int? investmentVolume;
  int? objective;
  int? tolerance;
  int? experience;
  int? impact;
  int? need;
  int? willingnessToTakeRisk;
  int? acceptFluctuations;
  int? investmentPreference;
  int? acceptShortTermLosses;
  int? experienceDuringRecession;
  int? alternativeIncomeSource;
  int? willingnessToLockInvestment;
  int? incomeSourceStability;
  int? longTermNeed;

  RiskProfileAssessmentModel({
    this.ageRange,
    this.investmentDuration,
    this.investmentVolume,
    this.objective,
    this.tolerance,
    this.experience,
    this.impact,
    this.need,
    this.willingnessToTakeRisk,
    this.acceptFluctuations,
    this.investmentPreference,
    this.acceptShortTermLosses,
    this.experienceDuringRecession,
    this.alternativeIncomeSource,
    this.willingnessToLockInvestment,
    this.incomeSourceStability,
    this.longTermNeed,
  });

  RiskProfileAssessmentModel copyWith({
    int? ageRange,
    int? investmentDuration,
    int? investmentVolume,
    int? objective,
    int? tolerance,
    int? experience,
    int? impact,
    int? need,
    int? willingnessToTakeRisk,
    int? acceptFluctuations,
    int? investmentPreference,
    int? acceptShortTermLosses,
    int? experienceDuringRecession,
    int? alternativeIncomeSource,
    int? willingnessToLockInvestment,
    int? incomeSourceStability,
    int? longTermNeed,
  }) {
    return RiskProfileAssessmentModel(
      ageRange: ageRange ?? this.ageRange,
      investmentDuration: investmentDuration ?? this.investmentDuration,
      investmentVolume: investmentVolume ?? this.investmentVolume,
      objective: objective ?? this.objective,
      tolerance: tolerance ?? this.tolerance,
      experience: experience ?? this.experience,
      impact: impact ?? this.impact,
      need: need ?? this.need,
      willingnessToTakeRisk:
          willingnessToTakeRisk ?? this.willingnessToTakeRisk,
      acceptFluctuations: acceptFluctuations ?? this.acceptFluctuations,
      investmentPreference: investmentPreference ?? this.investmentPreference,
      acceptShortTermLosses:
          acceptShortTermLosses ?? this.acceptShortTermLosses,
      experienceDuringRecession:
          experienceDuringRecession ?? this.experienceDuringRecession,
      alternativeIncomeSource:
          alternativeIncomeSource ?? this.alternativeIncomeSource,
      willingnessToLockInvestment:
          willingnessToLockInvestment ?? this.willingnessToLockInvestment,
      incomeSourceStability:
          incomeSourceStability ?? this.incomeSourceStability,
      longTermNeed: longTermNeed ?? this.longTermNeed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ageRange': ageRange,
      'investmentDuration': investmentDuration,
      'investmentVolume': investmentVolume,
      'objective': objective,
      'tolerance': tolerance,
      'experience': experience,
      'impact': impact,
      'need': need,
      'willingnessToTakeRisk': willingnessToTakeRisk,
      'acceptFluctuations': acceptFluctuations,
      'investmentPreference': investmentPreference,
      'acceptShortTermLosses': acceptShortTermLosses,
      'experienceDuringRecession': experienceDuringRecession,
      'alternativeIncomeSource': alternativeIncomeSource,
      'willingnessToLockInvestment': willingnessToLockInvestment,
      'incomeSourceStability': incomeSourceStability,
      'longTermNeed': longTermNeed,
    };
  }

  factory RiskProfileAssessmentModel.fromMap(Map<String, dynamic> map) {
    return RiskProfileAssessmentModel(
      ageRange: map['ageRange'] != null ? map['ageRange'] as int : null,
      investmentDuration: map['investmentDuration'] != null
          ? map['investmentDuration'] as int
          : null,
      investmentVolume: map['investmentVolume'] != null
          ? map['investmentVolume'] as int
          : null,
      objective: map['objective'] != null ? map['objective'] as int : null,
      tolerance: map['tolerance'] != null ? map['tolerance'] as int : null,
      experience: map['experience'] != null ? map['experience'] as int : null,
      impact: map['impact'] != null ? map['impact'] as int : null,
      need: map['need'] != null ? map['need'] as int : null,
      willingnessToTakeRisk: map['willingnessToTakeRisk'] != null
          ? map['willingnessToTakeRisk'] as int
          : null,
      acceptFluctuations: map['acceptFluctuations'] != null
          ? map['acceptFluctuations'] as int
          : null,
      investmentPreference: map['investmentPreference'] != null
          ? map['investmentPreference'] as int
          : null,
      acceptShortTermLosses: map['acceptShortTermLosses'] != null
          ? map['acceptShortTermLosses'] as int
          : null,
      experienceDuringRecession: map['experienceDuringRecession'] != null
          ? map['experienceDuringRecession'] as int
          : null,
      alternativeIncomeSource: map['alternativeIncomeSource'] != null
          ? map['alternativeIncomeSource'] as int
          : null,
      willingnessToLockInvestment: map['willingnessToLockInvestment'] != null
          ? map['willingnessToLockInvestment'] as int
          : null,
      incomeSourceStability: map['incomeSourceStability'] != null
          ? map['incomeSourceStability'] as int
          : null,
      longTermNeed:
          map['longTermNeed'] != null ? map['longTermNeed'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RiskProfileAssessmentModel.fromJson(String source) =>
      RiskProfileAssessmentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RiskProfileAssessmentModel(ageRange: $ageRange, investmentDuration: $investmentDuration, investmentVolume: $investmentVolume, objective: $objective, tolerance: $tolerance, experience: $experience, impact: $impact, need: $need, willingnessToTakeRisk: $willingnessToTakeRisk, acceptFluctuations: $acceptFluctuations, investmentPreference: $investmentPreference, acceptShortTermLosses: $acceptShortTermLosses, experienceDuringRecession: $experienceDuringRecession, alternativeIncomeSource: $alternativeIncomeSource, willingnessToLockInvestment: $willingnessToLockInvestment, incomeSourceStability: $incomeSourceStability, longTermNeed: $longTermNeed)';
  }

  @override
  bool operator ==(covariant RiskProfileAssessmentModel other) {
    if (identical(this, other)) return true;

    return other.ageRange == ageRange &&
        other.investmentDuration == investmentDuration &&
        other.investmentVolume == investmentVolume &&
        other.objective == objective &&
        other.tolerance == tolerance &&
        other.experience == experience &&
        other.impact == impact &&
        other.need == need &&
        other.willingnessToTakeRisk == willingnessToTakeRisk &&
        other.acceptFluctuations == acceptFluctuations &&
        other.investmentPreference == investmentPreference &&
        other.acceptShortTermLosses == acceptShortTermLosses &&
        other.experienceDuringRecession == experienceDuringRecession &&
        other.alternativeIncomeSource == alternativeIncomeSource &&
        other.willingnessToLockInvestment == willingnessToLockInvestment &&
        other.incomeSourceStability == incomeSourceStability &&
        other.longTermNeed == longTermNeed;
  }

  @override
  int get hashCode {
    return ageRange.hashCode ^
        investmentDuration.hashCode ^
        investmentVolume.hashCode ^
        objective.hashCode ^
        tolerance.hashCode ^
        experience.hashCode ^
        impact.hashCode ^
        need.hashCode ^
        willingnessToTakeRisk.hashCode ^
        acceptFluctuations.hashCode ^
        investmentPreference.hashCode ^
        acceptShortTermLosses.hashCode ^
        experienceDuringRecession.hashCode ^
        alternativeIncomeSource.hashCode ^
        willingnessToLockInvestment.hashCode ^
        incomeSourceStability.hashCode ^
        longTermNeed.hashCode;
  }

  bool hasNullValues() {
    return [
      ageRange,
      investmentDuration,
      investmentVolume,
      objective,
      tolerance,
      experience,
      impact,
      need,
      willingnessToTakeRisk,
      acceptFluctuations,
      investmentPreference,
      acceptShortTermLosses,
      experienceDuringRecession,
      alternativeIncomeSource,
      willingnessToLockInvestment,
      incomeSourceStability,
      longTermNeed,
    ].any((value) => value == null);
  }
}
