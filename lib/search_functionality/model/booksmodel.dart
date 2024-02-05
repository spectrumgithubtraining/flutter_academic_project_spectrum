class BooksModel {
  String bookName;
  String authorName;
  String publishedDate;
  String description;

  BooksModel({
    required this.bookName,
    required this.authorName,
    required this.publishedDate,
    required this.description,
  });

  // Deserialize from JSON
  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      bookName: json['bookName'] ?? '',
      authorName: json['authorName'] ?? '',
      publishedDate: json['publishedDate'] ?? '',
      description: json['description'] ?? '',
    );
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'bookName': bookName,
      'authorName': authorName,
      'publishedDate': publishedDate,
      'description': description,
    };
  }
}
