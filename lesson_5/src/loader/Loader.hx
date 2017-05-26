
package loader;

import yloader.impl.js.XMLHttpRequestLoader;
import yloader.valueObject.Parameter;
import yloader.valueObject.Request;
import yloader.valueObject.Response;
import msignal.Signal;
import haxe.Json;
import haxe.Timer.delay;

class Loader<T> {
    var baseUrl: String = "http://localhost/people";
    var restUrl: String;
    var completed: Signal1<T>;
    var parser: Dynamic->Dynamic;

    public function new(parser: Dynamic->Dynamic, restUrl: String = "") {
        this.restUrl = restUrl;
        this.parser = parser;
        this.completed = new Signal1<T>();
    }

    public function listen(listener: Dynamic->Void) {
        completed.add(listener);
    }

    public function load() {
        var request = new Request(this.baseUrl + restUrl);
        var loader = new XMLHttpRequestLoader(request);
        loader.onResponse = onResponse;
        loader.load();
    }

    function onResponse(response: Response) {
        if (response.success) {
            var jsonParsed: Dynamic = Json.parse(response.data);
            delay(function () { completed.dispatch(parser(jsonParsed)); }, 1500);
        } else {
            trace("Error: ");
            trace(response);
        }
    }
}
