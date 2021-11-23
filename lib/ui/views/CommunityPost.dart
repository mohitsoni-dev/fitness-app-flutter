import 'package:fitness_app_flutter/core/api_response.dart';
import 'package:fitness_app_flutter/core/blocs/community_bloc.dart';
import 'package:fitness_app_flutter/core/models/question.dart';
import 'package:fitness_app_flutter/ui/widget/CommunityPostWidgets.dart';
import 'package:fitness_app_flutter/ui/widget/ask_question_pop_up.dart';
import 'package:fitness_app_flutter/ui/widget/pop_up_screen_helper.dart';
import 'package:flutter/material.dart';

class CommunityPost extends StatefulWidget {
  const CommunityPost({Key? key}) : super(key: key);

  @override
  _CommunityPostState createState() => _CommunityPostState();
}

class _CommunityPostState extends State<CommunityPost> {
  CommunityBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CommunityBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          textFieldView(context), //todo search bar algorithm to made
          Expanded(
            child: SingleChildScrollView(
                child: RefreshIndicator(
              onRefresh: () => _bloc?.fetchQuestionList(),
              child: StreamBuilder<ApiResponse<List<Question>>>(
                stream: _bloc?.questionListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data?.status) {
                      case Status.LOADING:
                        return Center(child: CircularProgressIndicator());
                      case Status.COMPLETED:
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.data?.length,
                          itemBuilder: (BuildContext ctxt, int index) =>
                              PostOfCommunity(
                                  question: snapshot.data?.data?[index]),
                        );
                      default:
                        return Text('No Internet Connection');
                    }
                  } else
                    return Container();
                },
              ),
            )),
          )
        ],
      ),
      floatingActionButton: Align(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(HeroDialogRoute(builder: (context) {
              return AskQuestion(onSubmit: _bloc?.postQuestion);
            }));
          },
          child: Icon(Icons.add),
        ),
        alignment: Alignment(1, 0.75),
      ),
    );
  }
}
