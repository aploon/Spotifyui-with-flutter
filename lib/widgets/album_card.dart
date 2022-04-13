import 'package:flutter/material.dart';
import 'package:spotify_clone/views/album_view.dart';

class AlbumCard extends StatelessWidget {
  final Image? image;
  final String? label;
  final Function? onTap;
  final double size;
  const AlbumCard({
    Key? key,
    this.image,
    this.label,
    this.onTap,
    this.size = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              image: image,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
        child: Container(
          width: size,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image!,
              SizedBox(height: 10),
              Text(
                label!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
