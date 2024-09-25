part of '../main.dart';

class CheckboxTitle extends StatefulWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CheckboxTitle({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CheckboxTitle> createState() => _CheckboxTitleState();
}

class _CheckboxTitleState extends State<CheckboxTitle> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onChanged(_isChecked);
      },
      child: Row(
        children: <Widget>[
          Text(widget.title),
          Checkbox(
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? _isChecked;
              });
              widget.onChanged(_isChecked);
            },
          ),
        ],
      ),
    );
  }
}