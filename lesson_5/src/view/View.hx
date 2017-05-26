
package view;

import msignal.Signal;

class View {
    inline public static var LOADED: String = "loaded";
    inline public static var ADDED: String = "added";
    inline public static var UPDATED: String = "updated";

    private var uid: Int = 0;
    public var id(default, null): String;
    public var element(default, null): View;

    public var signal(default, null): Signal2<String, View>;

    public function new() {
        id = "view-" + (uid++);
    }

    public function dispatch(event: String, view: View) {
        if (view == null) view = this;
        signal.dispatch(event, view);
    }

    public function remove() { }
    public function update() { }

    public function showError(error: String) {
        trace(error);
    }
}
