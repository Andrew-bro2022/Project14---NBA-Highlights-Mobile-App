import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nba_highlights/core/services/api_service.dart';
import 'package:nba_highlights/features/home/presentation/widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ApiService _apiService;

  final List<Map<String, String>> categories = [
    {
      'id': '1361',
      'title': 'Game Highlights',
      'imageUrl': 'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=800',
      'description': 'Latest NBA game highlights and top plays',
    },
    {
      'id': '1362',
      'title': 'Player Highlights',
      'imageUrl': 'https://images.unsplash.com/photo-1504450758481-7338eba7524a?w=800',
      'description': 'Individual player performances and career highlights',
    },
    {
      'id': '1363',
      'title': 'Dunk Contest',
      'imageUrl': 'https://images.unsplash.com/photo-1608245449230-4ac19066d2d0?w=800',
      'description': 'Best moments from NBA Slam Dunk contests',
    },
    {
      'id': '1364',
      'title': 'Classic Games',
      'imageUrl': 'https://images.unsplash.com/photo-1518063319789-7217e6706b04?w=800',
      'description': 'Memorable moments from historic NBA games',
    },
  ];

  @override
  void initState() {
    super.initState();
    _apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NBA Highlights',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Watch the best NBA moments',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final category = categories[index];
                    return CategoryCard(
                      title: category['title'] ?? '',
                      imageUrl: category['imageUrl'] ?? '',
                      onTap: () => context.go('/details/${category['id']}'),
                    );
                  },
                  childCount: categories.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
