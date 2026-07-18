import 'package:flutter/material.dart';
import '../config/theme/CinephileTheme.dart';
import '../widgets/CustomBottomNav.dart';
import '../widgets/CustomSliverAppBar.dart';
import 'InfoScreen.dart';
import 'package:provider/provider.dart';
import '../providers/MovieProvider.dart';
import '../models/Movie.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({super.key});

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        context.read<MovieProvider>().getPopularMovies();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildExploreView(),
          const InfoScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildExploreView() {
    final provider = context.watch<MovieProvider>();

    if (provider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFFE11D48)),
      );
    }

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const CustomSliverAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 0.65,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final movie = provider.popularMovies[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/details', arguments: movie);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: movie.posterPath != null
                          ? Image.network(
                              movie.posterPath!,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.movie, size: 50, color: Colors.white24),
                    ),
                  ),
                );
              },
              childCount: provider.popularMovies.length,
            ),
          ),
        ),
        if (provider.isFetchingMore)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: CircularProgressIndicator(color: Color(0xFFE11D48)),
              ),
            ),
          ),
      ],
    );
  }


}
