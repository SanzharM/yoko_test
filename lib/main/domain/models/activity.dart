import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:yoko_test/core/services/utils.dart';

import 'package:yoko_test/main/domain/models/tariff.dart';

class Activity {
  final int? id;
  final String? categoryName;
  final List<DateTime>? availableDates;
  final String? nameRu;
  final String? nameEn;
  final String? nameKk;
  final String? imageUrl;
  final String? code;
  final bool enabled;
  final bool dateRequired;
  final bool skiPassRequired;
  final String? description;
  final dynamic workingHours;
  final List<Tariff>? tariffs;
  final DateTime? createdDate;

  const Activity({
    this.id,
    this.categoryName,
    this.availableDates,
    this.nameRu,
    this.nameEn,
    this.nameKk,
    this.imageUrl,
    this.code,
    this.enabled = false,
    this.dateRequired = false,
    this.skiPassRequired = false,
    this.description,
    this.workingHours,
    this.tariffs,
    this.createdDate,
  });

  Activity copyWith({
    int? id,
    String? categoryName,
    List<DateTime>? availableDates,
    String? nameRu,
    String? nameEn,
    String? nameKk,
    String? imageUrl,
    String? code,
    bool? enabled,
    bool? dateRequired,
    bool? skiPassRequired,
    String? description,
    dynamic workingHours,
    List<Tariff>? tariffs,
    DateTime? createdDate,
  }) {
    return Activity(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      availableDates: availableDates ?? this.availableDates,
      nameRu: nameRu ?? this.nameRu,
      nameEn: nameEn ?? this.nameEn,
      nameKk: nameKk ?? this.nameKk,
      imageUrl: imageUrl ?? this.imageUrl,
      code: code ?? this.code,
      enabled: enabled ?? this.enabled,
      dateRequired: dateRequired ?? this.dateRequired,
      skiPassRequired: skiPassRequired ?? this.skiPassRequired,
      description: description ?? this.description,
      workingHours: workingHours ?? this.workingHours,
      tariffs: tariffs ?? this.tariffs,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (categoryName != null) {
      result.addAll({'categoryName': categoryName});
    }
    if (availableDates != null) {
      result.addAll({'availableDates': availableDates!.map((x) => x.millisecondsSinceEpoch).toList()});
    }
    if (nameRu != null) {
      result.addAll({'nameRu': nameRu});
    }
    if (nameEn != null) {
      result.addAll({'nameEn': nameEn});
    }
    if (nameKk != null) {
      result.addAll({'nameKk': nameKk});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (code != null) {
      result.addAll({'code': code});
    }
    result.addAll({'enabled': enabled});
    result.addAll({'dateRequired': dateRequired});
    result.addAll({'skiPassRequired': skiPassRequired});
    if (description != null) {
      result.addAll({'description': description});
    }
    result.addAll({'workingHours': workingHours});
    if (tariffs != null) {
      result.addAll({'tariffs': tariffs?.map((x) => x.toMap()).toList()});
    }
    if (createdDate != null) {
      result.addAll({'createdDate': createdDate!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: int.tryParse('${map['id']}'),
      categoryName: map['categoryName'],
      availableDates: map['availableDates'] != null
          ? List<DateTime>.from(map['availableDates']?.map((x) => Utils.parseDate(x, format: 'yyyy-MM-dd')))
          : null,
      nameRu: map['nameRu'],
      nameEn: map['nameEn'],
      nameKk: map['nameKk'],
      imageUrl: map['imageUrl'],
      code: map['code'],
      enabled: map['enabled'] ?? false,
      dateRequired: map['dateRequired'] ?? false,
      skiPassRequired: map['skiPassRequired'] ?? false,
      description: map['description'],
      // workingHours: map['workingHours'],
      tariffs: List<Tariff>.from(map['tariffs']?.map((x) => Tariff.fromMap(x))),
      createdDate: map['createdDate'] != null ? Utils.parseDate(map['createdDate']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) => Activity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Activity(id: $id, categoryName: $categoryName, availableDates: $availableDates, nameRu: $nameRu, nameEn: $nameEn, nameKk: $nameKk, imageUrl: $imageUrl, code: $code, enabled: $enabled, dateRequired: $dateRequired, skiPassRequired: $skiPassRequired, description: $description, workingHours: $workingHours, tariffs: $tariffs, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Activity &&
        other.id == id &&
        other.categoryName == categoryName &&
        listEquals(other.availableDates, availableDates) &&
        other.nameRu == nameRu &&
        other.nameEn == nameEn &&
        other.nameKk == nameKk &&
        other.imageUrl == imageUrl &&
        other.code == code &&
        other.enabled == enabled &&
        other.dateRequired == dateRequired &&
        other.skiPassRequired == skiPassRequired &&
        other.description == description &&
        other.workingHours == workingHours &&
        listEquals(other.tariffs, tariffs) &&
        other.createdDate == createdDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryName.hashCode ^
        availableDates.hashCode ^
        nameRu.hashCode ^
        nameEn.hashCode ^
        nameKk.hashCode ^
        imageUrl.hashCode ^
        code.hashCode ^
        enabled.hashCode ^
        dateRequired.hashCode ^
        skiPassRequired.hashCode ^
        description.hashCode ^
        workingHours.hashCode ^
        tariffs.hashCode ^
        createdDate.hashCode;
  }
}
