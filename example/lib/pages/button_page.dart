import 'package:flutter/material.dart';
import 'package:flutter_vant/flutter_vant.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vant Button'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '按钮类型',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Button(
                      text: '主要按钮',
                      type: ButtonType.primary,
                      borderRadius: 5,
                      onClick: () {
                        print('object');
                      },
                    ),
                    Button(
                      text: '主要按钮',
                      type: ButtonType.primary,
                    ),
                    Button(
                      text: '信息按钮',
                      type: ButtonType.info,
                    ),
                    Button(
                      text: '默认按钮',
                    ),
                    Button(
                      text: '危险按钮',
                      type: ButtonType.danger,
                    ),
                    Button(
                      text: '警告按钮',
                      type: ButtonType.warning,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '朴素类型',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Button(
                        text: '朴素按钮',
                        plain: true,
                        type: ButtonType.primary,
                        onClick: () {
                          print('object');
                        },
                      ),
                      Button(
                        text: '朴素按钮',
                        plain: true,
                        type: ButtonType.info,
                      )
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '细边框',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Button(
                        text: '细边框按钮',
                        plain: true,
                        hairline: true,
                        type: ButtonType.primary,
                      ),
                      Button(
                        text: '细边框按钮',
                        plain: true,
                        hairline: true,
                        type: ButtonType.info,
                      )
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '按钮形状',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Button(
                        text: '方形按钮',
                        square: true,
                        type: ButtonType.primary,
                      ),
                      Button(
                        text: '圆形按钮',
                        round: true,
                        type: ButtonType.info,
                      )
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '加载状态',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Button(
                        loading: true,
                        type: ButtonType.primary,
                      ),
                      Button(
                        loading: true,
                        loadingText: '加载中',
                        type: ButtonType.primary,
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '禁用状态',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Button(
                        disabled: true,
                        text: '禁用状态',
                        type: ButtonType.primary,
                      ),
                      Button(
                        disabled: true,
                        text: '禁用状态',
                        type: ButtonType.info,
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '图标按钮',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Button(
                        icon: Icons.headset_sharp,
                        type: ButtonType.primary,
                      ),
                      Button(
                        icon: Icons.access_alarm,
                        text: '按钮',
                        type: ButtonType.info,
                      ),
                      Button(
                        icon: Icons.access_alarm,
                        text: '按钮',
                        iconPosition: IconPositionEnum.right,
                        type: ButtonType.info,
                      ),
                      Button(
                        icon: Icons.access_alarm,
                        text: '按钮',
                        plain: true,
                        type: ButtonType.info,
                      )
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '按钮尺寸',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Button(
                        text: '大号按钮',
                        size: ButtonSize.large,
                        type: ButtonType.primary,
                      ),
                      Button(
                        text: '中号按钮',
                        size: ButtonSize.normal,
                        type: ButtonType.primary,
                      ),
                      Button(
                        text: '小号按钮',
                        size: ButtonSize.small,
                        type: ButtonType.primary,
                      ),
                      Button(
                        text: '迷你按钮',
                        size: ButtonSize.mini,
                        type: ButtonType.primary,
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '块级元素',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Button(
                        text: '块级元素',
                        block: true,
                        size: ButtonSize.large,
                        type: ButtonType.primary,
                      )
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '自定义颜色',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Button(
                        text: '自定义背景颜色',
                        color: Color(0xff00ff00),
                        size: ButtonSize.large,
                        type: ButtonType.primary,
                      ),
                      Button(
                        text: '自定义文本颜色',
                        textColor: Colors.blue,
                        type: ButtonType.primary,
                      ),
                      Button(
                        text: '自定义背景颜色😻朴素按钮',
                        textColor: Color(0xff000fff),
                        plain: true,
                        type: ButtonType.primary,
                      ),
                      Button(
                        text: '自定义颜色',
                        textColor: Colors.red,
                        hairline: true,
                        round: true,
                        plain: true,
                        type: ButtonType.primary,
                      ),
                      Button(
                        text: '渐变颜色',
                        color: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.red, Colors.blue]),
                        textColor: Colors.orange,
                        type: ButtonType.primary,
                      ),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
