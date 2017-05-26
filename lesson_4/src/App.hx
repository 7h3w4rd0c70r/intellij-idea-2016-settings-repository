
import msignal.Signal;
import js.Browser;
import react.React;
import react.ReactDOM;
import react.ReactComponent;
import react.ReactMacro.jsx;

import core.Component;
import loaders.Loader;
import valueObjects.PeopleValueObject;
import parsers.PeopleParser;
import viewers.People;

class App extends Component<Props, AppState> {
    var loader: Loader<PeopleValueObject> = new Loader<PeopleValueObject>(PeopleParser.parse, "/people.json");
    var peopleLoading: Bool = true;

    public static function create(nodeId: String) {
        ReactDOM.render(
            React.createElement(App),
            Browser.document.getElementById(nodeId)
        );
    }

    override function componentDidMount() {
        loader.listen(onPeopleLoad);
        loader.load();
    }

    function onPeopleLoad(people: PeopleValueObject) {
        peopleLoading = false;
        setState(({ people: people }: AppState));
    }

    override function render(): ReactElement {
        if (peopleLoading) {
            return React.createElement(
                "div",
                { className: "ui active page dimmer" },
                React.createElement(
                    "div", 
                    { className: "ui huge text loader" },
                    "Loading people..."
                )
            );
        }

        return React.createElement(
            "div",
            { className: "ui container" },
            People.create(state.people)
        );
    }
}

typedef AppState = {>State,
    @:optional var people: PeopleValueObject;
}
