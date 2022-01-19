import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  AssetEntity? entity;
  Uint8List? data;

  Future<void> pick(BuildContext context) async {
    final Size size = MediaQuery.of(context).size;
    final double scale = MediaQuery.of(context).devicePixelRatio;
    print("scale $scale");
    try {
      final AssetEntity? _entity = await CameraPicker.pickFromCamera(
        context,
        enableRecording: true,
      );
      if (_entity != null && entity != _entity) {
        entity = _entity;
        if (mounted) {
          setState(() {});
        }
        data = await _entity.thumbDataWithSize(
          (size.width * scale).toInt(),
          (size.height * scale).toInt(),
        );
        if (mounted) {
          setState(() {});
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      pick(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WeChat Camera Picker Demo')),
      body: Stack(
        children: <Widget>[
          if (entity != null && data != null)
            Positioned.fill(child: Image.memory(data!, fit: BoxFit.contain))
          else if (entity != null && data == null)
            const Center(child: CircularProgressIndicator())
          else
            const Center(child: Text('Click the button to start picking.')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pick(context),
        tooltip: 'Increment',
        child: const Icon(Icons.camera_enhance),
      ),
    );
  }
}
