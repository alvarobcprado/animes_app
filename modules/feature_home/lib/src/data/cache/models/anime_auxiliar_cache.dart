class AnimeAuxiliarCache {
  AnimeAuxiliarCache(
    this.id,
    this.image,
    this.title,
    this.genres,
    this.release,
    this.totalEpisodes,
  );

  final int id;
  final String image;
  final String title;
  final List<String> genres;
  final String release;
  final int totalEpisodes;
}
