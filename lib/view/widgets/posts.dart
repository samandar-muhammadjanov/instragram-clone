import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagramm_clone/model/users.dart';

class Posts extends StatefulWidget {
  Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  var user = User.user;

  int currentPage = 0;

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: user.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(246, 30, 134, 1),
                        Color.fromRGBO(255, 153, 0, 1)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: FractionallySizedBox(
                  heightFactor: 0.9,
                  widthFactor: 0.9,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                          color: Colors.white, blurRadius: 0, spreadRadius: 1)
                    ], borderRadius: BorderRadius.circular(50)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        user[index]["image"],
                        width: 40,
                      ),
                    ),
                  ),
                ),
              ),
              title: Row(
                children: [
                  Text(user[index]["name"]),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    CupertinoIcons.checkmark_seal_fill,
                    color: Colors.blue,
                    size: 15,
                  )
                ],
              ),
              trailing: const Icon(
                Icons.more_vert_sharp,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 400,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Image.asset(
                    user[index]["image"],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.all(7),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset("assets/svg/like.svg")),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.all(7),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset("assets/svg/comment.svg")),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.all(7),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset("assets/svg/send.svg")),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => dots(index, context),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Container(
                  height: 25,
                  width: 25,
                  margin: const EdgeInsets.all(7),
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset("assets/svg/save.svg")),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Likes: 15 345",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            text: user[index]["name"],
                          ),
                          const TextSpan(text: " Commodo sit ut excepteur sint cillum nisi ad laboris laboris tempor aliqua ad laboris."),
                          const TextSpan(
                            text: "\n#movie #flutter #dart #android #instagram_clone")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget dots(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 250,
      ),
      margin: const EdgeInsets.only(right: 5),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color.fromRGBO(0, 153, 254, 1)
            : const Color.fromRGBO(222, 222, 222, 1),
        borderRadius: BorderRadius.circular(17),
      ),
    );
  }
}
