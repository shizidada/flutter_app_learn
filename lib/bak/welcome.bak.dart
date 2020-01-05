// import 'package:flutter/material.dart';

// // import 'package:flutter_swiper/flutter_swiper.dart';

// class WelcomePage extends StatefulWidget {
//   WelcomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   State<StatefulWidget> createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
//   /// with WidgetsBindingObserver
//   ///  initState
//   ///  didChangeDependencies
//   ///  didUpdateWidget
//   ///  deactivate
//   ///  dispose

// //  Timer _timer;

//   // 声明一个list，存放image Widget
//   List<Widget> imageList = List();

//   @override
//   void initState() {
//     print('initState .... ');

//     imageList
//       ..add(Image.network(
//         'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
//         fit: BoxFit.fill,
//       ))
//       ..add(Image.network(
//         'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
//         fit: BoxFit.fill,
//       ))
//       ..add(Image.network(
//         'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
//         fit: BoxFit.fill,
//       ))
//       ..add(Image.network(
//         'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
//         fit: BoxFit.fill,
//       ));
//     super.initState();

//     // WidgetsBinding.instance.addObserver(this);
// //    _timer = new Timer(const Duration(milliseconds: 1500), () {
// //      try {
// ////        Navigator.of(context).pushAndRemoveUntil(
// ////            new MaterialPageRoute(
// ////                builder: (BuildContext context) =>
// ////                    new HomePage(title: "Home", params: {})),
// ////            //跳转到主页
// ////            (Route route) => route == null);
// //
// ////        Navigator.push(
// ////            context,
// ////            new MaterialPageRoute(
// ////                builder: (context) => new RegisterPage(title: "Register")));
// //      } catch (e) {
// //        print(e);
// //      }
// //    });
//   }

//   @override
//   void didChangeDependencies() {
//     print('didChangeDependencies .... ');
//     super.didChangeDependencies();
//   }

//   @override
//   void didUpdateWidget(WelcomePage oldWidget) {
//     print('didUpdateWidget .... ');
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void deactivate() {
//     print('deactivate .... ');
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     print('dispose .... ');
// //    _timer.cancel();
//     // WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   /// @override
//   /// void didChangeAppLifecycleState(AppLifecycleState state) {
//   ///   switch (state) {
//   ///     case AppLifecycleState.inactive:
//   ///       print('AppLifecycleState.inactive .... ');
//   ///       break;
//   ///     case AppLifecycleState.paused:
//   ///       print('AppLifecycleState.paused .... ');
//   ///       break;
//   ///     case AppLifecycleState.resumed:
//   ///       print('AppLifecycleState.resumed .... ');
//   ///       break;
//   ///     case AppLifecycleState.suspending:
//   ///       print('AppLifecycleState.suspending .... ');
//   ///       break;
//   ///   }
//   ///   super.didChangeAppLifecycleState(state);
//   /// }

//   ///  void _pushHome(value) {
//   ///    Navigator.push(
//   ///        context, new MaterialPageRoute(builder: (context) => new HomePage(title: "Home Page",params: {})));
//   ///  }

//   @override
//   Widget build(BuildContext context) {
//     print("build .... ");

//     return Scaffold(
// //        appBar: new AppBar(
// //          title: new Text(widget.title),
// //        ),
//         // 防止键盘弹出影响布局高度
//         resizeToAvoidBottomPadding: false,
//         body: ListView(
//           // 这里使用listView是因为本地写了几组不同样式的展示，太懒了，所以这里就没有改
//           children: <Widget>[firstSwiperView()],
//         ));
//   }

//   Widget firstSwiperView() {
//     return Column(
//       children: <Widget>[
//         Container(
// //      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//           width: MediaQuery.of(context).size.width,
//           height: 400,
// //      height: MediaQuery.of(context).size.height,
// //      height: MediaQuery.of(context).size.height - 50,
//           // child: Swiper(
//           // itemCount: 4,
// //        viewportFraction: 0.8,
// //        scale: 0.9,
// //        itemWidth: 300.0,
// //        layout: SwiperLayout.STACK,
//           // itemBuilder: _swiperBuilder,
//           // pagination: SwiperPagination(
// //            alignment: Alignment.bottomRight,
// //            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//           //     builder: DotSwiperPaginationBuilder(
//           //         color: Colors.black54, activeColor: Colors.blue)),
//           // controller: SwiperController(),
// //        scrollDirection: Axis.horizontal,
//           // autoplay: false,
// //              onTap: (index) => print('点击了第$index'),
// //              onIndexChanged: _onIndexChanged,
//           // )
//         ),
//         OutlineButton(
//           onPressed: _onEnterClick,
//           child: Text("进入主页"),
//         ),
//       ],
//     );
//   }

//   void _onEnterClick() {
//     // Navigator.push(context,
//     //     MaterialPageRoute(builder: (context) => new HomePage(title: "Home")));
//   }
// }

// //      Center(
// //        child: Column(
// //          children: <Widget>[
// //            Row(
// //              children: <Widget>[
// //                Expanded(
// //                  child: Row(
// //                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //
// //                    children: <Widget>[
// ////                      Baseline(
// ////                        baseline: 48,
// ////                        baselineType: TextBaseline.alphabetic,
// ////                        child: Container(
// ////                          height: 48,
// //////                          color: Colors.amber,
// ////                          child: Text("name"),
// ////                        ),
// ////                      ),
// //                      Text("name"),
// //                      Text("password")
// //                    ],
// //                  ),
// //                )
// //              ],
// //            ),
// //            RaisedButton(
// //              onPressed: () => _loginPage(),
// //              child: Text("Login"),
// //            ),
// //            RaisedButton(
// //              onPressed: () => _registerPage(),
// //              child: Text("Register"),
// //            ),
// //          ],
// //        ),

// //        child: Column(
// //          mainAxisAlignment: MainAxisAlignment.center,
// //          children: <Widget>[
// //            Column(
// //              children: <Widget>[
// //                Text("Welcome Page"),
// //              ],
// //            ),
// //            RaisedButton(
// //              onPressed: () => _loginPage(),
// //              child: Text("Login"),
// //            ),
// //            RaisedButton(
// //              onPressed: () => _registerPage(),
// //              child: Text("Register"),
// //            ),
// //          ],
// //        ),
// //      ),
// //    );

// /**
//     new OutlineButton(
//     textColor: Colors.blue,
//     highlightedBorderColor: Colors.deepOrange,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//     borderSide: new BorderSide(color: Colors.blueAccent),
//     onPressed: () {},
//     child: new Text("OutlineButton")
//     ),
//  */
