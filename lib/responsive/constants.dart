import 'package:flutter/material.dart';
import 'package:picstagram/screens/feedScreen.dart';
import 'package:picstagram/screens/postScreen.dart';

const kWebScreenSize = 600;

const List<Widget> kTabBarItems = [
  PostFeedScreen(),
  Text('search'),
  AddPostScreen(),
  Text('notif'),
  Text('profile'),
];
