import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/Product.dart';
import 'package:shopapp/provider/ProductProvider.dart';

class ManageProductScreen extends StatefulWidget {
  static const routeName = '/add-product';

  @override
  _ManageProductScreenState createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  final _priceFocus = FocusNode();
  final _descFocus = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocus = FocusNode();
  final _form = GlobalKey<FormState>();
  var _product = Product(
    id: null,
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );

  @override
  void initState() {
    _imageUrlFocus.addListener(_updateImageUrl);
    super.initState();
  }

  var _isInit = true;
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final editProduct = ModalRoute.of(context).settings.arguments as Product;
      if (editProduct != null) {
        _product = editProduct;
        _initValues = {
          'title': _product.title,
          'description': _product.description,
          'price': _product.price.toString(),
          'imageUrl': '',
        };
        _imageUrlController.text = _product.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocus.removeListener(_updateImageUrl);
    _priceFocus.dispose();
    _descFocus.dispose();
    _imageUrlController.dispose();
    _imageUrlFocus.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocus.hasFocus) {
      if (!_imageUrlController.text.startsWith('http') &&
          !_imageUrlController.text.startsWith('https')) {
        return;
      }
      setState(() {});
    }
  }

  void _saveFormInput() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_product.id != null) {
      Provider.of<ProductProvider>(context, listen: false)
          .editProduct(_product);
    } else {
      Provider.of<ProductProvider>(context, listen: false).addProduct(_product);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                _saveFormInput();
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Product Name'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_priceFocus),
                validator: (val) {
                  return val.isEmpty ? 'Please enter title' : null;
                },
                onSaved: (value) {
                  _product = Product(
                      id: _product.id,
                      title: value,
                      description: _product.description,
                      price: _product.price,
                      imageUrl: _product.imageUrl,
                      isFavorite: _product.isFavorite);
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Product Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocus,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descFocus),
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please enter price';
                  }
                  if (double.tryParse(val) == null) {
                    return 'Please enter valid price';
                  }
                  if (double.parse(val) <= 0) {
                    return 'Please enter price grater than 0';
                  }
                  return null;
                },
                onSaved: (value) {
                  _product = Product(
                      id: _product.id,
                      title: _product.title,
                      description: _product.description,
                      price: double.parse(value),
                      imageUrl: _product.imageUrl,
                      isFavorite: _product.isFavorite);
                },
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(labelText: 'Product Description'),
                maxLines: 3,
                focusNode: _descFocus,
                keyboardType: TextInputType.multiline,
                validator: (val) {
                  return val.isEmpty ? 'Please enter description' : null;
                },
                onSaved: (value) {
                  _product = Product(
                      id: _product.id,
                      title: _product.title,
                      description: value,
                      price: _product.price,
                      imageUrl: _product.imageUrl,
                      isFavorite: _product.isFavorite);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocus,
                      onFieldSubmitted: (_) {
                        _saveFormInput();
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a url';
                        }
                        if (!val.startsWith('http') &&
                            !val.startsWith('https')) {
                          return 'Please enter a valid url';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _product = Product(
                            id: _product.id,
                            title: _product.title,
                            description: _product.description,
                            price: _product.price,
                            imageUrl: value,
                            isFavorite: _product.isFavorite);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
