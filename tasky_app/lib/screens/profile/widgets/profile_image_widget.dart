import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasky_app/core/controllers/user_controller.dart';

class ProfileImageWidget extends StatelessWidget{
  const ProfileImageWidget({super.key});

  
  Future<void> _saveImage(XFile file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final newFile = await File(file.path).copy('${appDir.path}/${file.name}');
    UserController.setUserImage(newFile.path);
  }

  void _showImageSourceDialog(
    BuildContext context,
    Function(XFile file) selectFile,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Select image from :',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context);

                XFile? image = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  selectFile(image);
                }
              },
              child: Row(
                children: [
                  Icon(Icons.image),
                  SizedBox(width: 10),
                  Text('Gallery'),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context);
                XFile? image = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                );
                if (image != null) {
                  selectFile(image);
                }
              },
              child: Row(
                children: [
                  Icon(Icons.camera_alt),
                  SizedBox(width: 10),
                  Text('Camera'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: UserController.userImageNotifier,
      builder: (_, profileImagePath, _) {
        return CircleAvatar(
          backgroundImage: profileImagePath == null
              ? AssetImage('assets/images/user.png')
              : FileImage(File(profileImagePath)),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          radius: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 60, top: 60),
            child: GestureDetector(
              onTap: () {
                _showImageSourceDialog(context, (XFile file) async {
                  await _saveImage(file);
                });
              },
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: BoxBorder.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 26,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
