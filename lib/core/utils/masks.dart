import 'package:easy_mask/easy_mask.dart';


class CustomMasks{

static TextInputMask get cpfMask => TextInputMask(mask: ['999.999.999-99']);
static TextInputMask get creditCardMask => TextInputMask(mask: ['9999 9999 9999 9999']);
static TextInputMask get expirationDateMask => TextInputMask(mask: ['99/99']);

static String clearMask(String maskedText, TextInputMask mask) =>
    mask.magicMask.clearMask(maskedText);
}

