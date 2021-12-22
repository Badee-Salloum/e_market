import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_market/db/category.dart';
import 'package:e_market/db/brand.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:e_market/db/products.dart';

class AddProduect extends StatefulWidget {
  @override
  _AddProduectState createState() => _AddProduectState();
}

ProductService _productService = ProductService();
BrandService _brandService = BrandService();
CategoryService _categoryService = CategoryService();
List<DocumentSnapshot> brands = [];
List<DocumentSnapshot> categories = [];
List<DropdownMenuItem<String>> categoriesDropDown = [];
List<DropdownMenuItem<String>> brandsDropDown = [];
TextEditingController nameController = TextEditingController();
late XFile? _fileImage1;
bool fileImage1 = false;
late XFile? _fileImage2;
bool fileImage2 = false;
late XFile? _fileImage3;
bool fileImage3 = false;

late String _currentCategory;
bool done = false;
late String _currentBrand;
bool showspinner = true;
String? _text = '';
void _getCategory() async {
  List<DocumentSnapshot> data = await _categoryService.getCategory();
  categories = data;
  showspinner = false;
}

List<DropdownMenuItem<String>> getCategoriesDropDown() {
  List<DropdownMenuItem<String>> items = [];
  for (DocumentSnapshot category in categories) {
    items.add(DropdownMenuItem(
      child: Text(category['category']),
      value: category['category'],
    ));
  }
  return items;
}

List<DropdownMenuItem<String>> getBrandsDropDown() {
  List<DropdownMenuItem<String>> items = [];
  for (DocumentSnapshot brand in brands) {
    items.add(DropdownMenuItem(
      child: Text(brand['brand']),
      value: brand['brand'],
    ));
  }
  return items;
}

class _AddProduectState extends State<AddProduect> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((value) async {
      categories = await _categoryService.getCategory();
      brands = await _brandService.getBrands();
      categoriesDropDown = getCategoriesDropDown();
      brandsDropDown = getBrandsDropDown();

      sleep(const Duration(seconds: 3));
      setState(() {
        showspinner = false;
        _currentCategory = categoriesDropDown[0].value!;
        _currentBrand = brandsDropDown[0].value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Colors.red.shade900,
          ),
        ),
        title: Text(
          'Add product',
          style: TextStyle(
            color: Colors.red.shade900,
          ),
        ),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      onPressed: () {
                        _selectedImage(1);
                      },
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 2.5,
                      ),
                      child: _display1(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      onPressed: () {
                        _selectedImage(2);
                      },
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 2.5,
                      ),
                      child: _display2(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      onPressed: () {
                        _selectedImage(3);
                      },
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 2.5,
                      ),
                      child: _display3(),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Product name'),
                onChanged: (value) {
                  _text = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text('Category'),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: DropdownButton(
                      value: categoriesDropDown.isEmpty
                          ? 'sads'
                          : _currentCategory,
                      items: getCategoriesDropDown(),
                      onChanged: (String? value) {
                        setState(() {
                          _currentCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text('Brand'),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: DropdownButton(
                      value: brandsDropDown.isEmpty ? 'sads' : _currentBrand,
                      items: getBrandsDropDown(),
                      onChanged: (String? value) {
                        setState(() {
                          _currentBrand = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Add product'),
                onPressed: () {
                  validateAndUpload();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectedImage(int imageNumber) async {
    XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    print(selectedImage);
    switch (imageNumber) {
      case 1:
        {
          setState(() {
            _fileImage1 = selectedImage;
            fileImage1 = true;
          });
          break;
        }
      case 2:
        {
          setState(() {
            _fileImage2 = selectedImage;
            fileImage2 = true;
          });
          break;
        }
      case 3:
        {
          setState(() {
            _fileImage3 = selectedImage;
            fileImage3 = true;
          });
          break;
        }
    }
  }

  Widget _display1() {
    if (fileImage1 == false) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 40, 14, 40),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        File(_fileImage1!.path),
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _display2() {
    if (fileImage2 == false) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 40, 14, 40),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(File(_fileImage2!.path));
    }
  }

  Widget _display3() {
    if (fileImage3 == false) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 40, 14, 40),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(File(_fileImage3!.path));
    }
  }

  void validateAndUpload() {
    if (fileImage1 && fileImage2 && fileImage3) {
      if (_text == '') {
        Fluttertoast.showToast(msg: 'Enter the product name');
      } else {
        setState(() {
          showspinner = true;
        });
        final FirebaseStorage storage = FirebaseStorage.instance;
        String imageURL1;
        String imageURL2;
        String imageURL3;

        final String picture1 = '1${DateTime.now().millisecond.toString()}.jpg';
        Reference ref = storage.ref().child(picture1);
        UploadTask task1 = ref.putFile(File(_fileImage1!.path));
        task1.whenComplete(() async => imageURL1 = await ref.getDownloadURL());

        final String picture2 = '2${DateTime.now().millisecond.toString()}.jpg';
        ref = storage.ref().child(picture2);
        UploadTask task2 = ref.putFile(File(_fileImage2!.path));
        task2.whenComplete(() async => imageURL2 = await ref.getDownloadURL());

        final String picture3 = '3${DateTime.now().millisecond.toString()}.jpg';
        ref = storage.ref().child(picture3);
        UploadTask task3 = ref.putFile(File(_fileImage1!.path));
        task2.whenComplete(() async {
          imageURL2 = await ref.getDownloadURL().whenComplete(() {
            setState(() {
              showspinner = false;
            });
            Fluttertoast.showToast(msg: 'Done!');
          });
        });
      }
    } else {
      Fluttertoast.showToast(msg: 'all the images must be provided');
    }
  }
}
