
package loaders;

import yloader.impl.js.XMLHttpRequestLoader;
import yloader.valueObject.Parameter;
import yloader.valueObject.Request;
import yloader.valueObject.Response;
import msignal.Signal;
import haxe.Json;

class Loader<T> {
    var baseUrl: String = "http://localhost/gallery";
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
            haxe.Timer.delay(function () { completed.dispatch(parser(jsonParsed)); }, 1500);
        } else {
            trace("Error: ");
            trace(response);
        }
    }
}
