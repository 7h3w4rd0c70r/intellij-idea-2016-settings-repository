
package parsers;

import valueObjects.PeopleValueObject;
import valueObjects.PersonValueObject;
import parsers.PersonParser;

class PeopleParser {
    static public function parse(unparsed: Dynamic): PeopleValueObject {
        var people: Array<PersonValueObject>;

        if (unparsed.people != null) {
            try {
                people = PersonParser.parseMany(unparsed.people);
            } catch (e: Dynamic) {
                trace("Failed to parse people in PeopleParser.parse(unparsed: Dynamic)");
                return null;
            }
        } else {
            trace("Missing property people in PeopleParser.parse(unparsed: Dynamic)");
            return null;
        }

        return new PeopleValueObject(people);
    }
}
