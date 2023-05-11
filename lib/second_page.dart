import 'package:flutter/material.dart';
import 'package:flutter310demo/model/second_page_model.dart';
import 'package:flutter310demo/view_model/second_page_view_model.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SecondPageViewModel(),
        ),
      ],
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: SecondPageViewModel.of(context).getListData().length,
              itemBuilder: _buildItemView,
            );
          },
        ),
      ),
    );
  }

  Widget? _buildItemView(BuildContext context, int index) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.teal[100 * (index % 9)],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<SecondPageViewModel>(
            builder: (context, provider, child) {
              final model = provider.getListData()[index];
              return SecondPageItem(
                model: model,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}

class SecondPageItem extends StatelessWidget {
  const SecondPageItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SecondPageModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = SecondPageViewModel.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (model.isLike!) {
                      provider.dislikeById(index);
                    } else {
                      provider.likeById(index);
                    }
                  },
                  icon: Icon(
                    Icons.heart_broken,
                    color: model.isLike! ? Colors.red : Colors.grey,
                  ),
                ),
                Text('${model.likeNum}'),
                IconButton(
                  onPressed: () {
                    if (model.isUpvote!) {
                      provider.notUpvoteById(index);
                    } else {
                      provider.upvoteById(index);
                    }
                  },
                  icon: Icon(
                    Icons.thumb_up,
                    color: model.isUpvote! ? Colors.yellow : Colors.grey,
                  ),
                ),
                Text('${model.upvote}'),
                const SizedBox(height: 20),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text('@${model.title}'),
        const SizedBox(height: 20),
        Text(model.description!),
        const SizedBox(height: 50),
      ],
    );
  }
}
