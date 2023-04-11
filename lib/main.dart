// https://docs.flutter.dev/development/ui/layout/tutorial

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            // 행 전체로 확장 (컬럼(텍스트 2개), 별 아이콘 1, 숫자텍스트 1) 배치
            child: Column(
              // 텍스트 2개를 배치 할 컬럼
              crossAxisAlignment: CrossAxisAlignment.start, // 컬럼의 시작을 좌측으로 정렬
              children: [
                Container(
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true, // true로 설정하면 텍스트 줄이 열 너비를 채우기 전에 단어 경계에서 줄 바꿈
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceEvenly, // child 위젯 간의 공간을 두고, 같은 크기만큼 양 옆에 공간을 둔다.
      // spaceAround  child 위젯간의 공간을 두고, 절반 크기만큼 양 옆에 공간을 둔다.
      // spaceBetween  spaceEvenly와 spaceAround와는 다르게 양 옆에 공간을 만들지 않는다.
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE')
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fultter layout demo'),
        ),
        // body: const Center(
        //   child: Text('Hello World'),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover, // 비율을 유지하며, 지정한 영역을 꽉 채운다. (조금 짤림)
              // fill : 비율 변경하며, 지정한 영역을 꽉 채운다.(가장 많이 사용)
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
