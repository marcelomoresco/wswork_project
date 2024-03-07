// ignore_for_file: public_member_api_docs, sort_constructors_first

class Lead {
  final String deviceId;
  final String brand;
  final String deviceModel;
  final String deviceVersion;
  final int? createadAt;
  final int carId;

  Lead({
    required this.deviceId,
    required this.brand,
    required this.deviceModel,
    required this.deviceVersion,
    this.createadAt,
    required this.carId,
  });

  Lead copyWith({
    String? deviceId,
    String? brand,
    String? deviceModel,
    String? deviceVersion,
    int? createadAt,
    int? carId,
  }) {
    return Lead(
      deviceId: deviceId ?? this.deviceId,
      brand: brand ?? this.brand,
      deviceModel: deviceModel ?? this.deviceModel,
      deviceVersion: deviceVersion ?? this.deviceVersion,
      createadAt: createadAt ?? this.createadAt,
      carId: carId ?? this.carId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deviceId': deviceId,
      'brand': brand,
      'deviceModel': deviceModel,
      'deviceVersion': deviceVersion,
      'created_at': DateTime.now().microsecondsSinceEpoch,
      'car_id': carId,
    };
  }

  factory Lead.fromMap(Map<String, dynamic> map) {
    return Lead(
      deviceId: map['deviceId'] as String,
      brand: map['brand'] as String,
      deviceModel: map['deviceModel'] as String,
      deviceVersion: map['deviceVersion'] as String,
      createadAt: map['created_at'] as int,
      carId: map['car_id'] as int,
    );
  }

  @override
  bool operator ==(covariant Lead other) {
    if (identical(this, other)) return true;

    return other.deviceId == deviceId &&
        other.brand == brand &&
        other.deviceModel == deviceModel &&
        other.deviceVersion == deviceVersion &&
        other.createadAt == createadAt &&
        other.carId == carId;
  }

  @override
  int get hashCode {
    return deviceId.hashCode ^
        brand.hashCode ^
        deviceModel.hashCode ^
        deviceVersion.hashCode ^
        createadAt.hashCode ^
        carId.hashCode;
  }
}
