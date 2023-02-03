import 'dart:ffi';

import 'package:flutter/material.dart';

class Meditation {
  final String title;
  final String idName;
  final Bool isFree;
  final String description;
  final String synopsis;
  final String fileType;
  final Array tags;
  final Color themeColor;

  const Meditation({
    required this.title,
    required this.idName,
    required this.isFree,
    required this.description,
    required this.synopsis,
    required this.fileType,
    required this.tags,
    required this.themeColor,
  });
}
