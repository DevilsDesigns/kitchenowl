import 'package:kitchenowl/models/item.dart';
import 'package:kitchenowl/models/model.dart';

class Shoppinglist extends Model {
  final int id;
  final String name;
  final List<Item> items;

  const Shoppinglist({this.id, this.name, this.items = const []});

  factory Shoppinglist.fromJson(Map<String, dynamic> map) => Shoppinglist(
        id: map['id'],
        name: map['name'],
      );

  @override
  List<Object> get props => [this.id, this.name];

  @override
  Map<String, dynamic> toJson() => {
        "id": this.id,
        "name": this.id,
      };
}
