import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';

import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
              ProductTitle(),
              ProductsGrid(),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                    ),
                    child: Footer(),
                  ),
                  bottomToTop(context, () => moveTop()),
                ],
              ),
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
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 30,
                ),
                backgroundColor: bykakColor,
                onPressed: () {
                  moveTop();
                },
              ),
            ),
    );
  }
}

// ---------- ProductTitle -----------------------------------------------------------------------------------------------------
class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: c1BoxSize(context) + 200,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: c1BoxSize(context) + 200,
                child:
                    fadeImage('assets/images/background/rental_center_bg.png'),
              ),
              Container(
                height: c1BoxSize(context) + 200,
                decoration: BoxDecoration(
                  color: whiteColor,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      blackColor.withOpacity(0),
                      whiteColor,
                    ],
                    stops: [0, 1],
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: widgetSize(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: Text(
                        '제품',
                        style: TextStyle(
                          fontSize: h1FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                    ),
                    // Text(
                    //   '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
                    //   style: TextStyle(
                    //     fontSize: h5FontSize(context),
                    //     color: blackColor,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ---------- Products_Grid -----------------------------------------------------------------------------------------------------
class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  var productsDocs;
  var productsDocsLength;

  searchProducts() async {
    var searchResult = await firestore
        .collection('product')
        .orderBy('date', descending: true)
        .get();
    setState(() {
      productsDocs = searchResult.docs;
      productsDocsLength = searchResult.docs.length;
    });
  }

  @override
  void initState() {
    super.initState();
    searchProducts();
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (productsDocs[8]['thumbnail'] != null) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Center(
            child: SizedBox(
              width: widgetSize(context),
              child: GridView.builder(
                itemCount: productsDocsLength.hashCode,
                shrinkWrap: true,
                controller: ScrollController(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width < 800
                      ? 2
                      : MediaQuery.of(context).size.width < 1240
                          ? 3
                          : 4,
                  childAspectRatio: 1 / 1.2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: ImageFade(
                      image: NetworkImage(
                        productsDocs[index]['thumbnail'],
                      ),
                      fit: BoxFit.cover,
                      duration: const Duration(milliseconds: 900),
                      syncDuration: const Duration(milliseconds: 150),
                      // placeholder: Padding(
                      //   padding: const EdgeInsets.all(20),
                      //   child: Center(
                      //     child: CircularProgressIndicator(
                      //       color: blackColor,
                      //     ),
                      //   ),
                      // ),
                      loadingBuilder: (context, progress, chunkEvent) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: blackColor,
                          ),
                        );
                      },
                      errorBuilder: (context, error) => Container(
                        color: const Color(0xFFFFFFFF),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.warning,
                          color: Color(0xFF1E1E1E),
                          size: 60.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      } else {
        return SizedBox(
          width: widgetSize(context),
          height: 300,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: blackColor),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '로딩이 오래 걸리면 새로고침(F5) 한 번만 눌러주세요.',
                    style: TextStyle(color: blackColor),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    } catch (e) {
      return SizedBox(
        width: widgetSize(context),
        height: 300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: blackColor),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  '로딩이 오래 걸리면 새로고침(F5) 한 번만 눌러주세요.',
                  style: TextStyle(color: blackColor),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
