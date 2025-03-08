class CategoriesModel {
  int? status;
  int? categoriesCount;
  List<EachCategory>? categories;

  CategoriesModel({
    this.status,
    this.categoriesCount,
    this.categories,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        status: json["status"],
        categoriesCount: json["categories_count"],
        categories: json["categories"] == null
            ? []
            : List<EachCategory>.from(
                json["categories"]!.map((x) => EachCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "categories_count": categoriesCount,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class EachCategory {
  int? id;
  String? title;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;

  EachCategory({
    this.id,
    this.title,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory EachCategory.fromJson(Map<String, dynamic> json) => EachCategory(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
