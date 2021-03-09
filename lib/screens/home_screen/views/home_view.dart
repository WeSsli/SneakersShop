import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sneakers/controllers/product_controller.dart';
import 'package:sneakers/services/database.dart';
import 'package:sneakers/widgets/product_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _searchBar(context),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Wszystkie"),
                Text("Męskie"),
                Text("Damskie"),
                Text("Dziecięce"),
              ],
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: Obx(
              () => SmartRefresher(
                controller: refreshController,
                enablePullDown: true,
                onRefresh: () async {
                  productController.products.value =
                      await Database().getProducts();
                  refreshController.refreshCompleted();
                },
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: productController.products.value.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                          product: productController.products.value[index]);
                    }),
              ),
            ),
          ),
          SizedBox(height: 48)
        ],
      ),
    );
  }

  Widget _searchBar(BuildContext context) => PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        child: CupertinoTextField(
          onChanged: (string) {
            
            
          },
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
          decoration: BoxDecoration(color: Colors.transparent),
          controller: productController.searchController,
          placeholder: "Szukaj",
          placeholderStyle: context.textTheme.bodyText1.copyWith(
            fontSize: 16,
            color: Colors.black.withOpacity(0.3),
          ),
          prefix: Container(
            margin: EdgeInsets.only(left: 8, right: 16),
            child: Icon(Icons.search),
          ),
        ),
      );

  @override
  bool get wantKeepAlive => true;
}
