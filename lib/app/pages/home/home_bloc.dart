import 'package:afsesab/app/models/PostModel.dart';
import 'package:afsesab/app/pages/home/home_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  final HomeRepository repo;

  HomeBloc(this.repo);

  var listPost = BehaviorSubject<List<PostModel>>();
  Sink<List<PostModel>> get responseIn => listPost.sink;
  Observable<List<PostModel>> get responseOut => listPost.stream;
  
  void getPosts() async{
    responseIn.add(null);
    try{
    var res = await repo.getPosts();
    responseIn.add(res);
    }catch(e){
      listPost.addError(e);
    }
  }

  @override
  void dispose() {
    listPost.close();
    super.dispose();
  }
}
