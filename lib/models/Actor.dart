class Actor {
  final int id;
  final String name;
  final String character;
  final String? profilePath;

  Actor({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['id'] as int,
      name: json['name'] ?? '',
      character: json['character'] ?? '',
      profilePath: json['profile_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${json['profile_path']}'
          : null,
    );
  }
}
