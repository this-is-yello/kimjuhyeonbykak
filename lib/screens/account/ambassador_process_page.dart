import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

import 'package:url_launcher/url_launcher.dart';

class AmbassadorProcessPage extends StatefulWidget {
  const AmbassadorProcessPage({super.key});

  @override
  State<AmbassadorProcessPage> createState() => _AmbassadorProcessPageState();
}

class _AmbassadorProcessPageState extends State<AmbassadorProcessPage> {
  final ScrollController _scrollController = ScrollController();

  scrollState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.minScrollExtent ||
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        setState(() {
          topState = true;
        });
      } else {
        setState(() {
          topState = false;
        });
      }
    });
  }

  moveTop() {
    _scrollController.animateTo(
      MediaQuery.of(context).size.height * 0,
      duration: const Duration(milliseconds: 1800),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    inMypage = false;
    topState = true;
    scrollState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            controller: _scrollController,
            shrinkWrap: true,
            children: [
              AmbassadorProcessContent(),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                ),
                child: Footer(),
              ),
              bottomToTop(context, () => moveTop()),
            ],
          ),
          MainAppBar(),
        ],
      ),
    );
  }
}

class AmbassadorProcessContent extends StatelessWidget {
  const AmbassadorProcessContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widgetSize(context),
        padding: EdgeInsets.only(top: 120),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                'Process',
                style: TextStyle(
                  fontSize: h2FontSize(context),
                  fontFamily: 'Cafe_24',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: widgetSize(context),
                  child: Text(
                    '● 김주현바이각 엠버서더 관리는 데시그너에서 진행하고 있습니다.',
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: widgetSize(context),
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    '- 아래 절차를 숙지하시고 엠버서더 신청하세요.',
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 120),
              child: Column(
                children: [
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      '1. 약관 동의 후 회원가입을 진행합니다.',
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: Text(
                      '- 엠버서더 코드는 아이디와 동일하게 설정됩니다. (입력X)',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: fadeImage('assets/images/ambassador_process_2.png'),
                  ),
                ],
              ),
            ),
            Container(
              width: widgetSize(context),
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                '2. 로그인 후 엠버서더 메뉴로 진입합니다.',
                style: TextStyle(
                  fontSize: h4FontSize(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: widgetSize(context),
              child: fadeImage('assets/images/ambassador_process_3.png'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 120),
              child: Column(
                children: [
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      '3. 약관 동의 후 회원가입을 진행합니다.',
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: Text(
                      '- 기업 파트너일 경우 : 사업자등록증(기업) 사본',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: Text(
                      '- 개인 파트너일 경우 : 신분증(기업) 사본',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: fadeImage('assets/images/ambassador_process_4.png'),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                final url = Uri.parse(
                  'https://xn--2i0b31d0uch0z.com/bbs/register.php',
                );
                if (await canLaunchUrl(url)) {
                  launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: Container(
                width: 360,
                height: 56,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '엠버서더 신청하기',
                    style: TextStyle(
                      fontSize: 16,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
