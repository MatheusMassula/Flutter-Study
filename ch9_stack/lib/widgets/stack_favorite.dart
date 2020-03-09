import 'package:flutter/material.dart';

class StackFavoriteWidget extends StatelessWidget {
  const StackFavoriteWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            Image(image: AssetImage('assets/images/dawn.jpg')),
            Positioned(
              top: 0,
              right: 0,
              child: FractionalTranslation(
                translation: Offset(0.3, -0.3),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white30,
                  child: Icon(
                    Icons.star,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              )
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/images/eagle.jpg'),
              )
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Text(
                'Bald Eagle',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white30,
                  fontWeight: FontWeight.bold
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}