import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dog_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dogAsyncValue = ref.watch(dogProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Image'),
      ),
      body: Center(
        child: dogAsyncValue.when(
          data: (message) => Image.network(message),
          loading: () => CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Failed to load dog image'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.refresh(dogProvider),
        child: Icon(Icons.refresh),
      ),
    );
  }
}