import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagramm_clone/view/widgets/posts.dart';
import 'package:instagramm_clone/view/widgets/stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: SvgPicture.asset(
          "assets/svg/Instagram_logo.svg",
          width: 120,
        ),
        actions: [
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  shadowColor: Colors.transparent),
              child: SvgPicture.asset("assets/svg/messenger.svg")),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Stories()),
              Expanded(
                flex: 6,
                child: Posts()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/home.svg"), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/search.svg"), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/addPost.svg"), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/like.svg"), label: ""),
          BottomNavigationBarItem(
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/user.jpg"),
                ),
              ),
              label: ""),
        ],
      ),
    );
  }
}
