import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:afsesab/app/pages/home/post/post_bloc.dart';
import 'package:afsesab/app/pages/home/home_module.dart';

void main() {
  initModule(HomeModule());
  PostBloc bloc;

  setUp(() {
    bloc = HomeModule.to.bloc<PostBloc>();
  });

  group('PostBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<PostBloc>());
    });
  });
}
