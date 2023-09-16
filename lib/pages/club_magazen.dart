import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tablet_prime/resources/assets_manager.dart';
import 'package:tablet_prime/resources/color_manager.dart';
import 'package:tablet_prime/resources/styles_manager.dart';
import 'package:tablet_prime/widget/my_drower.dart';

class ClubMagazen extends StatefulWidget {
  const ClubMagazen({super.key});

  @override
  State<ClubMagazen> createState() => _ClubMagazenState();
}

class _ClubMagazenState extends State<ClubMagazen> {
  bool isTabSelect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(child: Text("Prime")),
          SizedBox(
            width: 10.w,
          ),
          CircleAvatar(
            backgroundImage: AssetImage(ImageAssets.logopng),
          ),
          SizedBox(
            width: 61.w,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 300,height: 300,child: Image.asset(ImageAssets.mag)),
         SvgPicture.asset(IconAssets.magaz,width: 300,height: 300,),
          SizedBox(
            height: 17.h,
          ),
          Text(
            "مجلة المركز",
            style: getBoldStyle(color: ColorManager.primary, fontSize: 14),
          ),
          SizedBox(
            height: 50.h,
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.7,
                child: ContainedTabBarView(
                  tabs: [
                    Row(
                      children: [
                        Text('First',
                            style: TextStyle(
                                color: isTabSelect
                                    ? ColorManager.primary
                                    : ColorManager.gray)),
                        SizedBox(
                          width: 3.w,
                        ),
                        SvgPicture.asset(
                          IconAssets.insta,
                          semanticsLabel: 'Acme Logo',
                          width: 24.w,
                          height: 24.h,
                          color: isTabSelect
                              ? ColorManager.primary
                              : ColorManager.gray,
                        )
                      ],
                    ),
                    Text('Second', style: TextStyle(color: Colors.black)),
                    Text('Second', style: TextStyle(color: Colors.black)),
                  ],
                  views: [
                    ExpandableNotifier(
                      child: Expandable(
                        // <-- Driven by ExpandableController from ExpandableNotifier

                        collapsed: ExpandableButton(
                          // <-- Expands when tapped on the cover photo
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  ImageAssets.logopng,
                                  width: 200,
                                  height: 200,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("data"),
                                          Icon(Icons.add),
                                        ],
                                      ),
                                      Text(
                                        "akjfbnlkjasdflkjabsdlkjgbaad.fmbaskjdfhkl;asdghnbk;jasdhngklasdg;lkasnd;lkgasdl;kgna;lskdng;klasdngl;kasdlkjgblkasjdbgkljasdbglkasbdklgasdlkjgbaslkddskjafnlk",

                                        softWrap: true,
                                       
                                        overflow: TextOverflow.clip, ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        expanded: Column(children: [
                          Card(
                            child: Expanded(
                              child: Row(
                                children: [
                                  Center(child: Image.asset(ImageAssets.logopng)),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("data"),
                                            Icon(Icons.add),
                                          ],
                                        ),
                                        Padding(
                                          
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "akjfbnlkjasdflkjabsdlkjgbaad.fmbaskjdfhkl;asdghnbk;jasdhngklasdg;lkasnd;lkgasdl;kgna;lskdng;klasdngl;kasdlkjgblkasjdbgkljasdbglkasbdklgasdlkjgbaslkddskjafnlk",
                                            softWrap: true,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12.sp),
                                          ),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          ExpandableButton(
                            // <-- Collapses when tapped on
                            child: Text("Back"),
                          ),
                        ]),
                      ),
                    ),
                    Container(color: Colors.green),
                    Container(color: Colors.green),
                  ],
                  onChange: (index) {
                    setState(() {
                      isTabSelect = !isTabSelect;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrower(),
    );
  }
}
