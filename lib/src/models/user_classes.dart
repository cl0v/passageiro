
class UserClasses {
  final String id;
  final String? name;
  final String? type;
  final int classId;
  final int? purseId;
  final int? vCardPurseId;
  final int? priority;
  final Rules? rules;

  UserClasses(
      {required this.id,
      this.name,
      this.type,
      required this.classId,
      this.purseId,
      this.vCardPurseId,
      this.priority,
      this.rules});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'classId': classId,
      'purseId': purseId,
      'vCardPurseId': vCardPurseId,
      'priority': priority,
      'rules': rules?.toMap(),
    };
  }

  factory UserClasses.fromMap(Map<String, dynamic> map) {
    return UserClasses(
      id: map['id'] ?? '',
      name: map['name'],
      type: map['type'],
      classId: map['classId']?.toInt() ?? 0,
      purseId: map['purseId']?.toInt(),
      vCardPurseId: map['vCardPurseId']?.toInt(),
      priority: map['priority']?.toInt(),
      rules: map['rules'] != null ? Rules.fromMap(map['rules']) : null,
    );
  }
}

class Rules {
  final int? maxDayUseCounter;
  final int? maxMonthUseCounter;
  final List? weeklyUsePeriod;
  final int? subsequentUsePeriod;
  final int? farePaymentPct;
  final bool? twoSteps;
  final bool? companion;
  final int? maxCompanions;

  Rules({
    this.maxDayUseCounter,
    this.maxMonthUseCounter,
    this.weeklyUsePeriod,
    this.subsequentUsePeriod,
    this.farePaymentPct,
    this.twoSteps,
    this.companion,
    this.maxCompanions,
  });

  Map<String, dynamic> toMap() {
    return {
      'maxDayUseCounter': maxDayUseCounter,
      'maxMonthUseCounter': maxMonthUseCounter,
      'weeklyUsePeriod': weeklyUsePeriod,
      'subsequentUsePeriod': subsequentUsePeriod,
      'farePaymentPct': farePaymentPct,
      'twoSteps': twoSteps,
      'companion': companion,
      'maxCompanions': maxCompanions,
    };
  }

  factory Rules.fromMap(Map<String, dynamic> map) {
    return Rules(
      maxDayUseCounter: map['maxDayUseCounter']?.toInt(),
      maxMonthUseCounter: map['maxMonthUseCounter']?.toInt(),
      weeklyUsePeriod: map['weeklyUsePeriod'] ?? [],
      subsequentUsePeriod: map['subsequentUsePeriod']?.toInt(),
      farePaymentPct: map['farePaymentPct']?.toInt(),
      twoSteps: map['twoSteps'],
      companion: map['companion'],
      maxCompanions: map['maxCompanions']?.toInt(),
    );
  }
}
