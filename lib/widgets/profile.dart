import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAzQQpZnRrlUksGOBJn914mBxbfPej4D2NwQ&s'),
          ),
          SizedBox(width: 30),
          Text(
            'Zeeshan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(width: 180),
          Icon(
            CupertinoIcons.square_list,
            size: 30,
          )
        ],
      ),
    );
  }
}
