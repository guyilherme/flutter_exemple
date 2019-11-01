import 'package:afsesab/app/pages/home/post/post_bloc.dart';
import 'package:afsesab/app/app_module.dart';
import 'package:afsesab/app/pages/home/home_repository.dart';
import 'package:afsesab/app/pages/home/home_bloc.dart';
import 'package:afsesab/app/shared/custom_dio/custom_dio.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:afsesab/app/pages/home/home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PostBloc()),
        Bloc((i) => HomeBloc(HomeModule.to.getDependency<HomeRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency(
            (i) => HomeRepository(AppModule.to.getDependency<CustomDio>())),
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
