import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nba_highlights/features/details/data/models/highlight_model.dart';

class ApiService {
  static const String _baseUrl = 'https://nba-ncaab-api.p.rapidapi.com';
  static const String _apiKey = 'feb088cc21msh8c56520ae329969p1c1d3cjsn9c6de8bf7bbd';
  static const String _apiHost = 'nba-ncaab-api.p.rapidapi.com';

  static final Map<String, String> _headers = {
    'x-rapidapi-host': _apiHost,
    'x-rapidapi-key': _apiKey,
  };

  Future<HighlightResponse> getHighlight(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/highlights/$id'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return HighlightResponse.fromJson(data);
      } else {
        throw Exception('Failed to load highlight: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load highlight: $e');
    }
  }

  Future<HighlightResponse> getGameHighlights() async {
    return HighlightResponse(
      success: true,
      message: 'Success',
      highlights: [
        Highlight(
          id: 'gh1',
          title: 'Lakers vs Warriors Highlights',
          description: 'Full game highlights from the latest Lakers vs Warriors matchup',
          videoUrl: 'https://example.com/video1',
          thumbnailUrl: 'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=800',
          date: '2023-12-25',
          duration: '9:30',
          views: '2.5M',
          tags: ['Lakers', 'Warriors', 'NBA', 'Game Highlights'],
        ),
        Highlight(
          id: 'gh2',
          title: 'Celtics vs Bucks Game Recap',
          description: 'Best moments from the Celtics vs Bucks thriller',
          videoUrl: 'https://example.com/video2',
          thumbnailUrl: 'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=800',
          date: '2023-12-24',
          duration: '8:15',
          views: '1.8M',
          tags: ['Celtics', 'Bucks', 'NBA', 'Game Highlights'],
        ),
        Highlight(
          id: 'gh3',
          title: 'Heat vs Nuggets Highlights',
          description: 'Complete highlights from Heat vs Nuggets showdown',
          videoUrl: 'https://example.com/video3',
          thumbnailUrl: 'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=800',
          date: '2023-12-23',
          duration: '10:00',
          views: '1.5M',
          tags: ['Heat', 'Nuggets', 'NBA', 'Game Highlights'],
        ),
      ],
    );
  }

  Future<HighlightResponse> getPlayerHighlights() async {
    return HighlightResponse(
      success: true,
      message: 'Success',
      highlights: [
        Highlight(
          id: 'ph1',
          title: 'LeBron James Career Highlights',
          description: 'Best plays from LeBron\'s illustrious career',
          videoUrl: 'https://example.com/video1',
          thumbnailUrl: 'https://images.unsplash.com/photo-1504450758481-7338eba7524a?w=800',
          date: '2023-12-25',
          duration: '10:30',
          views: '1.2M',
          tags: ['LeBron James', 'Career Highlights', 'NBA'],
        ),
        Highlight(
          id: 'ph2',
          title: 'Stephen Curry 3-Point Collection',
          description: 'Amazing three-pointers from the greatest shooter',
          videoUrl: 'https://example.com/video2',
          thumbnailUrl: 'https://images.unsplash.com/photo-1504450758481-7338eba7524a?w=800',
          date: '2023-12-24',
          duration: '8:45',
          views: '980K',
          tags: ['Stephen Curry', 'Three Pointers', 'NBA'],
        ),
      ],
    );
  }

  Future<HighlightResponse> getDunkContestHighlights() async {
    return HighlightResponse(
      success: true,
      message: 'Success',
      highlights: [
        Highlight(
          id: 'dc1',
          title: '2023 NBA Slam Dunk Contest',
          description: 'Best dunks from the latest contest',
          videoUrl: 'https://example.com/video3',
          thumbnailUrl: 'https://images.unsplash.com/photo-1608245449230-4ac19066d2d0?w=800',
          date: '2023-02-19',
          duration: '12:00',
          views: '2.1M',
          tags: ['Slam Dunk', 'All-Star Weekend', 'NBA'],
        ),
        Highlight(
          id: 'dc2',
          title: 'Greatest Dunk Contest Moments',
          description: 'Historic dunks that changed the game',
          videoUrl: 'https://example.com/video4',
          thumbnailUrl: 'https://images.unsplash.com/photo-1608245449230-4ac19066d2d0?w=800',
          date: '2023-02-18',
          duration: '15:20',
          views: '1.8M',
          tags: ['Classic Dunks', 'NBA History', 'Slam Dunk'],
        ),
      ],
    );
  }

  Future<HighlightResponse> getClassicGamesHighlights() async {
    return HighlightResponse(
      success: true,
      message: 'Success',
      highlights: [
        Highlight(
          id: 'cg1',
          title: 'Bulls vs Jazz 1998 Finals Game 6',
          description: 'Jordan\'s last shot as a Bull',
          videoUrl: 'https://example.com/video5',
          thumbnailUrl: 'https://images.unsplash.com/photo-1518063319789-7217e6706b04?w=800',
          date: '1998-06-14',
          duration: '20:00',
          views: '5.2M',
          tags: ['Michael Jordan', 'NBA Finals', 'Classic'],
        ),
        Highlight(
          id: 'cg2',
          title: 'Lakers vs Celtics 1984 Finals Game 7',
          description: 'The greatest rivalry in NBA history',
          videoUrl: 'https://example.com/video6',
          thumbnailUrl: 'https://images.unsplash.com/photo-1518063319789-7217e6706b04?w=800',
          date: '1984-06-12',
          duration: '18:30',
          views: '3.1M',
          tags: ['Lakers', 'Celtics', 'NBA Finals', 'Classic'],
        ),
      ],
    );
  }

  Future<HighlightResponse> getAllHighlights() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/highlights'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return HighlightResponse.fromJson(data);
      } else {
        throw Exception('Failed to load highlights: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load highlights: $e');
    }
  }
}
