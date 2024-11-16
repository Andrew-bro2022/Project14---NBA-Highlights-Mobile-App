class Category {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  const Category({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

// Temporary mock data for testing
final List<Category> mockCategories = [
  Category(
    id: '1',
    title: 'Game Highlights',
    imageUrl: 'https://cdn.nba.com/manage/2024/02/GettyImages-2013486907-scaled-e1708487668571-784x441.jpg',
    description: 'Watch the best plays and moments from recent NBA games',
  ),
  Category(
    id: '2',
    title: 'Player Highlights',
    imageUrl: 'https://cdn.nba.com/manage/2024/02/lebron-james-iso-784x441.jpg',
    description: 'Individual player performances and career highlights',
  ),
  Category(
    id: '3',
    title: 'Dunk Contest',
    imageUrl: 'https://cdn.nba.com/manage/2024/02/mac-mcclung-trophy-784x441.jpg',
    description: 'Best moments from NBA Slam Dunk contests',
  ),
  Category(
    id: '4',
    title: 'Classic Games',
    imageUrl: 'https://cdn.nba.com/manage/2024/02/michael-jordan-1998-finals-784x441.jpg',
    description: 'Memorable moments from historic NBA games',
  ),
];
