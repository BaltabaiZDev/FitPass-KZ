class Animal {
  final String? id;
  final String title;
  final String subtitle;
  final String description;
  final String image;

  Animal({
    this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
  });

  factory Animal.fromMap(String id, Map<String, dynamic> data) {
    return Animal(
      id: id,
      title: data["title"] ?? "Атауы жоқ",
      subtitle: data["subtitle"] ?? "",
      description: data["description"] ?? "",
      image: (data["image"] != null && data["image"] != "")
          ? data["image"]
          : "assets/wolf.png",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "subtitle": subtitle,
      "description": description,
      "image": image,
    };
  }
}
