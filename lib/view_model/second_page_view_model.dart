import 'package:flutter/material.dart';
import 'package:flutter310demo/model/second_page_model.dart';
import 'package:provider/provider.dart';

class SecondPageViewModel extends ChangeNotifier {
  final List<SecondPageModel> _secondPageList = [];

  List<SecondPageModel> getListData() {
    if (_secondPageList.isEmpty) {
      for (int i = 0; i < 100; i++) {
        final model = SecondPageModel(
          id: i,
          isLike: false,
          likeNum: i,
          isUpvote: false,
          upvote: 99 - i,
          title: "我是第$i个数据的title",
          description: "我是第$i个数据的description",
        );
        _secondPageList.add(model);
      }
    }
    return _secondPageList;
  }

  void likeById(int index) {
    final model = _secondPageList.firstWhere((e) => e.id == index);
    model.isLike = true;
    model.likeNum = 1 + model.likeNum!;
    notifyListeners();
  }

  void dislikeById(int index) {
    final model = _secondPageList.firstWhere((e) => e.id == index);
    model.isLike = false;
    model.likeNum = model.likeNum! - 1;
    if (model.likeNum! < 0) {
      model.likeNum = 0;
    }
    notifyListeners();
  }

  void upvoteById(int index) {
    final model = _secondPageList.firstWhere((e) => e.id == index);
    model.isUpvote = true;
    model.upvote = 1 + model.upvote!;
    notifyListeners();
  }

  void notUpvoteById(int index) {
    final model = _secondPageList.firstWhere((e) => e.id == index);
    model.isUpvote = false;
    model.upvote = model.upvote! - 1;
    if (model.upvote! < 0) {
      model.upvote = 0;
    }
    notifyListeners();
  }

  static SecondPageViewModel of(BuildContext context, {bool listen = false}) =>
      Provider.of<SecondPageViewModel>(context, listen: listen);
}
