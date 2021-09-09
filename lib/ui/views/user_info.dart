import 'package:fitness_app_flutter/ui/views/dashboard.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  double? currentPage = 0.0;
  final _pageViewController = new PageController();

  List<Widget> indicator() => List<Widget>.generate(
        4,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          height: 6.0,
          width: 24.0,
          decoration: BoxDecoration(
            color: (currentPage?.round() ?? 0) >= index
                ? Color(0XFF256075)
                : Color(0XFF256075).withOpacity(0.2),
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageViewController,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                _pageViewController.addListener(() {
                  setState(() {
                    currentPage = _pageViewController.page;
                  });
                });
                return Center(child: Text('$index $currentPage'));
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 16.0),
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indicator(),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (currentPage == 3) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => DashBoard()));
                          return;
                        }
                        _pageViewController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text('Next step'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (currentPage == 0) {
                          Navigator.pop(context);
                          return;
                        }
                        _pageViewController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text('Previous Step'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
