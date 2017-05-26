
package viewers;

import js.Browser;
import js.html.InputElement;
import js.html.InputEvent;
import js.html.Event;
import react.React;
import react.ReactDOM;
import react.ReactComponent;
import react.ReactEvent;
import react.ReactMouseEvent;
import react.ReactKeyboardEvent;

import core.Component;
import valueObjects.PersonValueObject;

class NewPerson extends Component<NewPersonProps, NewPersonState> {
    function savePerson(event: ReactMouseEvent) {
        event.preventDefault();
        var person: PersonValueObject = new PersonValueObject(state.name, state.surname, state.age, state.admin, state.img);
        props.onSave(person);
    }

    function onNameChange(event: ReactKeyboardEvent) {
        setState({ name: cast(event.target, InputElement).value });
    }

    function onSurnameChange(event: ReactKeyboardEvent) {
        setState({ surname: cast(event.target, InputElement).value });
    }

    function onImgChange(event: ReactKeyboardEvent) {
        setState({ img: cast(event.target, InputElement).value });
    }

    function onAgeChange(event: ReactKeyboardEvent) {
        setState({ age: Std.parseInt(cast(event.target, InputElement).value) });
    }

    function onAdminChange(event: ReactMouseEvent) {
        setState({ admin: cast(event.target, InputElement).checked });
    }

    override function render(): ReactElement {
        return React.createElement(
            "form",
            { className: "ui form" },
            React.createElement(
                "div",
                { className: "field" },
                React.createElement("label", { }, "Name"),
                React.createElement(
                    "div",
                    { className: "two fields" },
                    React.createElement(
                        "div",
                        { className: "field" },
                        React.createElement(
                            "input",
                            { type: "text", placeholder: "First name", onChange: onNameChange }
                        )
                    ),
                    React.createElement(
                        "div",
                        { className: "field" },
                        React.createElement(
                            "input",
                            { type: "text", placeholder: "Last name", onChange: onSurnameChange }
                        )
                    )
                )
            ),
            React.createElement(
                "div",
                { className: "field" },
                React.createElement("label", { }, "Avatar"),
                React.createElement("input", { type: "text", placeholder: "Avatar URL", onChange: onImgChange })
            ),
            React.createElement(
                "div",
                { className: "fields" },
                React.createElement(
                    "div",
                    { className: "eight wide field" },
                    React.createElement("label", { }, "Age"),
                    React.createElement(
                        "input",
                        { type: "number", placeholder: "Years of life", onChange: onAgeChange }
                    )
                ),
                React.createElement(
                    "div",
                    { className: "eight wide field" },
                    React.createElement("br"),
                    React.createElement(
                        "div",
                        { className: "ui toggle checkbox" },
                        React.createElement(
                            "input",
                            { type: "checkbox", onChange: onAdminChange }
                        ),
                        React.createElement("label", { }, "Is it admin")
                    )
                )
            ),
            React.createElement("button", { className: "ui primary button", onClick: savePerson }, "Add new person")
        );
    }
}

typedef NewPersonProps = {>Props,
    var onSave: PersonValueObject->Void;
}

typedef NewPersonState = {>State,
    @:optional var name: String;
    @:optional var surname: String;
    @:optional var img: String;
    @:optional var age: Int;
    @:optional var admin: Bool;
}
