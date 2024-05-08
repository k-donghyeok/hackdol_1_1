import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인 화면'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '메뉴',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            ExpansionTile(
              title: Text('스팸'),
              children: [
                ListTile(
                  title: Text('차단 번호'),
                  onTap: () {
                    _launchURL('https://www.example.com'); // 예시 URL
                  },
                ),
                ListTile(
                  title: Text('차단 문구'),
                  onTap: () {
                    _launchURL('https://www.example.com'); // 예시 URL
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text('커뮤니티'),
              children: [
                ListTile(
                  title: Text('자유게시판'),
                  onTap: () {
                    _launchURL('https://www.example.com'); // 예시 URL
                  },
                ),
                ListTile(
                  title: Text('Q&A'),
                  onTap: () {
                    _launchURL('https://www.example.com'); // 예시 URL
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text('내 정보'),
              children: [
                ListTile(
                  title: Text('내 정보 확인'),
                  onTap: () {
                    _launchURL('https://www.example.com'); // 예시 URL
                  },
                ),
                ListTile(
                  title: Text('로그아웃'),
                  onTap: () {
                    _launchURL('https://www.example.com'); // 예시 URL
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyBannerWidget(
              imageUrl: 'assets/20240122064314.png', // IT 아이콘 이미지 경로
              linkUrl: 'https://www.itworld.co.kr/main/', // IT 아이콘 이동할 URL
              label: 'IT에 관한 기사', // IT 아이콘 배너 라벨
            ),
            SizedBox(height: 200), // 아이콘 간격 조정
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyBannerWidget(
                  imageUrl: 'assets/20240122064314.png', // 경찰청 아이콘 이미지 경로
                  linkUrl: 'https://www.police.go.kr', // 경찰청 아이콘 이동할 URL
                  label: '경찰청 사이트로 이동', // 경찰청 아이콘 배너 라벨
                ),
                SizedBox(width: 25), // 아이콘 간격 조정
                MyBannerWidget(
                  imageUrl: 'assets/20240122064314.png', // KISA 아이콘 이미지 경로
                  linkUrl: 'https://spam.kisa.or.kr/spam/ss/ssSpamInfo.do?mi=1025', // KISA 아이콘 이동할 URL
                  label: 'KISA 사이트로 이동', // KISA 아이콘 배너 라벨
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class MyBannerWidget extends StatelessWidget {
  final String imageUrl;
  final String linkUrl;
  final String label;

  const MyBannerWidget({
    required this.imageUrl,
    required this.linkUrl,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL(linkUrl);
      },
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
