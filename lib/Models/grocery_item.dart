import "package:flutter/painting.dart";

enum Importance { low, medium, high }

class GroceryItem {
  final String id;
  final String nama;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime date;
  final bool isComplete;

  GroceryItem(
      {required this.id,
      required this.nama,
      required this.importance,
      required this.color,
      required this.quantity,
      required this.date,
      required this.isComplete});

  GroceryItem copyWith(
      {required String id,
      required String nama,
      required Importance importance,
      required Color color,
      required int quantity,
      required DateTime date,
      required bool isComplete}) {
    return GroceryItem(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        importance: importance ?? this.importance,
        color: color ?? this.color,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
        isComplete: isComplete ?? this.isComplete);
  }
}
