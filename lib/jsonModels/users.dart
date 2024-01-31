class Users {
  final int? usrId;
  final String? usrName;
  final String? usrSurname;
  final String usrEmail;
  final String usrPassword;

  Users({
    this.usrId,
    required this.usrName,
    required this.usrSurname,
    required this.usrEmail,
    required this.usrPassword,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    usrId: json["usrId"],
    usrName: json["usrName"],
    usrSurname: json["usrSurname"],
    usrEmail: json["usrEmail"],
    usrPassword: json["usrPassword"],
  );

  Map<String, dynamic> toMap() => {
    "usrId": usrId,
    "usrName": usrName,
    "usrSurname": usrSurname,
    "usrEmail": usrEmail,
    "usrPassword": usrPassword,
  };
}