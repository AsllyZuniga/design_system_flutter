import 'package:flutter/material.dart';

class CustomFavorite extends StatefulWidget {
  final bool value;

  const CustomFavorite({
 super.key, required this.value,
  });

  @override
  _CustomFavoriteState createState() => _CustomFavoriteState();
}

class _CustomFavoriteState extends State<CustomFavorite> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.value;
  }

  @override
  void didUpdateWidget(covariant CustomFavorite oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isFavorite = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.star : Icons.star_border,
        color: _isFavorite ? Colors.blue : Colors.grey,
      ),
      onPressed: _toggleFavorite,
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }
}
