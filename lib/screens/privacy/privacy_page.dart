import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
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
      0,
      duration: const Duration(milliseconds: 1800),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    topState = true;
    inMypage = false;
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: PrivacyContent(),
              ),
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
      floatingActionButton: topState
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8),
              child: FloatingActionButton(
                backgroundColor: bykakColor,
                onPressed: () {
                  moveTop();
                },
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 30,
                ),
              ),
            ),
    );
  }
}

class PrivacyContent extends StatelessWidget {
  const PrivacyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widgetSize(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText(
              '개인정보취급방침',
              style: TextStyle(
                fontSize: h2FontSize(context),
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                width: widgetSize(context),
                height: 3,
                color: blackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                width: widgetSize(context),
                child: SelectableText(
                  '본 사이트는 이용하시는 모든 이용자들의 개인정보를 소중히 여깁니다.\n\n개인정보 수집에 대한 동의회사는 귀하께서 회사의 개인정보보호방침 또는 이용약관의 내용에 대해 「동의한다」버튼 또는 「동의하지 않는다」버튼을 클릭할 수 있는 절차를 마련하여,「동의한다」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.',
                  style: TextStyle(
                    fontSize: h5FontSize(context),
                    color: blackColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  SizedBox(
                    width: widgetSize(context),
                    child: SelectableText(
                      '개인정보의 보유 및 이용기간',
                      style: TextStyle(
                        fontSize: h5FontSize(context) + 2,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 20),
                    child: SelectableText(
                      '- 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. (부결 시 상담 완료 후 혹은 대출 성사 후 자금 지급 후)\n- 위 보유기간에도 불구하고 계속 보유하여야 할 필요가 있을 경우에는 귀하의 동의를 받겠습니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  SizedBox(
                    width: widgetSize(context),
                    child: SelectableText(
                      '이용자들이 사전에 동의한 경우',
                      style: TextStyle(
                        fontSize: h5FontSize(context) + 2,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 20),
                    child: SelectableText(
                      '법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우 이용자 및 법정대리인의 권리와 그 행사항법이용자는 개인정보 이용에 따른 변경 및 삭제 요청을 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.\n귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.\n또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.\n회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 “회사가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.\n개인정보보호를 위한 기술적 대책회사는 귀하의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 20),
                    child: SelectableText(
                      '- 귀하의 개인정보는 비밀번호에 의해 보호되며, 파일 및 전송 데이터를 암호화하거나 파일 잠금기능(Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다.\n- 회사는 백신프로그램을 이용하여 컴퓨터바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해되는 것을 방지하고 있습니다.\n- 회사는 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할 수 있는 보안장치(SSL 또는 SET)를 채택하고 있습니다.\n- 해킹 등에 의해 귀하의 개인정보가 유출되는 것을 방지하기 위해, 외부로부터의 침입을 차단하는 장치를 이용하고 있으며, 각 서버마다 침입탐지시스템을 설치하여 24시간 침입을 감시하고 있습니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 20),
                    child: SelectableText(
                      '개인정보 자동수집 장치의 설치ㆍ운영 및 그 거부에 관한 사항회사는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다.\n쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 20),
                    child: SelectableText(
                      '회사는 다음과 같은 목적을 위해 쿠키를 사용합니다.\n- 쿠키 등 사용 목적 : 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.\n- 쿠키 설정 거부 방법예 : 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 >인터넷 옵션 >개인정보단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다. 개인정보에 관한 민원서비스회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                width: widgetSize(context),
                height: 1,
                color: blackColor,
              ),
            ),
            Container(
              width: widgetSize(context),
              padding: EdgeInsets.only(top: 40),
              child: SelectableText(
                '개인정보관리책임자 성명 : 김주현\n관리자전화번호 : 070-4897-3059\n이메일 : kimjuhyeon_@naver.com',
                style: TextStyle(
                  fontSize: h5FontSize(context),
                  color: blackColor,
                ),
              ),
            ),
            Container(
              width: widgetSize(context),
              padding: EdgeInsets.only(top: 20),
              child: SelectableText(
                '귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다.\n회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.\n기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.',
                style: TextStyle(
                  fontSize: h5FontSize(context),
                  color: blackColor,
                ),
              ),
            ),
            Container(
              width: widgetSize(context),
              padding: EdgeInsets.only(top: 20),
              child: SelectableText(
                '1. 개인분쟁조정위원회 (www.1336.or.kr/1336)\n2. 정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)\n3. 대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)\n4. 경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)',
                style: TextStyle(
                  fontSize: h5FontSize(context),
                  color: blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyDialog extends StatelessWidget {
  const PrivacyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: widgetSize(context),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close_rounded,
                  size: 40,
                  color: blackColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: PrivacyContent(),
            ),
          ],
        ),
      ),
    );
  }
}
