import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  void getPath() async {
    Directory tempDir = await getApplicationDocumentsDirectory();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
