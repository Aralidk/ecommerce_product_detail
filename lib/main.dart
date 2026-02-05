import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'core/network/shopify_client.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

