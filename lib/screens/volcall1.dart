import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// ignore: camel_case_types
class volvideoCalling1 extends StatefulWidget {
  const volvideoCalling1({super.key});

  @override
  State<volvideoCalling1> createState() => _volvideoCalling1State();
}

// ignore: camel_case_types
class _volvideoCalling1State extends State<volvideoCalling1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ZegoUIKitPrebuiltCall(
        appID: 365566377,
        appSign:
            "a90bc5e6ddbbd706ceb86e5b02fa877cff63385528baa027759197744f198a5d",
        callID: "123",
        userID: "7410",
        userName: "Jeevan Aher",
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()
          ..onOnlySelfInRoom = (context) => Navigator.pop(context),
      )),
    );
  }
}
