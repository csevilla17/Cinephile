import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/Movie.dart';
import '../models/Actor.dart';
import '../providers/MovieProvider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            iconTheme: const IconThemeData(color: Color(0xFFF8FAFC)),
            backgroundColor: const Color(0xFF020617),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  movie.posterPath != null
                      ? Image.network(
                          movie.posterPath!,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: const Color(0xFF0F172A),
                          child: const Icon(Icons.movie, size: 100, color: Colors.white24),
                        ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xFF020617),
                        ],
                        stops: [0.4, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFF8FAFC),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F172A),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFE11D48),
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              movie.voteAverage.toStringAsFixed(1),
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFF8FAFC),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Sinopsis',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFF8FAFC),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    movie.overview.isEmpty ? 'Sinopsis no disponible' : movie.overview,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF94A3B8),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Reparto Principal',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFF8FAFC),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FutureBuilder<List<Actor>>(
                    future: Provider.of<MovieProvider>(context, listen: false).getMovieCast(movie.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(
                          height: 120,
                          child: Center(child: CircularProgressIndicator(color: Color(0xFFE11D48))),
                        );
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text('Reparto no disponible', style: GoogleFonts.inter(color: const Color(0xFF94A3B8)));
                      }

                      final cast = snapshot.data!;

                      return SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cast.length > 15 ? 15 : cast.length,
                          itemBuilder: (context, index) {
                            final actor = cast[index];

                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: const Color(0xFF0F172A),
                                    backgroundImage: actor.profilePath != null ? NetworkImage(actor.profilePath!) : null,
                                    child: actor.profilePath == null ? const Icon(Icons.person, size: 40, color: const Color(0xFF94A3B8)) : null,
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width: 70,
                                    child: Text(
                                      actor.name,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: const Color(0xFFF8FAFC),
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
