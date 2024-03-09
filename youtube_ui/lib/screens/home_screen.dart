import 'package:flutter/material.dart';
import 'package:youtube_ui/data.dart';
import 'package:youtube_ui/widgets/custom_video-card.dart';
import 'package:youtube_ui/widgets/custom_widget_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomWidgetAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final video = videos[index];
                    return VideoCard(video: video);
                  },
              childCount: videos.length
            ),
          ),
        ],
      ),
    );
  }
}

