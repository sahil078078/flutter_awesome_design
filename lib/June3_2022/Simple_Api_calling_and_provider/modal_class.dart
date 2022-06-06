class ModalClass {
  final int status;
  final String message;

  List<Data> data;

  ModalClass({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ModalClass.fromJson(Map<String, dynamic> json) {
    return ModalClass(
      status: json['status'],
      message: json['message'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))).toList(),
    );
  }
}

class Data {
  final String id, title;
  final int price;
  final String? description; // risky
  final String createdAt, updatedAt, slug;
  final String image;
  final Category category;
  final CrearedBy createdBy;

  Data({
    required this.id,
    required this.title,
    required this.price,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    required this.image,
    required this.category,
    required this.createdBy,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      title: json['title'],
      price: json['price'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      slug: json['slug'],
      image: json['image'].toString(),
      description: json['description'],
      category: Category.fromJson(json['category']),
      createdBy: CrearedBy.fromJson(json['createdBy']),
    );
  }
}

class Category {
  final String id, name, slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

class CrearedBy {
  final String role, id, name;

  CrearedBy({
    required this.role,
    required this.name,
    required this.id,
  });

  factory CrearedBy.fromJson(Map<String, dynamic> json) {
    return CrearedBy(
      role: json['role'],
      name: json['name'],
      id: json['_id'],
    );
  }
}
