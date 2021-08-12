import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    @required String hintText,
    TextEditingController controller,
    Function onSaved,
    Function validator,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
    Key key,
  })  : _hintText = hintText,
        _padding = padding,
        _controller = controller,
        _onSaved = onSaved,
        _validator = validator,
        super(key: key);

  final String _hintText;
  final TextEditingController _controller;
  final EdgeInsets _padding;
  final Function _validator;
  final Function _onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: kFillColorForth,
        shape: BoxShape.rectangle,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: Colors.black12,
          ),
          contentPadding: _padding,
        ),
        validator: _validator,
        onSaved: _onSaved,
        controller: _controller,
      ),
    );
  }
}
