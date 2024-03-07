import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:wswork_project/src/app/cars/domain/entities/car.dart';
import 'package:wswork_project/src/app/cars/domain/entities/lead.dart';
import 'package:wswork_project/src/app/cars/domain/repositories/lead_repository.dart';
import 'package:wswork_project/src/core/db/const/sqflite_const.dart';
import 'package:wswork_project/src/core/db/sqflite_helper.dart';

class LeadRepositoryImpl implements LeadRepository {
  @override
  Future<List<Lead>> getAllLeads() async {
    final db = await DatabaseHelper.instance.db;
    final results = await db.query(SqfliteConstants.leadTable);
    List<Lead> leads = results.map((map) => Lead.fromMap(map)).toList();
    return leads;
  }

  @override
  Future<void> insertLead(Car car) async {
    final leads = await getAllLeads();
    bool hasIdInLeads =
        leads.where((element) => element.carId == car.id).isNotEmpty;
    if (hasIdInLeads) return;

    late Lead lead;
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      lead = Lead(
        carId: car.id,
        deviceId: androidInfo.id,
        deviceModel: androidInfo.model,
        deviceVersion: androidInfo.version.codename,
        brand: androidInfo.brand,
      );
    } else if (Platform.isIOS) {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      lead = Lead(
        carId: car.id,
        deviceId: iosInfo.identifierForVendor ?? '',
        deviceModel: iosInfo.model,
        deviceVersion: iosInfo.systemVersion,
        brand: iosInfo.name,
      );
    }
    final db = await DatabaseHelper.instance.db;
    db.insert(SqfliteConstants.leadTable, lead.toMap());
    await DatabaseHelper.instance.closeConnection();
  }

  @override
  Future<void> deleteAll() async {
    final db = await DatabaseHelper.instance.db;
    await db.rawDelete('DELETE FROM ${SqfliteConstants.leadTable}');
  }
}
