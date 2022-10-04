// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({super.key});

  final String _title = "Crate Your First Note";
  final String _description = "Add a Note";
  final _createNote = "Create a Note";
  final _importNotes = "Import Note";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Center(
          child: Column(
            children: [
              const ProjectImagePng(name: ProjectImageItems.appleBook),
              TitleWidget(title: _title),
              Padding(
                padding: PaddingItems.verticalPadding,
                child: DescriptoonWidget(description: _description * 10),
              ),
              const Spacer(),
              CreatedButton(createNote: _createNote),
              createdTextButton(),
              const SizedBox(height: ButtonHeight.buttonNomralHeigt),
            ],
          ),
        ),
      ),
    );
  }

  TextButton createdTextButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        _importNotes,
      ),
    );
  }
}

class CreatedButton extends StatelessWidget {
  const CreatedButton({
    Key? key,
    required String createNote,
  })  : _createNote = createNote,
        super(key: key);

  final String _createNote;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        height: ButtonHeight.buttonNomralHeigt,
        child: Center(
          child: Text(
            _createNote,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}

class DescriptoonWidget extends StatelessWidget {
  const DescriptoonWidget({
    Key? key,
    required this.description,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String description;

  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
      textAlign: textAlign,
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline4?.copyWith(
            color: Colors.pink[900],
            fontWeight: FontWeight.w700,
          ),
    );
  }
}

class ProjectImagePng extends StatelessWidget {
  final String name;
  const ProjectImagePng({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(_imagePath, height: 300);
  }

  String get _imagePath => "assets/png/$name.png";
}

class PaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
  static const EdgeInsets paddingAll = EdgeInsets.all(20);
}

class ProjectImageItems {
  static const String appleBook = "ic_apple_with_school";
}

class ButtonHeight {
  static const double buttonNomralHeigt = 50;
}
