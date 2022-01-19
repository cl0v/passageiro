class VirtualCardFromServer {
  List<Wallets>? wallets;
  String? card;
  Null? cashierTransactions;
  List<Refills>? refills;
  int? expiration;

  VirtualCardFromServer(
      {this.wallets,
      this.card,
      this.cashierTransactions,
      this.refills,
      this.expiration});

  VirtualCardFromServer.fromJson(Map<String, dynamic> json) {
    if (json['wallets'] != null) {
      wallets = <Wallets>[];
      json['wallets'].forEach((v) {
        wallets!.add(new Wallets.fromJson(v));
      });
    }
    card = json['card'];
    cashierTransactions = json['cashierTransactions'];
    if (json['refills'] != null) {
      refills = <Refills>[];
      json['refills'].forEach((v) {
        refills!.add(new Refills.fromJson(v));
      });
    }
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wallets != null) {
      data['wallets'] = this.wallets!.map((v) => v.toJson()).toList();
    }
    data['card'] = this.card;
    data['cashierTransactions'] = this.cashierTransactions;
    if (this.refills != null) {
      data['refills'] = this.refills!.map((v) => v.toJson()).toList();
    }
    data['expiration'] = this.expiration;
    return data;
  }
}

class Wallets {
  int? vCardPurseId;
  List<int>? classIds;
  int? balance;
  int? refillCounter;

  Wallets({this.vCardPurseId, this.classIds, this.balance, this.refillCounter});

  Wallets.fromJson(Map<String, dynamic> json) {
    vCardPurseId = json['vCardPurseId'];
    classIds = json['classIds'].cast<int>();
    balance = json['balance'];
    refillCounter = json['refillCounter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vCardPurseId'] = this.vCardPurseId;
    data['classIds'] = this.classIds;
    data['balance'] = this.balance;
    data['refillCounter'] = this.refillCounter;
    return data;
  }
}

class Refills {
  int? value;
  int? counter;
  int? samPurseId;
  int? vCardPurseId;
  String? cryptogram;

  Refills(
      {this.value,
      this.counter,
      this.samPurseId,
      this.vCardPurseId,
      this.cryptogram});

  Refills.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    counter = json['counter'];
    samPurseId = json['samPurseId'];
    vCardPurseId = json['vCardPurseId'];
    cryptogram = json['cryptogram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['counter'] = this.counter;
    data['samPurseId'] = this.samPurseId;
    data['vCardPurseId'] = this.vCardPurseId;
    data['cryptogram'] = this.cryptogram;
    return data;
  }
}