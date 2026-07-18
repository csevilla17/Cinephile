import 'package:flutter/material.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({super.key});

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const slateGray = Color(0xFF94A3B8);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildExploreView(),
          _buildProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: slateGray,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _buildExploreView() {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            'Explorar',
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          floating: true,
          backgroundColor: colorScheme.surface,
          elevation: 0,
        ),
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
