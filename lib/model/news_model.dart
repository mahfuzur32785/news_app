class NewsModel {
  final String? image;
  final String? title;
  final String? desc;
  final String? postedBy;
  final DateTime? postedDate;
  final String? sourceName;

  NewsModel({
    this.image,
    this.title,
    this.desc,
    this.postedBy,
    this.postedDate,
    this.sourceName,
  });

  // CopyWith method to create a copy with modified values
  NewsModel copyWith({
    String? image,
    String? title,
    String? desc,
    String? postedBy,
    DateTime? postedDate,
    String? sourceName,
  }) {
    return NewsModel(
      image: image ?? this.image,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      postedBy: postedBy ?? this.postedBy,
      postedDate: postedDate ?? this.postedDate,
      sourceName: sourceName ?? this.sourceName,
    );
  }

  // Factory method to create a NewsModel from a JSON map
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      image: json['image'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      postedBy: json['posted_by'] as String?,
      postedDate: json['posted_date'] != null
          ? DateTime.parse(json['posted_date'] as String)
          : null,
      sourceName: json['source_name'] as String?,
    );
  }

  // Method to convert NewsModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'posted_by': postedBy,
      'posted_date': postedDate?.toIso8601String(),
      'source_name': sourceName,
    };
  }
}
