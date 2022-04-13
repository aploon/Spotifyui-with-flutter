import 'package:flutter/material.dart';
import 'package:spotify_clone/views/album_view.dart';

class SongCard extends StatelessWidget {
  final Image? image;

  const SongCard({
    Key? key,
    @required this.image,
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
          width: 140,
          child: Column(
            children: [
              image!,
              Text(
                "Bad Bunny, Drake, Justin Bieber, Taylor Swift, Ed Sheeran",
                style: Theme.of(context).textTheme.caption,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
