import 'dart:html';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第五章 容器类组件',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('容器类组件'),
          elevation: 30.0, //设置标题阴影 不需要的话值设置成 0.0
          actions: <Widget>[
            //导航栏右侧菜单
            IconButton(icon: Icon(Icons.share), onPressed: () {}),
          ],
        ),
        drawer: MyDrawer(),
        
        floatingActionButton: FloatingActionButton(
            //悬浮按钮
            child: Icon(Icons.add),
            onPressed: _onAdd),
        body: MyHome(),
      ),
    );
  }

  void _onAdd() {}
  
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.network(
      "https://pic4.zhimg.com/v2-874b7cb7ded56394b549d34a68c76a00_r.jpg",
      width: 80.0,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          //左边添加8像素补白
          padding: EdgeInsets.only(left: 8),
          child: Text("Hello world"),
        ),
        Padding(
          //上下各添加8像素补白
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text("I am Jack"),
        ),
        Padding(
          // 分别指定四个方向的补白
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text("Your friend"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange.shade700]), //背景渐变
                    borderRadius: BorderRadius.circular(3.0), //3像素圆角
                    boxShadow: [
                      //阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight, //相对于坐标系远点的对齐方式
                transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(
                offset: Offset(-15.0, -5.0),
                child: Text("Hello world！"),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                angle: math.pi / 2,
                child: Text("Hello world!"),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.scale(
                scale: 1.5, //放大到1.5倍
                child: Text("Hello world"),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20)),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: RotatedBox(
                quarterTurns: 1,
                child: Text("Hello world!"),
              ),
            ),
            Text(
              "你好",
              style: TextStyle(color: Colors.green, fontSize: 18.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50.0, left: 120),
                  constraints: BoxConstraints.tightFor(
                      width: 200.0, height: 150.0), //卡片大小
                  decoration: BoxDecoration(
                    //背景装饰
                    gradient: RadialGradient(
                      //背景径向渐变
                      colors: [Colors.red, Colors.orange],
                      center: Alignment.topLeft,
                      radius: .98,
                    ),
                    boxShadow: [
                      //卡片阴影
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0,
                      )
                    ],
                  ),
                  transform: Matrix4.rotationZ(.2), //卡片倾斜变换
                  alignment: Alignment.center, //卡片内文字居中
                  child: Text(
                    "5.20",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0), //容器外补白
                  color: Colors.orange,
                  child: Text("Hello world"),
                ),
                Container(
                  padding: EdgeInsets.all(20.0), //容器内补白
                  color: Colors.orange,
                  child: Text("Hello world!"),
                )
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            avatar, //不裁剪
            ClipOval(child: avatar), //裁剪为圆形
            ClipRRect(
              //裁剪为圆角矩形
              borderRadius: BorderRadius.circular(5.0),
              child: avatar,
            ),
            Align(
              alignment: Alignment.topLeft,
              widthFactor: .5, //宽度设为原来宽度的一半，另一半会溢出
              child: avatar,
            ),
            Text(
              "你好蜡笔小新！",
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度的一半
                child: avatar,
              ),
            ),
            Text(
              "你好蜡笔小新",
              style: TextStyle(color: Colors.green),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: ClipRect(
                clipper: MyClipper(),
                child: avatar,
              ),
            )
          ],
        ),
        wRow(' 90000000000000000 '),
        FittedBox(child: wRow(' 90000000000000000 ')),
        wRow(' 800 '),
        FittedBox(child: wRow(' 800 ')),
      ],
    );
  }
}

Widget wRow(String text) {
  Widget child = Text(text);
  child = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child, child],
  );
  return child;
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.network(
                        "https://pic4.zhimg.com/v2-874b7cb7ded56394b549d34a68c76a00_r.jpg",
                        width: 80.0,
                      ),
                    ),
                  ),
                  Text(
                    "蜡笔小新",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
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
