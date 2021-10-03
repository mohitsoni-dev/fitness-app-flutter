import 'package:fitness_app_flutter/core/api_response.dart';
import 'package:fitness_app_flutter/core/blocs/explore_bloc.dart';
import 'package:fitness_app_flutter/core/models/article.dart';
import 'package:fitness_app_flutter/ui/widgets/explore_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  ExploreBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ExploreBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore more"),
        backgroundColor: Colors.black,
      ),
      body: RefreshIndicator(
        onRefresh: () => _bloc?.fetchArticleList(),
        child: StreamBuilder<ApiResponse<List<Article>>>(
          stream: _bloc?.movieListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data?.status) {
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator());
                case Status.COMPLETED:
                  return ListView.builder(
                    itemCount: snapshot.data?.data?.length,
                    itemBuilder: (BuildContext ctxt, int index) => feedSection(
                        context: context, article: snapshot.data?.data?[index]),
                  );
                default:
                  return Text('No Internet Connection');
              }
            } else
              return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }
}
