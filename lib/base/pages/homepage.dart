import 'package:ambar_teste/base/controllers/home_controller.dart';
import 'package:ambar_teste/utils/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _success() {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        var repositories = controller.repositories[index];
        return GestureDetector(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(repositories.owner.avatarUrl),
            ),
            title: Text(
              repositories.name,
              style: TextStyle(
                  color: MyColors.myDefaultPink, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(repositories.owner.login),
            trailing: Icon(
              Icons.add,
              color: MyColors.myDefaultPink,
            ),
          ),
          onTap: () async {
            var url = repositories.htmlUrl;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw "Algo inesperado aconteceu";
            }
          },
        );
      },
    );
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start();
        },
        color: MyColors.myDefaultPink,
        child: Text("Tentar novamente"),
        textColor: Colors.white,
      ),
    );
  }

  _loading() {
    return Center(
        child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(MyColors.myDefaultPink),
    ));
  }

  _start() {
    return Container();
  }

  stateManegement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _error();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Os 100 primeiros githubbers"),
        backgroundColor: MyColors.myDefaultPink,
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManegement(controller.state.value);
        },
      ),
    );
  }
}
