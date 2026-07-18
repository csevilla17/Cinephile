import 'package:flutter/material.dart';
import '../widgets/CustomBottomNav.dart';
import '../widgets/CustomSliverAppBar.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({super.key});

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildExploreView(),
          _buildProfileView(),
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
    return CustomScrollView(
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
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileView() {
    final textTheme = Theme.of(context).textTheme;
    
    return Center(
      child: Text(
        'InfoScreen Placeholder',
        style: textTheme.bodyLarge?.copyWith(
          color: const Color(0xFFF8FAFC),
        ),
      ),
    );
  }
}
