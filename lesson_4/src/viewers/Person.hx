
package viewers;

import js.Browser;
import react.React;
import react.ReactDOM;
import react.ReactComponent;
import react.ReactMacro.jsx;

import core.Component;

class Person extends Component<PersonProps, State> {
    override function render(): ReactElement {
        return React.createElement(
            "div",
            { className: "four wide column" },
            React.createElement(
                "div",
                { className: "ui card" },
                React.createElement(
                    "div",
                    { className: "image" },
                    React.createElement("img", { src: props.img })
                ),
                React.createElement(
                    "div",
                    { className: "content" },
                    React.createElement(
                        "a",
                        { className: "header" },
                        props.name + " " + props.surname
                    ),
                    React.createElement(
                        "div",
                        { className: "meta" },
                        React.createElement("span", { className: "date" }, props.age + " years old")
                    ),
                    React.createElement(
                        "div",
                        { className: "description" },
                        (props.admin ? "Admin" : "Not admin")
                    )
                )
            )
        );
    }
}

typedef PersonProps = {>Props,
    var name: String;
    var surname: String;
    var img: String;
    var age: Int;
    var admin: Bool;
}
