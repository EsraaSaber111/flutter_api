import 'package:flutter/material.dart';
import 'package:flutter_api/Servics/Api.dart';
import 'package:flutter_api/post_model.dart';
import 'package:flutter_api/provider/provider_control.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<Provider_control>(
      create: (_) => Provider_control(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider_control>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: provider.Primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> _posts;
  Color col = Colors.black87;
  @override
  void initState() {
    get_post();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider_control>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('demo Control'),
      ),
      body: _posts == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  FlatButton(
                      onPressed: () {
                        provider.setColor(Colors.orange);
                      },
                      child: Text('demo2')),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text(_posts[index].title));
                      }),
                ],
              ),
            ),
    );
  }

  get_post() {
    Api().get('posts').then((value) {
      _posts = [];
      value.forEach((item) {
        setState(() {
          _posts.add(Post.fromJson(item));
        });
      });
    });
    Api().post('posts', {"userId": 1}).then((value) {
      _posts = [];
      value.forEach((item) {
        setState(() {
          _posts.add(Post.fromJson(item));
        });
      });
    });
  }
}
