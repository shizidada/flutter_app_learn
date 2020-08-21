import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'discovery_background.dart';

class ATHDiscoveryDetailScreen extends StatelessWidget {
  static final String routeName = "app://discoveryDetail";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      body: ATHDiscoveryBackground(
        child: ATHScrollerConfigurationWrapper(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  height: (size.height * .9).px,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/dhxy.jpg',
                        fit: BoxFit.cover,
                        height: (size.height * .9).px,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.px, vertical: 20.px),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80.px),
                              topRight: Radius.circular(80.px),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.px),
                                child: Text(
                                  '喜剧',
                                  style: TextStyle(
                                      fontSize: 30.px,
                                      color: ATHColors.color99),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      '你好，生产力(1) - 一切的起源VisiCalc',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 36.px,
                                          color: ATHColors.color33),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.px),
                                    child: SvgPicture.asset(
                                      'assets/icons/icon_star.svg',
                                      width: 46.px,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.px),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "今年的WWDC，注定会成为Apple WWDC中特别的一届。"
                        "不仅是因为疫情原因，改成了线上发布会形式，会上宣布了Mac从Intel芯片全面转向自研的Apple Silicon，"
                        "再加上新版OS Big Sur作为macOS 11发布，延续近20年的macOS X时代至此落幕。"
                        "Apple在这20年间上演了迄今为止科技商业史上最大的一次逆袭，从破产边缘到1.5万亿美金市值的科技商业帝国。"
                        "虽然Mac并非这次逆袭的主角，但如果我们把视线再往前拉长20年，"
                        "来到70年代末，个人电脑的时代即将来临，而引领那个时代，并且把Apple推上第一个巅峰的正是Mac(intosh) - Apple II。"
                        "但更确切地来说Apple II而在它身旁还伫立着另一个身影，携手Apple II一起把人类带入了个人电脑时代，"
                        "也同时拉开了生产力工具的序幕，那便是本文的主角VisiCalc。",
                        style: TextStyle(
                            fontSize: 32.px, color: ATHColors.color99),
                      ),
                      Container(
                        height: 600.px,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
