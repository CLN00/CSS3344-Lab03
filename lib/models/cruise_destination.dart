class CruiseDestination {
  final String name;
  final String location;
  final String imagePath;
  final String description;
  int ratingCount;
  bool isStarred;

  CruiseDestination({
    required this.name,
    required this.location,
    required this.imagePath,
    required this.description,
    this.ratingCount = 43,
    this.isStarred = true,
  });
}