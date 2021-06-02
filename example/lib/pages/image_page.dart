import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('vant image'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('基础用法'),
            Image.network(
              'https://img01.yzcdn.cn/vant/cat.jpeg',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
            Text('填充模式'),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(
                  children: [
                    Column(
                      children: [
                        Image.network(
                          'https://img01.yzcdn.cn/vant/cat.jpeg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        Text('contain')
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          'https://img01.yzcdn.cn/vant/cat.jpeg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Text('cover')
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          'https://img01.yzcdn.cn/vant/cat.jpeg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        Text('fill')
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          'https://img01.yzcdn.cn/vant/cat.jpeg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.none,
                        ),
                        Text('none')
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          'https://img01.yzcdn.cn/vant/cat.jpeg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.scaleDown,
                        ),
                        Text('scaleDown')
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text('圆形图片'),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Column(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://img01.yzcdn.cn/vant/cat.jpeg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text('contain')
                      ],
                    ),
                    Column(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://img01.yzcdn.cn/vant/cat.jpeg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text('cover')
                      ],
                    ),
                    Column(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://img01.yzcdn.cn/vant/cat.jpeg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text('fill')
                      ],
                    ),
                    Column(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://img01.yzcdn.cn/vant/cat.jpeg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.none,
                          ),
                        ),
                        Text('none')
                      ],
                    ),
                    Column(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://img01.yzcdn.cn/vant/cat.jpeg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.scaleDown,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return CircularProgressIndicator();
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Center(child: Text('加载失败')));
                            },
                          ),
                        ),
                        Text('scaleDown')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
