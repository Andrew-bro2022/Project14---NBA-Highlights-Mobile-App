import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nba_highlights/core/services/api_service.dart';
import 'package:nba_highlights/features/details/data/models/highlight_model.dart';

class DetailsScreen extends StatefulWidget {
  final String id;

  const DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final ApiService _apiService;
  late Future<HighlightResponse> _highlightFuture;
  String _categoryTitle = '';
  String _selectedCategoryId = '1361';

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
    _selectedCategoryId = widget.id;
    _loadHighlights();
  }

  void _loadHighlights() {
    switch (_selectedCategoryId) {
      case '1361':
        _categoryTitle = 'Game Highlights';
        _highlightFuture = _apiService.getGameHighlights();
        break;
      case '1362':
        _categoryTitle = 'Player Highlights';
        _highlightFuture = _apiService.getPlayerHighlights();
        break;
      case '1363':
        _categoryTitle = 'Dunk Contest';
        _highlightFuture = _apiService.getDunkContestHighlights();
        break;
      case '1364':
        _categoryTitle = 'Classic Games';
        _highlightFuture = _apiService.getClassicGamesHighlights();
        break;
      default:
        _categoryTitle = 'NBA Highlights';
        _highlightFuture = _apiService.getHighlight(_selectedCategoryId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _categoryTitle,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder<HighlightResponse>(
            future: _highlightFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildLoadingState();
              }

              if (snapshot.hasError) {
                return _buildErrorState('Failed to load highlights');
              }

              if (!snapshot.hasData || !snapshot.data!.success) {
                return _buildErrorState(snapshot.data?.message ?? 'No highlights available');
              }

              final highlights = snapshot.data!.highlights;
              if (highlights.isEmpty) {
                return _buildErrorState('No highlights found for this category');
              }

              return _buildHighlightsList(highlights);
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).primaryColor.withOpacity(0.2),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedCategoryId,
                        isExpanded: true,
                        underline: const SizedBox(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Theme.of(context).primaryColor,
                        ),
                        items: categories.map((category) {
                          return DropdownMenuItem(
                            value: category['id'],
                            child: Text(
                              category['title'] ?? '',
                              style: TextStyle(
                                color: _selectedCategoryId == category['id']
                                    ? Theme.of(context).primaryColor
                                    : Colors.black87,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (categoryId) {
                          if (categoryId != null && categoryId != _selectedCategoryId) {
                            setState(() {
                              _selectedCategoryId = categoryId;
                            });
                            context.go('/details/$categoryId');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(16),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 24,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sports_basketball,
              color: Colors.grey,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _loadHighlights();
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightsList(List<Highlight> highlights) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: highlights.length,
      itemBuilder: (context, index) {
        final highlight = highlights[index];
        return Card(
          margin: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: CachedNetworkImage(
                      imageUrl: highlight.thumbnailUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.sports_basketball,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Opening video...'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      highlight.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      highlight.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          highlight.duration,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.remove_red_eye,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${highlight.views} views',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                      ],
                    ),
                    if (highlight.tags.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: highlight.tags.map((tag) {
                          return Chip(
                            label: Text(
                              tag,
                              style: const TextStyle(fontSize: 12),
                            ),
                            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
