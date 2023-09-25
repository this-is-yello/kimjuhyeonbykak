import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
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
                child: TermsContent(),
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

class TermsContent extends StatelessWidget {
  const TermsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widgetSize(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText(
              '이용약관',
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
                  '본 사이트의 이용과 관련하여 필요사항을 규정합니다.',
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
                      '제1장 총칙',
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
                      '제1조(목적)\n이 약관은 김주현바이각(이하 "바이각"이라 한다)의 홈페이지(https://kimjuhyeonbykak.web.app/#/)에서 제공하는 모든 서비스(이하 "서비스"라 한다)의 이용조건 및 절차에 관한 사항을 규정함을 목적으로 합니다.',
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
                      '제2조(정의)\n이 약관에서 사용하는 용어의 정의는 다음 각 호와 같습니다.\n- 이용자 : 본 약관에 따라 회사가 제공하는 서비스를 받는 자\n- 이용계약 : 서비스 이용과 관련하여 회사와 이용자간에 체결하는 계약\n- 가입 : 회사가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는행위\n- 회원 : 당 사이트에 회원가입에 필요한 개인정보를 제공하여 회원 등록을 한 자\n- 이용자번호(ID) : 회원 식별과 회원의 서비스 이용을 위하여 이용자가 선정하고 회사가 승인하는 영문자와 숫자의 조합\n- 패스워드(PASSWORD) : 회원의 정보 보호를 위해 이용자 자신이 설정한 영문자와 숫자의 조합\n- 이용해지 : 회사 또는 회원이 서비스 이용 이후 그 이용계약을 종료시키는 의사표시',
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
                      '제3조(약관의 효력과 변경)\n회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이후에도 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.\n- 이 약관의 서비스 화면에 게시하거나 공지사항 게시판 또는 기타의 방법으로 공지함으로써 효력이 발생됩니다.\n- 회사는 필요하다고 인정되는 경우 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 서비스 화면에 공지하며, 공지후 7일 이후에도 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.\n- 이용자가 변경된 약관에 동의하지 않는 경우 서비스 이용을 중단하고 본인의 회원등록을 취소할 수 있으며, 계속 사용하시는 경우에는 약관 변경에 동의한 것으로 간주되며 변경된 약관은 전항과 같은 방법으로 효력이 발생합니다.',
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
                      '제4조(준용규정)\n이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법 및 기타 관련법령의 규정에 따릅니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 40),
                    child: SelectableText(
                      '제2장 서비스 이용계약',
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
                      '제5조(이용계약의 성립)\n이용계약은 이용자의 이용신청에 대한 회사의 승낙과 이용자의 약관 내용에 대한 동의로 성립됩니다.',
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
                      '제6조(이용신청)\n이용신청은 서비스의 회원정보 화면에서 이용자가 회사에서 요구하는 가입신청서 양식에 개인의 신상정보를 기록하여 신청할 수 있습니다.',
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
                      '제7조(이용신청의 승낙)\n- 회원이 신청서의 모든 사항을 정확히 기재하여 이용신청을 하였을 경우에 특별한 사정이 없는 한 서비스 이용신청을 승낙합니다.\n- 다음 각 호에 해당하는 경우에는 이용 승낙을 하지 않을 수 있습니다.\n① 본인의 실명으로 신청하지 않았을 때\n② 타인의 명의를 사용하여 신청하였을 때\n③ 이용신청의 내용을 허위로 기재한 경우\n④ 사회의 안녕 질서 또는 미풍양속을 저해할 목적으로 신청하였을 때\n⑤ 기타 회사가 정한 이용신청 요건에 미비 되었을 때',
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
                      '제8조(계약사항의 변경)\n회원은 이용신청시 기재한 사항이 변경되었을 경우에는 수정하여야 하며, 수정하지 아니하여 발생하는 문제의 책임은 회원에게 있습니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 40),
                    child: SelectableText(
                      '제3장 계약당사자의 의무',
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
                      '제9조(회사의 의무)\n회사는 서비스 제공과 관련해서 알고 있는 회원의 신상 정보를 본인의 승낙 없이 제3자에게 누설하거나 배포하지 않습니다.\n단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 또는 기타 관계법령에서 정한 절차에 의한 요청이 있을 경우에는 그러하지 아니합니다.',
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
                      '제10조(회원의 의무)\n- 회원은 서비스를 이용할 때 다음 각 호의 행위를 하지 않아야 합니다.\n① 다른 회원의 ID를 부정하게 사용하는 행위\n② 서비스에서 얻은 정보를 복제, 출판 또는 제3자에게 제공하는 행위\n③ 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위\n④ 공공질서 및 미풍양속에 위반되는 내용을 유포하는 행위\n⑤ 범죄와 결부된다고 객관적으로 판단되는 행위\n⑥ 기타 관계법령에 위반되는 행위\n- 회원은 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동에 이용하여 발생한 결과에 대하여 회사는 책임을 지지 않습니다.\n- 회원은 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도하거나 증여할 수 없으며, 이를 담보로도 제공할 수 없습니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 40),
                    child: SelectableText(
                      '제4장 서비스 이용',
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
                      '제11조(회원의 의무)\n- 회원은 필요에 따라 자신의 메일, 게시판, 등록자료 등 유지보수에 대한 관리책임을 갖습니다.\n- 회원은 회사에서 제공하는 자료를 임의로 삭제, 변경할 수 없습니다.\n- 회원은 회사의 홈페이지에 공공질서 및 미풍양속에 위반되는 내용물이나 제3자의 저작권 등 기타권리를 침해하는 내용물을 등록하는 행위를 하지 않아야 합니다. 만약 이와 같은 내용물을 게재하였을 때 발생하는 결과에 대한 모든 책임은 회원에게 있습니다.',
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
                      '제12조(게시물 관리 및 삭제)\n효율적인 서비스 운영을 위하여 회원의 메모리 공간, 메시지크기, 보관일수 등을 제한할 수 있으며 등록하는 내용이 다음 각 호에 해당하는 경우에는 사전 통지없이 삭제할 수 있습니다.\n- 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우\n- 공공질서 및 미풍양속에 위반되는 내용인 경우\n- 범죄적 행위에 결부된다고 인정되는 내용인 경우\n- 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우\n- 회원이 회사의 홈페이지와 게시판에 음란물을 게재하거나 음란 사이트를 링크하는 경우\n- 기타 관계법령에 위반된다고 판단되는 경우',
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
                      '제13조(게시물의 저작권)\n게시물의 저작권은 게시자 본인에게 있으며 회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.',
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
                      '제14조(서비스 이용시간)\n서비스의 이용은 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만 정기 점검 등의 사유 발생시는 그러하지 않습니다.',
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
                      '제15조(서비스 이용 책임)\n서비스를 이용하여 해킹, 음란사이트 링크, 상용S/W 불법배포 등의 행위를 하여서는 아니되며, 이를 위반으로 인해 발생한 영업활동의 결과 및 손실, 관계기관에 의한 법적 조치 등에 관하여는 회사는 책임을 지지 않습니다.',
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
                      '제16조(서비스 제공의 중지)\n다음 각 호에 해당하는 경우에는 서비스 제공을 중지할 수 있습니다.\n- 서비스용 설비의 보수 등 공사로 인한 부득이한 경우\n- 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우\n- 시스템 점검이 필요한 경우\n- 기타 불가항력적 사유가 있는 경우',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 40),
                    child: SelectableText(
                      '제5장 계약해지 및 이용제한',
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
                      '제17조(계약해지 및 이용제한)\n- 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 인터넷을 통하여 해지신청을 하여야 하며, 회사에서는 본인 여부를 확인 후 조치합니다.\n- 회사는 회원이 다음 각 호에 해당하는 행위를 하였을 경우 해지조치 30일전까지 그 뜻을 이용고객에게 통지하여 의견진술할 기회를 주어야 합니다.\n① 타인의 이용자ID 및 패스워드를 도용한 경우\n② 서비스 운영을 고의로 방해한 경우\n③ 허위로 가입 신청을 한 경우\n④ 같은 사용자가 다른 ID로 이중 등록을 한 경우\n⑤ 공공질서 및 미풍양속에 저해되는 내용을 유포시킨 경우\n⑥ 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우\n⑦ 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우\n⑧ 정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터바이러스 프로그램 등을 유포하는 경우\n⑨ 회사 또는 다른 회원이나 제3자의 지적재산권을 침해하는 경우\n⑩ 타인의 개인정보, 이용자ID 및 패스워드를 부정하게 사용하는 경우\n⑪ 회원이 자신의 홈페이지나 게시판 등에 음란물을 게재하거나 음란 사이트를 링크하는 경우\n⑫ 기타 관련법령에 위반된다고 판단되는 경우',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 40),
                    child: SelectableText(
                      '제6장 기타',
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
                      '제18조(양도금지)\n회원은 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.',
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
                      '제19조(손해배상)\n회사는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 동 손해가 회사의 고의 또는 중대한 과실로 인한 손해를 제외하고 이에 대하여 책임을 부담하지 아니합니다.',
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
                      '제20조(면책 조항)\n- 회사는 천재지변, 전쟁 또는 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.\n- 회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.\n- 회사는 회원의 귀책사유로 인한 서비스이용의 장애에 대하여 책임을 지지 않습니다.\n- 회사는 회원이 서비스를 이용하여 기대하는 이익이나 서비스를 통하여 얻는 자료로 인한 손해에 관하여 책임을 지지 않습니다.\n- 회사는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.',
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
                      '제21조(관할법원)\n서비스 이용으로 발생한 분쟁에 대해 소송이 제기 될 경우 회사의 소재지를 관할하는 법원을 전속 관할법원으로 합니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: widgetSize(context),
                    padding: EdgeInsets.only(top: 40),
                    child: SelectableText(
                      '부칙',
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
                      '(시행일) 이 약관은 2023-08-10부터 시행합니다.',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TermsDialog extends StatelessWidget {
  const TermsDialog({super.key});

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
              child: TermsContent(),
            ),
          ],
        ),
      ),
    );
  }
}
