import 'dart:ui';
import 'package:flutter/material.dart';
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
                  color: whiteColor,
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
                child: fadeImage('assets/images/rentalCenter_bg.png'),
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
                    Text(
                      '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
                      style: TextStyle(
                        fontSize: h6FontSize(context),
                        color: blackColor,
                      ),
                    ),
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

  searchProducts() async {
    var searchResult = await firestore.collection('product').get();
    setState(() {
      productsDocs = searchResult.docs;
    });
  }

  @override
  void initState() {
    super.initState();
    searchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SizedBox(
            width: widgetSize(context),
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: SizedBox(
                    child: Image.network(
                      productsDocs[0]['thumbnail'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(
                    color: blackColor,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    color: blackColor,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    color: blackColor,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 2,
                  child: Container(
                    color: blackColor,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(
                    color: blackColor,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    color: blackColor,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    color: blackColor,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Container(
                    color: blackColor,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Container(
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
