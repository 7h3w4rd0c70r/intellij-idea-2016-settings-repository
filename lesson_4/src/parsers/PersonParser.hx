
package parsers;

import valueObjects.PersonValueObject;

class PersonParser {
    static public function parse(unparsed: Dynamic): PersonValueObject {
        var name: String;
        var surname: String;
        var age: Int;
        var admin: Bool;
        var img: String;

        if (unparsed.name != null) {
            name = unparsed.name;
        } else {
            trace("Missing property name in PersonParser.parse(unparsed: Dynamic)");
            return null;
        }

        if (unparsed.surname != null) {
            surname = unparsed.surname;
        } else {
            trace("Missing property surname in PersonParser.parse(unparsed: Dynamic)");
            return null;
        }

        if (unparsed.age != null) {
            age = unparsed.age;
        } else {
            trace("Missing property age in PersonParser.parse(unparsed: Dynamic)");
            return null;
        }

        if (unparsed.admin != null) {
            admin = unparsed.admin;
        } else {
            trace("Missing property admin in PersonParser.parse(unparsed: Dynamic)");
            return null;
        }

        if (unparsed.img != null) {
            img = unparsed.img;
        } else {
            trace("Missing property img in Iage.parse(unparsed: Dynamic)");
            return null;
        }

        return new PersonValueObject(name, surname, age, admin, img);
    }

    static public function parseMany(unparsed: Array<Dynamic>): Array<PersonValueObject> {
        var people: Array<PersonValueObject> = [ ];
        
        for (person in unparsed) {
            people.push(PersonParser.parse(person));
        }

        return people;
    }
}
