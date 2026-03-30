import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';

class SuccessScreen extends StatefulWidget {
  final String fullName;

  const SuccessScreen({super.key, required this.fullName});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late final ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 4),
    )..play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A1B9A), Color(0xFFAB47BC), Color(0xFFCE93D8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 18,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.emoji_events_rounded,
                        size: 88,
                        color: Color(0xFF8E24AA),
                      ),
                      const SizedBox(height: 16),
                      AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'You made it!',
                            textStyle: theme.textTheme.headlineMedium?.copyWith(
                              color: const Color(0xFF4A148C),
                              fontWeight: FontWeight.w700,
                            ),
                            speed: const Duration(milliseconds: 70),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Account created successfully for',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.fullName,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: const Color(0xFF6A1B9A),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Welcome to the community Champ!',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              emissionFrequency: 0.03,
              numberOfParticles: 30,
              gravity: 0.2,
              colors: const [
                Color(0xFF6A1B9A),
                Color(0xFFAB47BC),
                Color(0xFFCE93D8),
                Color(0xFFF06292),
                Color(0xFFFFD54F),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
