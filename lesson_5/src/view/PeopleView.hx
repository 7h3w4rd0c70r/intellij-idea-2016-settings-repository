
package view;

import mmvc.api.IViewContainer;

import view.View;

class PeopleView extends View implements IViewContainer {
    override function update() {}

    override function remove() { }

    public function isAdded(view: Dynamic): Bool {
		return true;
	}
}
