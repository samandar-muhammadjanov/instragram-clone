import 'package:flutter/material.dart';
import 'package:instagramm_clone/model/users.dart';

class Stories extends StatelessWidget {
  Stories({Key? key}) : super(key: key);
 
    var stories = User.user;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stories.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                width: 70,
                height: 70,
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
                          color: Colors.white, blurRadius: 0, spreadRadius: 2)
                    ], borderRadius: BorderRadius.circular(50)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        stories[index]["image"],
                        width: 70,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(stories[index]["name"])
          ],
        );
      },
    );
  }
}
