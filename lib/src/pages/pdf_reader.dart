import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:passageiro/core/http/endpoint.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PolicyPrivacyPage extends StatefulWidget {
  const PolicyPrivacyPage({Key? key}) : super(key: key);
  static String route = 'privaceAndTerms';
  @override
  _PolicyPrivacyPageState createState() => _PolicyPrivacyPageState();
}

class _PolicyPrivacyPageState extends State<PolicyPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Política de Privacidade'),
      ),
      body: SfPdfViewer.network(httpPoliceAndTerms),

      // pdfReader(),
    );
  }

  // FutureBuilder<File> pdfReader() {
  //   return FutureBuilder<File>(
  //     future: createFileOfPdfUrl(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return const Center(
  //           child: Text(
  //             'Ocorreu um erro com o carregamento, verifique sua conexão com a internet e tente novamente!',
  //             style: TextStyle(
  //               color: Colors.black,
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //         );
  //       }
  //       if (!snapshot.hasData) {
  //         return const Center(child: CircularProgressIndicator());
  //       }

  //       return PDFView(
  //         filePath: snapshot.data!.path,
  //         defaultPage: 0,
  //         onError: (error) {
  //           debugPrint(error.toString());
  //         },
  //         onPageError: (page, error) {
  //           debugPrint('$page: ${error.toString()}');
  //         },
  //       );
  //     },
  //   );
  // }

  // Future<File> createFileOfPdfUrl() async {
  //   Completer<File> completer = Completer();
  //   debugPrint("Start download file from internet!");
  //   try {
  //     final url = httpPoliceAndTerms;
  //     final filename = url.substring(url.lastIndexOf("/") + 1);
  //     var dir = await getApplicationDocumentsDirectory();

  //     File file = File("${dir.path}/$filename");
  //     if (!(await file.exists())) {
  //       var request = await HttpClient().getUrl(Uri.parse(url));
  //       var response = await request.close();
  //       var bytes = await consolidateHttpClientResponseBytes(response);
  //       await file.writeAsBytes(bytes, flush: true);
  //     }

  //     print(file);

  //     completer.complete(file);
  //   } catch (e) {
  //     print('Error: $e');
  //     throw Exception('Error parsing asset file!');
  //   }

  //   return completer.future;
  // }
}
