import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shodia_mama/routs/app_routes.dart';
import 'package:shodia_mama/screens/home_screen/home_screen_controller.dart';
import 'package:shodia_mama/utils/size_config.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    //! it's for responsive design
    SizeConfig().init(context);
    RefreshController _refreshController =
        RefreshController(initialRefresh: true);

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: GetX<HomeScreenController>(builder: (data) {
          /* if (!controller.isLoaded.value) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loading...',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: getProportionateScreenWidth(20)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CircularProgressIndicator(),
              ],
            );
          } */
          return SafeArea(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullUp: true,
              onRefresh: () async {
                final result = await controller.loadData(isRefresh: true);
                if (result) {
                  _refreshController.refreshCompleted();
                } else {
                  _refreshController.refreshFailed();
                }
              },
              onLoading: () async {
                /* if (HomeScreenController.currentPage >=
                    HomeScreenController.totalPage) {
                  _refreshController.loadNoData();
                  //! data load form first page
                  controller.loadData(isRefresh: true);
                } else { */
                final result = await controller.loadData();
                if (result) {
                  _refreshController.loadComplete();
                } else {
                  _refreshController.loadFailed();
                }
                //}
              },
              child: ListView.builder(
                itemCount: controller.dataList.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.DETAIL,
                          arguments: {'item': data.dataList[index]});
                    },
                    title: Text(data.dataList[index].id),
                    subtitle: Text(data.dataList[index].author),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
