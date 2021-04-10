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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _searchBar(context),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _filterButton(context, "Wszystkie", 3),
                    _filterButton(context, "Męskie", 0),
                    _filterButton(context, "Damskie", 1),
                    _filterButton(context, "Dziecięce", 2),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            _productsList(context),
            SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  Widget _productsList(BuildContext context) {
    return Expanded(
      child: Obx(
        () => SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          onRefresh: () async {
            productController.products = await Database().getProducts();
            productController.filterProducts();
            refreshController.refreshCompleted();
          },
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: productController.filteredProducts.value.length,
              itemBuilder: (context, index) {
                return ProductCard(
                    product: productController.filteredProducts.value[index]);
              }),
        ),
      ),
    );
  }

  Widget _searchBar(BuildContext context) => PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        child: CupertinoTextField(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
          decoration: BoxDecoration(color: Colors.transparent),
          controller: productController.searchController,
          onSubmitted: (_) {
            FocusScope.of(context).unfocus();
          },
          placeholder: "Szukaj",
          placeholderStyle: context.textTheme.bodyText1.copyWith(
            fontSize: 16,
            color: Colors.black.withOpacity(0.3),
          ),
          prefix: Container(
            margin: EdgeInsets.only(left: 8, right: 16),
            child: Icon(Icons.search),
          ),
          suffix: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              productController.searchController.clear();
            },
            child: Icon(
              Icons.clear,
              size: 12,
              color: Colors.black,
            ),
          ),
          suffixMode: OverlayVisibilityMode.editing,
        ),
      );

  Widget _filterButton(BuildContext context, String text, int prodType) =>
      CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        color: Colors.transparent,
        onPressed: () {
          productController.type.value = prodType;
          productController.filterProducts();
        },
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: productController.type.value == prodType
                ? context.theme.primaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: productController.type.value == prodType
                ? context.textTheme.bodyText1.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )
                : context.textTheme.bodyText1.copyWith(
                    fontSize: 16,
                  ),
          ),
        ),
      );

  @override
  bool get wantKeepAlive => true;
}
