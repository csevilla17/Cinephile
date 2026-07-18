import 'package:flutter/material.dart';

class InfoScreenDev extends StatelessWidget {
  const InfoScreenDev({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const slateGray = Color(0xFF94A3B8);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFF8FAFC)),
        title: Text(
          'Acerca de',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xFFF8FAFC),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.movie_creation_rounded,
                size: 80,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'Cinephile.',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF8FAFC),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Versión 1.0.0',
                style: textTheme.bodyMedium?.copyWith(
                  color: slateGray,
                ),
              ),
              const SizedBox(height: 48),
              Text(
                'DESARROLLADO CON ♥ POR:',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                'César Sevilla',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF8FAFC),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '&',
                style: textTheme.titleMedium?.copyWith(
                  color: slateGray,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Luis Zambrano',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF8FAFC),
                ),
              ),
              const SizedBox(height: 48),
              Text(
                'Gracias por disfrutar de la magia del séptimo arte con nosotros.',
                style: textTheme.bodyMedium?.copyWith(
                  color: slateGray,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
