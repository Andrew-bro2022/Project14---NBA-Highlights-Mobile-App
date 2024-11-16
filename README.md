# NBA Highlights Mobile App

A Flutter mobile application that showcases NBA game highlights, player highlights, dunk contests, and classic games.

## Setup Process

1. **Prerequisites**
   - Flutter SDK (latest version)
   - Dart SDK
   - Android Studio / Xcode
   - A code editor (VS Code recommended)

2. **Installation**
   ```bash
   # Clone the repository
   git clone [repository-url]

   # Navigate to project directory
   cd nba_highlights

   # Install dependencies
   flutter pub get

   # Run the app
   flutter run
   ```

## Libraries Used

1. **HTTP Client**
   - `http`: For making API requests to fetch highlight data
   - Used for communication with the NBA highlights API

2. **State Management & Navigation**
   - `go_router`: For handling navigation between screens
   - Provides a clean, URL-based navigation system

3. **UI Components & Styling**
   - `shimmer`: For loading state animations
   - `cached_network_image`: For efficient image loading and caching
   - Improves user experience with smooth loading states and image handling

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── services/
│   ├── theme/
│   └── utils/
├── features/
│   ├── details/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── home/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── splash/
└── main.dart
```

- **Core**: Contains application-wide utilities, services, and constants
- **Features**: Organized by feature modules following clean architecture principles
  - Each feature has its own data, domain, and presentation layers

## Key Features

1. **Home Screen**
   - Displays different categories of NBA highlights
   - Clean grid layout with category cards
   - Smooth navigation to detail pages
<img src="https://github.com/user-attachments/assets/f8930087-b682-459e-8a2f-b0eeb59c8540" alt="IMG_7029" width="20%">
<img src="https://github.com/user-attachments/assets/807df89f-7f3c-45eb-bd7d-ec24977ca9c3" alt="IMG_7029" width="20%">


<img src="https://github.com/user-attachments/assets/37f8d169-c76c-4261-a8ae-27b82e2ff206" alt="IMG_7029" width="20%">
<img src="https://github.com/user-attachments/assets/52cce689-8b14-4558-9ff3-0d4ab971bf37" alt="IMG_7029" width="20%">



2. **Details Screen**
   - Shows list of highlights for selected category
   - Video thumbnail with play button
   - Detailed information including duration and views
   - Tag system for better content organization
<img src="https://github.com/user-attachments/assets/817c7b14-7f7b-41ee-8a1a-1586d436ea79" alt="IMG_7029" width="20%">
<img src="https://github.com/user-attachments/assets/75b69031-f942-4005-829b-07b58b90003c" alt="IMG_7029" width="20%">
<img src="https://github.com/user-attachments/assets/7f87f2f7-1242-43be-af25-2d354b4454e6" alt="IMG_7029" width="20%">
<img src="https://github.com/user-attachments/assets/e3695a6b-c3cd-4346-b28c-640701f2f19d" alt="IMG_7029" width="20%">
<img src="https://github.com/user-attachments/assets/25e7ea2f-6b45-4fa3-929d-2c59975445e7" alt="IMG_7029" width="20%">



## Development Challenges & Solutions

1. **API Integration Challenges**
   - **Challenge**: The NBA highlights API endpoints were not consistently available
   - **Solution**: Implemented mock data system to ensure consistent content display and testing
   - **Impact**: Enabled development to continue without API dependencies

2. **Category Navigation**
   - **Challenge**: Different types of highlights required different data handling approaches
   - **Solution**: Created a unified system that handles both individual highlights and category-based content
   - **Impact**: Seamless user experience across different content types

3. **Image Loading & Performance**
   - **Challenge**: Loading high-quality images while maintaining performance
   - **Solution**: Implemented CachedNetworkImage with shimmer loading effects
   - **Impact**: Smooth image loading with fallback states

4. **State Management**
   - **Challenge**: Managing loading, error, and success states across screens
   - **Solution**: Implemented robust error handling and loading states
   - **Impact**: Better user feedback and error recovery

## Future Improvements

1. **Video Playback**
   - Implement actual video playback functionality
   - Add support for different video quality options

2. **Offline Support**
   - Add local caching for recently viewed highlights
   - Implement offline mode for saved content

3. **User Features**
   - Add user authentication
   - Implement favorites and watch later lists
   - Add social sharing capabilities

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
