import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_danelya9/presentation/blocs/bloc/bloc_bloc.dart';
import 'package:flutter_danelya9/presentation/blocs/bloc/bloc_state.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostCubit>(context);
    postBloc.fetchPosts();

    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state is PostError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is PostLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PostLoaded) {
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.posts[index].title),
                subtitle: Text('UserId: ${state.posts[index].userId}\n'
                    'Id: ${state.posts[index].id}\n'
                    '${state.posts[index].body}'),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
