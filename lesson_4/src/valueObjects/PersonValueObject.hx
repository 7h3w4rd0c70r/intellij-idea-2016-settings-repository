
package valueObjects;

class PersonValueObject {
    public var name(default, null): String;
    public var surname(default, null): String;
    public var age(default, null): Int;
    public var admin(default, null): Bool;
    public var img(default, null): String;

    public function new(name: String = "", surname: String = "", age: Int = 0, admin: Bool = false, img: String = "") {
        this.name = name;
        this.surname = surname;
        this.age = age;
        this.admin = admin;
        this.img = img;
    }

    public function updateName(name: String):       PersonValueObject { return new PersonValueObject(name, surname, age, admin, img); }
    public function updateSurname(surname: String): PersonValueObject { return new PersonValueObject(name, surname, age, admin, img); }
    public function updateAge(age: Int):            PersonValueObject { return new PersonValueObject(name, surname, age, admin, img); }
    public function updateAdmin(admin: Bool):       PersonValueObject { return new PersonValueObject(name, surname, age, admin, img); }
    public function updateImg(img: String):         PersonValueObject { return new PersonValueObject(name, surname, age, admin, img); }
}
