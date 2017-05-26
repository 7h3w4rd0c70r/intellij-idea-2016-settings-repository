
package valueObjects;

import valueObjects.PersonValueObject;

class PeopleValueObject {
    public var people(default, null): Array<PersonValueObject>;

    public function new(people: Array<PersonValueObject>) {
        this.people = people;
    }
}
