import 'package:flutter/material.dart';
import 'package:picstagram/widgets/imageCard.dart';

class PostFeedScreen extends StatefulWidget {
  const PostFeedScreen({Key? key}) : super(key: key);

  @override
  State<PostFeedScreen> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryObject = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: false,
          title: Text(
            'Picstagram',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: mediaQueryObject.size.width * 0.075,
                ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message_outlined),
            ),
          ],
        ),
        body: const PostCard(),
      ),
    );
  }
}
