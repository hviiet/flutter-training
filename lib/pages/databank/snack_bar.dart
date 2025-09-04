import 'dart:ui';
import 'package:flutter/material.dart';

class MySnackBar {
  static void show(BuildContext context) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(),
              ),
          ),
          Positioned(
            left: 12,
            right: 12,
            bottom: 20,
            child: _SnackBarContent(
              duration: const Duration(seconds: 3),
              onClose: () => entry.remove(),
            ),
          ),
        ],
      ),
    );

    overlay.insert(entry);
  }
}

class _SnackBarContent extends StatefulWidget {
  final Duration duration;
  final VoidCallback onClose;

  const _SnackBarContent({
    required this.duration,
    required this.onClose,
  });

  @override
  State<_SnackBarContent> createState() => _SnackBarContentState();
}

class _SnackBarContentState extends State<_SnackBarContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward().whenComplete(() => widget.onClose());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF00AE11),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 8),
                Text("Request Sent!", style: TextStyle(color: Colors.white)),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return CircularProgressIndicator(
                        value: 1 - _controller.value,
                        strokeWidth: 3,
                        backgroundColor: Colors.white24,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.white),
                      );
                    },
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close, color: Colors.white, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
