class Ingredient {
  final String name;
  final String quantity;
  Ingredient({required this.name, required this.quantity});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(name: json['name'], quantity: json['quantity']);
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'quantity': quantity};
  }
}
