// lib/model/counter_model.dart
class CounterModel {
  final int count;
  final String? note;
  final DateTime lastUpdated;
  final bool isMock;

  CounterModel({
    this.count = 0,
    this.note,
    DateTime? lastUpdated,
    this.isMock = false,
  }) : lastUpdated = lastUpdated ?? DateTime.now();

  CounterModel copyWith({
    int? count,
    String? note,
    DateTime? lastUpdated,
    bool? isMock,
  }) {
    return CounterModel(
      count: count ?? this.count,
      note: note ?? this.note,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      isMock: isMock ?? this.isMock,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'note': note,
      'lastUpdated': lastUpdated.toIso8601String(),
      'isMock': isMock,
    };
  }

  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(
      count: json['count'] ?? 0,
      note: json['note'],
      lastUpdated: json['lastUpdated'] != null 
          ? DateTime.parse(json['lastUpdated'])
          : DateTime.now(),
      isMock: json['isMock'] ?? false,
    );
  }
}