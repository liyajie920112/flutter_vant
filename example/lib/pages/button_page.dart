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
          padding: const EdgeInsets.all(8.0),
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
                      type: buttonType.primary,
                    ),
                    Button(
                      text: '信息按钮',
                      type: buttonType.info,
                    ),
                    Button(
                      text: '默认按钮',
                    ),
                    Button(
                      text: '危险按钮',
                      type: buttonType.danger,
                    ),
                    Button(
                      text: '警告按钮',
                      type: buttonType.warning,
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
                        type: buttonType.primary,
                      ),
                      Button(
                        text: '朴素按钮',
                        plain: true,
                        type: buttonType.info,
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
                        text: '朴素按钮',
                        plain: true,
                        hairline: true,
                        type: buttonType.primary,
                      ),
                      Button(
                        text: '朴素按钮',
                        plain: true,
                        hairline: true,
                        type: buttonType.info,
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
                        type: buttonType.primary,
                      ),
                      Button(
                        text: '圆形按钮',
                        round: true,
                        type: buttonType.info,
                      )
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
                        type: buttonType.primary,
                      ),
                      Button(
                        icon: Icons.access_alarm,
                        text: '按钮',
                        type: buttonType.info,
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
                        size: buttonSize.large,
                        type: buttonType.primary,
                      ),
                      Button(
                        text: '中号按钮',
                        size: buttonSize.normal,
                        type: buttonType.primary,
                      ),
                      Button(
                        text: '小号按钮',
                        size: buttonSize.small,
                        type: buttonType.primary,
                      ),
                      Button(
                        text: '迷你按钮',
                        size: buttonSize.mini,
                        type: buttonType.primary,
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
                        size: buttonSize.large,
                        type: buttonType.primary,
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
                        text: '自定义颜色',
                        color: Color(0xffff0000),
                        size: buttonSize.large,
                        type: buttonType.primary,
                      ),
                      Button(
                        text: '单色按钮',
                        color: Color(0xffff0000),
                        plain: true,
                        type: buttonType.primary,
                      ),
                      Button(
                        text: '自定义颜色',
                        color: Colors.orange,
                        hairline: true,
                        round: true,
                        plain: true,
                        type: buttonType.primary,
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
