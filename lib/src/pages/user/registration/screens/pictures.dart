import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/widgets/fab.dart';

import '../controller.dart';
import '../provider.dart';

final _values = [
  'selfie',
  'front',
  'back',
];

final _titles = {
  _values[0]: 'Selfie',
  _values[1]: 'Frente do documento',
  _values[2]: 'Costas do documento',
};

var _state = {
  _values[0]: false,
  _values[1]: false,
  _values[2]: false,
};

enum DocumentType {
  RG,
  CNH,
}

class UserRegistrationPicturesScreen extends StatefulWidget {
  const UserRegistrationPicturesScreen({Key? key}) : super(key: key);

  @override
  State<UserRegistrationPicturesScreen> createState() =>
      _UserRegistrationPicturesScreenState();
}

class _UserRegistrationPicturesScreenState
    extends State<UserRegistrationPicturesScreen> {
  DocumentType documentType = DocumentType.RG;
  late final UserRegistrationController controller;

  @override
  void didChangeDependencies() {
    controller = UserRegistrationProvider.of(context)!;
    super.didChangeDependencies();
  }

  _onNextPressed() {}

  _onTap(String title) {
    ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _state[title] = !_state[title]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        onPressed: _onNextPressed,
        label: continueNext,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Text(
              'Envie uma foto dos seguintes documentos.',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            ..._values
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12.0, 8, 0),
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.upload_rounded),
                        trailing: _state[e] ?? false
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.warning_rounded,
                                color: Colors.yellow,
                              ),
                        onTap: () => _onTap(e),
                        title: Text(_titles[e]!),
                      ),
                    ),
                  ),
                )
                .toList(),
            RadioListTile<DocumentType>(
              value: DocumentType.RG,
              groupValue: documentType,
              onChanged: (DocumentType? type) {
                setState(() {
                  documentType = type ?? documentType;
                });
              },
              title: const Text('Identidade'),
            ),
            RadioListTile<DocumentType>(
              value: DocumentType.CNH,
              groupValue: documentType,
              onChanged: (DocumentType? type) {
                setState(() {
                  documentType = type ?? documentType;
                });
              },
              title: const Text('Carteira de motorista'),
            ),
          ],
        ),
      ),
    );
  }
}
