import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Order _order = Order();

  String _validateItemRequired(String value) {
    return value.isEmpty ? 'Item required' : null;
  }

  String _validateItemCount(String value) {
    int _valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);
    return _valueAsInteger == 0 ? 'At least one Item is required' : null;
  }

  void _submitOrder() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Order item: ${_order.item}');
      print('Order quantity: ${_order.quantity}');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            autovalidate: true,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Item',
                      hintText: 'Espresso',
                    ),
                    validator: (value) => _validateItemRequired(value),
                    onSaved: (value) => _order.item = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      hintText: '3',
                    ),
                    validator: (value) => _validateItemCount(value),
                    onSaved: (value) => _order.quantity = int.tryParse(value),
                  ),

                  Divider(),

                  RaisedButton(
                    onPressed: () => _submitOrder(),
                    child: Text('SAVE'),
                    color: Colors.lightGreen,
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}

class Order {
  String item;
  int quantity;
}