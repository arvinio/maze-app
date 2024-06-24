import 'package:encrypt/encrypt.dart';
import 'package:injectable/injectable.dart';
import 'package:string_validator/string_validator.dart';

import 'encryption_manager.dart';

@lazySingleton
class EncryptHelper {
  IV? iv;
  Encrypter? _encryptorPassword;

  EncryptHelper() {
    iv = IV.fromLength(16);
    var passwordKey = '${EncryptionManager().getPasswordKey()}${EncryptionManager().getPasswordKey2()}';
    _encryptorPassword = Encrypter(AES(Key.fromUtf8(passwordKey), mode: AESMode.ecb));
  }

  String? encryptCbcByPasswordKey(String? input, {String? key}) {
    if (input == null ||input == '') return '';
    return _encryptorPassword!.encrypt(input, iv: iv).base64;
  }

  String? decryptCbcByPasswordKey(String? input, {String? key}) {
    if (input == null ||input == '') return '';
    var isBase64Str=isBase64(input);
    if(isBase64Str){
      return _encryptorPassword!.decrypt(Encrypted.fromBase64(input), iv: iv);}
    else{
      return input;
    }
  }
}
