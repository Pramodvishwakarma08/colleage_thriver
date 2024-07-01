// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:colleage_thriver/presentation/search/models/CollegeDetailListModel.dart';

class CompareWithSearchScreen extends StatefulWidget {
  Message ? cardmodel;
  CompareWithSearchScreen({Key? key,required this.cardmodel}) : super(key: key,);

  @override
  State<CompareWithSearchScreen> createState() => _CompareWithSearchScreenState();
}

class _CompareWithSearchScreenState extends State<CompareWithSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
