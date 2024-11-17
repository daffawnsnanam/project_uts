import 'package:flutter/material.dart';
import 'package:spotify/config/constants.dart';
import 'package:spotify/theme/font_theme.dart';
import 'package:spotify/utils/helpers.dart';
import 'package:spotify/widgets/home_big_tile.dart';

class AlbumFooter extends StatefulWidget {
  const AlbumFooter({super.key});

  @override
  State<AlbumFooter> createState() => _AlbumFooterState();
}

class _AlbumFooterState extends State<AlbumFooter> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('February 25, 2022'),
              VerticalSpacer(height: 5),
              Row(
                children: <Widget>[
                  Text('14 songs'),
                  HorizontalSpacer(width: 5),
                  dotIcon,
                  HorizontalSpacer(width: 5),
                  Text('56 min 22 sec')
                ],
              ),
            ],
          ),
        ),
        VerticalSpacer(height: 20),
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/savara.jpeg'),
              radius: 30,
            ),
            HorizontalSpacer(width: 10),
            Text(
              'Savara',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),

        VerticalSpacer(height: 20),
        // Recommendations
        Text(
          'You might also like',
          style: smallTitle,
        ),
        VerticalSpacer(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              HomeBigTile(
                  title: 'East Mpaka London',
                  imagePath: 'assets/images/emlBB.jpeg'),
              HorizontalSpacer(width: 10),
              HomeBigTile(
                  title: 'Lil Mama', imagePath: 'assets/images/lilmama.jpg'),
              HorizontalSpacer(width: 10),
              HomeBigTile(
                  title: 'Victims of Madness',
                  imagePath: 'assets/images/wakadinaliVom.jpeg'),
              HorizontalSpacer(width: 10),
              HomeBigTile(title: 'Zoza', imagePath: 'assets/images/zoza.jpg'),
              HorizontalSpacer(width: 10),
              HomeBigTile(
                  title: 'Victims of Madness',
                  imagePath: 'assets/images/wakadinaliVom.jpeg'),
            ],
          ),
        ),
        VerticalSpacer(height: 10)
      ],
    );
  }
}
