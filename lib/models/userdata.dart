class UserData {
  final bool isLoggedIn;
  final String id;
  //final String name;
  final String fname;
  final String lname;
  final String emailID;
  final String userPhone;
  final String profilePicture;
  final bool isNotified, isActive;
  final String createdAt;
  final String lastLoginTime;

  UserData(
    this.isLoggedIn,
    this.id,
    //this.name,
    this.fname,
    this.lname,
    this.emailID,
    this.userPhone,
    this.profilePicture,
    this.isNotified,
    this.isActive,
    this.createdAt,
    this.lastLoginTime,
  );
}
