
class Student {

  String lastName;
  String firstName;
  DateTime birthDate;

  Student(this.lastName, this.firstName, this.birthDate);

  @override
  String toString() {
    return lastName.toUpperCase() + ' ' + firstName;
  }

  int getAge() {
    return DateTime.now().year - birthDate.year;
  }

}