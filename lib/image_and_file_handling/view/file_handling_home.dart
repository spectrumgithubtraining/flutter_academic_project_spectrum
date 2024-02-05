import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FileHandlingHome extends StatefulWidget {
  const FileHandlingHome({super.key});

  @override
  State<FileHandlingHome> createState() => _FileHandlingHomeState();
}

class _FileHandlingHomeState extends State<FileHandlingHome> {
  final _formKey = GlobalKey<FormState>();
  final _imageTitle = TextEditingController();
  final _imageDescription = TextEditingController();
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text("Image and File Handling"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 320,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _imageTitle,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.image),
                              hintStyle: const TextStyle(
                                color: Color(0xFF616161),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter title of Image",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _imageDescription,
                            minLines: 6,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(),
                              labelText: 'Enter decription',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              color: Colors.grey,
                              width: 130,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Select file",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueAccent)),
                      onPressed: () {},
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
