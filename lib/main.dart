import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_store/widgets/bottm_bar.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MaterialApp(home: Home(),debugShowCheckedModeBanner: false,),
    ),
  );
}
