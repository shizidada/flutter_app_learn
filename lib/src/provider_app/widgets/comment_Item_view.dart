import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/provider_app/mock/riches_page_mock_data.dart';
import 'package:flutter_app_learn/src/provider_app/provider/comment_provider.dart';
import 'package:flutter_app_learn/src/provider_app/utils/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:provider/provider.dart';

class CommentItemView extends StatefulWidget {
  CommentItemView({Key key}) : super(key: key);

  @override
  _CommentItemViewState createState() => _CommentItemViewState();
}

class _CommentItemViewState extends State<CommentItemView> {
  TextEditingController textEditingController;

  FocusNode nodeText;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    nodeText = FocusNode();
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: nodeText,
          // footerBuilder: (_) => PreferredSize(
          //     child: SizedBox(
          //         height: 40,
          //         child: Center(
          //           child: Text('Custom Footer'),
          //         )),
          //     preferredSize: Size.fromHeight(40)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    CommentProvider commentProvider = Provider.of<CommentProvider>(context);
    List<CommentInfo> commentInfos = commentProvider.commentInfos;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0.0,
        backgroundColor: Colors.grey[50],
        title: Center(
          child: Text(
            "${commentInfos.length}条评论",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: KeyboardActions(
        config: _buildConfig(context),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: ScreenUtil.getInstance().setHeight(500),
                child: ListView.builder(
                  itemCount: commentInfos.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    CommentInfo commentInfo = commentInfos[index];
                    return ListTile(
                      title: Text(
                        commentInfo.userName,
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(commentInfo.commentContent,
                          style: TextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      leading: Image.network(commentInfo.avator),
                      trailing: Icon(Icons.reply),
                    );
                  },
                ),
              ),
              Container(
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.sentiment_satisfied),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextField(
                        focusNode: nodeText,
                        decoration: InputDecoration(
                          hintText: "请输入评论",
                        ),
                        controller: textEditingController,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          sendCommnet(commentProvider, context);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  sendCommnet(CommentProvider commentProvider, BuildContext context) {
    String comment = textEditingController.text;
    if (comment == "") {
      return ToastUtil.showToast(message: "请输入评论");
    }

    CommentInfo commentInfo = CommentInfo(
        id: "5e0ee9c032d14098b62297ff",
        avator:
            'https://p2.music.126.net/6BtIzcTnGuJ1jQFnBPLRmg==/109951164157960782.jpg?param=50y50',
        userId: "56565656565656565",
        userName: "江景",
        commentContent: comment);
    commentProvider.addComment(commentInfo);
    textEditingController.text = "";
    // Navigator.pop(context);
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
