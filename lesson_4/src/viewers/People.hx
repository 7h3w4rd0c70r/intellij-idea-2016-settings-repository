
package viewers;

import js.Browser;
import react.React;
import react.ReactDOM;
import react.ReactComponent;
import react.ReactMouseEvent;
import react.ReactKeyboardEvent;

import core.Component;
import valueObjects.PersonValueObject;
import valueObjects.PeopleValueObject;
import viewers.Person;
import viewers.NewPerson;

class People extends Component<PeopleProps, PeopleState> {
    public static function create(people: PeopleValueObject): ReactElement {
        return React.createElement(People, ({ people: people.people }: PeopleProps));
    }

    function onNewPersonSave(person: PersonValueObject): Void {
        props.people.push(person);
        forceUpdate();
    }

    override function render(): ReactElement {
        return React.createElement(
            "div",
            { style: { padding: "6rem 0 0 0" } },
            React.createElement("div", { className: "ui huge dividing header" }, "New person"),
            React.createElement(NewPerson, { onSave: onNewPersonSave }),
            React.createElement("div", { style: { padding: "3rem 0 0 0" } }),
            React.createElement("div", { className: "ui huge dividing header" }, "People"),
            React.createElement("div", { style: { padding: "0 0 3rem 0" } }),
            React.createElement(
                "div",
                { className: "ui grid container" },
                [ for (person in props.people) React.createElement(Person, { name: person.name, surname: person.surname, img: person.img, age: person.age, admin: person.admin }) ]
            )
        );
    }
}

typedef PeopleProps = {>Props,
    var people: Array<PersonValueObject>;
}

typedef PeopleState = {>State,
    @:optional var people: Array<PersonValueObject>;
}
