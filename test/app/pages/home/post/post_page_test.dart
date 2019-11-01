import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:afsesab/app/pages/home/post/post_page.dart';

main() {
  testWidgets('PostPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PostPage(title: 'Post')));
    final titleFinder = find.text('Post');
    expect(titleFinder, findsOneWidget);
  });
}
