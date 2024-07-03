enum Role {
  admin,
  user
}

extension RoleExtension on Role {
  static Role getRoleByName(String name) {
    switch (name) {
      case 'admin':
        return Role.admin;
      case 'user':
        return Role.user;


      default:
        return Role.user;
    }
  }
}

