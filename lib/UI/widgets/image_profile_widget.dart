import 'package:flutter/material.dart';

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({super.key, this.onTap, this.isEdit = false});

  final GestureTapCallback? onTap;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 128.0,
          width: 128.0,
          child: Stack(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 64.0,
              ),
              (!isEdit)
                  ? const SizedBox()
                  : const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Icon(
                          Icons.add_photo_alternate,
                          size: 32.0,
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
