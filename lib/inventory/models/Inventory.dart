// To parse this JSON data, do
//
//     final inventory = inventoryFromJson(jsonString);

import 'dart:convert';

List<Inventory> inventoryFromJson(String str) =>
    List<Inventory>.from(json.decode(str).map((x) => Inventory.fromJson(x)));

String inventoryToJson(List<Inventory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inventory {
  Inventory({
    required this.id,
    required this.description,
    required this.employee,
    required this.endDate,
    required this.insUser,
    required this.inventoryDate,
    required this.inventoryNumber,
    required this.inventoryStatusId,
    required this.isCanceled,
    required this.isClosed,
    required this.isOpen,
    required this.isStarted,
    required this.inventoryStatusName,
    required this.isSomeItemsBooked,
    required this.canDelete,
    required this.inventoryTeamId,
    required this.inventoryTeamName,
    required this.remarkEnd,
    required this.remarkStart,
    required this.startDate,
  });

  String id;
  String description;
  String employee;
  DateTime endDate;
  String insUser;
  DateTime inventoryDate;
  String inventoryNumber;
  String inventoryStatusId;
  String isCanceled;
  String isClosed;
  String isOpen;
  String isStarted;
  String inventoryStatusName;
  String isSomeItemsBooked;
  String canDelete;
  String inventoryTeamId;
  String inventoryTeamName;
  String remarkEnd;
  String remarkStart;
  DateTime startDate;

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        id: json["id"].toString(),
        description: json["description"],
        employee: json["employee"],
        endDate: DateTime.parse(json["end_date"]),
        insUser: json["ins_user"],
        inventoryDate: DateTime.parse(json["inventory_date"]),
        inventoryNumber: json["inventory_number"],
        inventoryStatusId: json["inventory_status_id"],
        isCanceled: json["is_canceled"],
        isClosed: json["is_closed"],
        isOpen: json["is_open"],
        isStarted: json["is_started"],
        inventoryStatusName: json["inventory_status_name"],
        isSomeItemsBooked: json["is_some_items_booked"],
        canDelete: json["can_delete"],
        inventoryTeamId: json["inventory_team_id"],
        inventoryTeamName: json["inventory_team_name"],
        remarkEnd: json["remark_end"],
        remarkStart: json["remark_start"],
        startDate: DateTime.parse(json["start_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "employee": employee,
        "end_date": endDate.toIso8601String(),
        "ins_user": insUser,
        "inventory_date": inventoryDate.toIso8601String(),
        "inventory_number": inventoryNumber,
        "inventory_status_id": inventoryStatusId,
        "is_canceled": isCanceled,
        "is_closed": isClosed,
        "is_open": isOpen,
        "is_started": isStarted,
        "inventory_status_name": inventoryStatusName,
        "is_some_items_booked": isSomeItemsBooked,
        "can_delete": canDelete,
        "inventory_team_id": inventoryTeamId,
        "inventory_team_name": inventoryTeamName,
        "remark_end": remarkEnd,
        "remark_start": remarkStart,
        "start_date": startDate.toIso8601String(),
      };
}
