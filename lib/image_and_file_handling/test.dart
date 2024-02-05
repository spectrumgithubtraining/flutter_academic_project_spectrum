// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// class PermissionHandler extends StatefulWidget {
//   const PermissionHandler({Key? key}) : super(key: key);
//   @override
//   State<PermissionHandler> createState() => _PermissionHandlerState();
// }
// class _PermissionHandlerState extends State<PermissionHandler> {
//   bool? permissionGranted;
//   String? imageUrl;
//   List<UploadTask> _uploadTasks = [];
//   final _firebaseStorage = FirebaseStorage.instance;
//   _getFromGallery() async {
//     try {
//       XFile? pickedFile = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//         maxWidth: 1800,
//         maxHeight: 1800,
//       );
//       if (pickedFile != null) {
//         File imageFile = File(pickedFile.path);
// // You can use the 'imageFile' here for further processing ordisplay.
//         UploadTask uploadTask =
//         _firebaseStorage.ref().child('images/imageName').putFile(imageFile);
//         TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});
//         var downloadUrl = await snapshot.ref.getDownloadURL();
//         setState(() {
//           imageUrl = downloadUrl;
//         });
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Permission handler'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               _getFromGallery();
//             },
//             child: Text('Request Storage Permission'),
//           ),
//           Center(
//             child: Container(
//               width: 200, // Set your desired width
//               height: 200, // Set your desired height
//               child: (imageUrl != null)
//                   ? Image.network(imageUrl!)
//                   : Image.network('https://i.imgur.com/sUFH1Aq.png'),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }