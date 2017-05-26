
package mediator;

import mmvc.impl.Mediator;

import valueObject.PeopleValueObject;
import view.View;
import view.PeopleView;

class PeopleMediator extends Mediator<PeopleView> {
    //@inject public var loadPeople: LoadPeople;

    var people: PeopleValueObject;

    public function new() {
        super();
    }

    override function onRegister() {
        mediate(view.signal.add(viewHandler));
    }

    override function onRemove() {
        super.onRemove();
    }

    function loadCompleted(people: PeopleValueObject) {
        this.people = people;
    }

    function loadFailed(error: Dynamic) {
        view.showError(Std.string(error));
    }

    function viewHandler(event: String, view: View) {

    }
}
