// import 'package:flutter/material.dart';
// import 'package:passageiro/core/intl/strings.dart';
// import 'package:passageiro/src/widgets/fab.dart';

// class CreditCardDateScreen extends StatefulWidget {
//   const CreditCardDateScreen({Key? key}) : super(key: key);

//   @override
//   _CreditCardDateScreenState createState() => _CreditCardDateScreenState();
// }

// class _CreditCardDateScreenState extends State<CreditCardDateScreen> {
//   late final TextEditingController tDate;

//   late final CreditCardCreationController controller;
//   late final TextTheme textTheme;

//   final mask = CustomMasks.expirationDateMask;

//   bool isValid = false;

//   @override
//   void initState() {
//     tDate = TextEditingController();
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     controller = CreditCardCreationProvider.of(context).controller;
//     tDate.text = controller.date ?? '';
//     isValid = controller.date != null;
//     textTheme = Theme.of(context).textTheme;
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     tDate.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: CustomFabExtended(
//         label: next,
//         onPressed: isValid ? () => controller.setDate(tDate.text) : null,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       appBar: AppBar(
//         leading: BackButton(
//           onPressed: controller.previous,
//         ),
//       ),
//       body: SafeArea(
//           minimum: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Insira a data de validade do cartão',
//                   style: textTheme.headline2),
//               const Spacer(
//                 flex: 1,
//               ),
//               Row(
//                 children: [
//                   const Spacer(),
//                   Flexible(
//                     flex: 2,
//                     child: TextField(
//                       controller: tDate,
//                       autofocus: true,
//                       inputFormatters: [mask],
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       decoration: const InputDecoration(hintText: '06/25'),
//                       textInputAction: TextInputAction.send,
//                       style: textTheme.bodyText1,
//                       onChanged: validate,
//                     ),
//                   ),
//                   const Spacer(
//                     flex: 1,
//                   ),
//                 ],
//               ),
//               const Flexible(
//                 child: SizedBox(
//                   height: 34,
//                 ),
//               ),
//               const Spacer(
//                 flex: 2,
//               ),
//             ],
//           )),
//     );
//   }

//   validate(String value) {
//     if (value.length <= 4) {
//       if (isValid) {
//         setState(() {
//           isValid = false;
//         });
//       }
//       return;
//     }
//     DateFormat _cardDateFormat = DateFormat('MM/yy');
//     try {
//       if (int.parse(value.substring(0, 2)) > 12) {
//         return false;
//       }
//       DateTime date = _cardDateFormat
//           .parse('${value.substring(0, 3)}20${value.substring(3, 5)}');
//       DateTime now = DateTime.now();
//       bool valid = now.isBefore(date) ||
//           (now.month == date.month && now.year == date.year);
//       setState(() {
//         isValid = valid;
//       });
//     } catch (e) {
//       setState(() {
//         isValid = false;
//       });
//     }
//   }
// }
