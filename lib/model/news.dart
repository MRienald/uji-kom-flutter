class News {
    final DateTime? createdAt;
    final String? title;
    final String? author;
    final String? description;
    final String? urlNews;
    final String? urlImage;
    final String? id;

    News({
        this.createdAt,
        this.title,
        this.author,
        this.description,
        this.urlNews,
        this.urlImage,
        this.id,
    });

    factory News.fromJson(Map<String, dynamic> json) => News(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        title: json["title"],
        author: json["author"],
        description: json["description"],
        urlNews: json["url_news"],
        urlImage: json["url_image"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "title": title,
        "author": author,
        "description": description,
        "url_news": urlNews,
        "url_image": urlImage,
        "id": id,
    };
}