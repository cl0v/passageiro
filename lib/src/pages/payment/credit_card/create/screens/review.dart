// import 'package:flutter/material.dart';

// class CreditCardReviewScreen extends StatefulWidget {
//   const CreditCardReviewScreen({Key key}) : super(key: key);

//   @override
//   _CreditCardReviewScreenState createState() => _CreditCardReviewScreenState();
// }

// class _CreditCardReviewScreenState extends State<CreditCardReviewScreen> {
//   late final CreditCardCreationController controller;

//   @override
//   void didChangeDependencies() {
//     controller = CreditCardCreationProvider.of(context).controller;
//     textTheme = Theme.of(context).textTheme;
//     super.didChangeDependencies();
//   }

//   late final TextTheme textTheme;
//   bool loading = false;

//   @override
//   Widget build(BuildContext context) {
//     return LoadingOverlay(
//       isLoading: loading,
//       progressIndicator: Shimmer.fromColors(
//         // baseColor: Colors.red,
//         // highlightColor: Colors.yellow,
//         baseColor: colorPrimary,
//         highlightColor: colorSecundary,
//         child: const Text(
//           'Buzzão',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 40.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       color: Colors.black.withOpacity(.8),
//       child: Scaffold(
//         appBar: AppBar(
//           leading: BackButton(
//             onPressed: controller.previous,
//           ),
//         ),
//         floatingActionButton: ButtonGradient(
//           text: 'Confirmar',
//           onPressed: () {
//             setState(() {
//               loading = true;
//             });
//             controller.createCard();
//           },
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         body: SafeArea(
//           minimum: const EdgeInsets.symmetric(horizontal: 20.0),
//           // child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Confirme os dados do cartão', style: textTheme.headline2),
//               const Spacer(
//                 flex: 1,
//               ),
//               Card(
//                 color: colorPurpleDarkOta,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           customField('Número', controller.number),
//                           const Spacer(),
//                           detectCCBrand(controller.number) ??
//                               const SizedBox.shrink(),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 22,
//                       ),
//                       customField('Nome do titular', controller.name),
//                       const SizedBox(height: 22),
//                       Row(children: [
//                         customField('Validade', controller.date),
//                         const Spacer(),
//                         customField('Cód. segurança', controller.code),
//                       ]),
//                     ],
//                   ),
//                 ),
//               ),
//               // const SizedBox(height: 92),
//               const Spacer(
//                 flex: 2,
//               ),
//             ],
//             // ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget customField(String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title),
//         Text(value, style: textTheme.subtitle1),
//       ],
//     );
//   }
// }
