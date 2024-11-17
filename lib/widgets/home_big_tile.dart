import 'package:flutter/material.dart';
import 'package:spotify/config/constants.dart';
import 'package:spotify/utils/helpers.dart';

class HomeBigTile extends StatelessWidget {
  final String title;
  final String imagePath;
  const HomeBigTile({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(albumDetailsPage),
      child: SizedBox(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(imagePath),
            ),
            const VerticalSpacer(height: 10),
            Text(
              title,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[500],
              ),
            )
          ],
        ),
      ),
    );
  }
}
