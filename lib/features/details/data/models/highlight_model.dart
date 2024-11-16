class Highlight {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final String thumbnailUrl;
  final String date;
  final String duration;
  final String views;
  final List<String> tags;

  Highlight({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.date,
    required this.duration,
    required this.views,
    required this.tags,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) {
    return Highlight(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      videoUrl: json['video_url']?.toString() ?? '',
      thumbnailUrl: json['thumbnail_url']?.toString() ?? '',
      date: json['date']?.toString() ?? '',
      duration: json['duration']?.toString() ?? '',
      views: json['views']?.toString() ?? '',
      tags: json['tags'] != null 
          ? List<String>.from(json['tags'])
          : [],
    );
  }
}

class HighlightResponse {
  final bool success;
  final String message;
  final List<Highlight> highlights;

  HighlightResponse({
    required this.success,
    required this.message,
    required this.highlights,
  });

  factory HighlightResponse.fromJson(List<dynamic> json) {
    return HighlightResponse(
      success: true,
      message: 'Success',
      highlights: json.map((item) => Highlight.fromJson(item)).toList(),
    );
  }
}
