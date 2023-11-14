import 'package:flutter/material.dart';

class NetworkImageCard extends StatelessWidget {
  final double height;
  final double width;
  final String? imageUrl;
  final BoxFit? fit;
  final double borderRadius;
  final VoidCallback? onTap;

  const NetworkImageCard(
      {Key? key,
      this.height = 228,
      this.width = 150,
      this.imageUrl,
      this.fit,
      this.borderRadius = 10,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.black54,
        ),
        child: Stack(
          children: [
            if (imageUrl != null)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (imageUrl != null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: fit,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
