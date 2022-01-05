// import 'package:flutter/material.dart';
// import 'package:passageiro/src/widgets/fab.dart';

// class CreditCardNumberScreen extends StatefulWidget {
//   const CreditCardNumberScreen({Key key}) : super(key: key);

//   @override
//   _CreditCardNumberScreenState createState() => _CreditCardNumberScreenState();
// }

// class _CreditCardNumberScreenState extends State<CreditCardNumberScreen> {
//   late final CreditCardCreationController controller;
//   late final TextTheme textTheme;

//   late final TextEditingController tNum;
//   final TextInputMask mask = CustomMasks.creditCardMask;

//   bool isValid = false;

//   @override
//   void initState() {
//     tNum = TextEditingController();
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     controller = CreditCardCreationProvider.of(context).controller;
//     tNum.text = controller.number ?? '';
//     isValid = controller.number != null;
//     textTheme = Theme.of(context).textTheme;
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     tNum.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       floatingActionButton: CustomFabExtended(
//           label: 'Continuar',
//           onPressed: isValid ? () => controller.setNumber(tNum.text) : null),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       body: SafeArea(
//         minimum: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Insira o número do cartão de crédito',
//                 style: textTheme.headline2),
//             const Spacer(
//               flex: 1,
//             ),
//             TextField(
//               controller: tNum,
//               autofocus: true,
//               inputFormatters: [mask],
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               textInputAction: TextInputAction.send,
//               decoration:
//                   const InputDecoration(hintText: '0000 0000 0000 0000'),
//               style: textTheme.bodyText1,
//               onChanged: validate,
//             ),
//             const Flexible(
//               child: SizedBox(
//                 height: 34,
//               ),
//             ),
//             const Spacer(
//               flex: 3,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void validate(String value) {
//     if (value.length < '9999 9999 9999 9999'.length) {
//       if (isValid) {
//         setState(() {
//           isValid = false;
//         });
//       }
//       return;
//     }
//     final String txt = CustomMasks.clearMask(value, mask);
//     var card = CreditCardValidator.getCard(txt);
//     debugPrint(card[CreditCardValidator.cardType]);
//     setState(() {
//       isValid = luhn.validate(txt);
//     });
//   }
// }
