import 'package:flutter/material.dart';
import 'package:youtube_ui/data.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              video.thumbnailUrl,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                  color: Colors.black,
                  child: Text(
                    video.duration,
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        )
      ],
    );
  }
}
