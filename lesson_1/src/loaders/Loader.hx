
package loaders;

import yloader.impl.js.XMLHttpRequestLoader;
import yloader.valueObject.Parameter;
import yloader.valueObject.Request;
import yloader.valueObject.Response;
import msignal.Signal;
import haxe.Json;

class Loader {
    var baseUrl: String = "http://localhost/gallery";
    var restUrl: String;
    var signal: Dynamic;
    var parser: Dynamic->Dynamic;

    public function new(signal: Dynamic, parser: Dynamic->Dynamic, restUrl: String = "") {
        this.restUrl = restUrl;
        this.signal = signal;
        this.parser = parser;
    }

    public function load() {
        var request = new Request(this.baseUrl + restUrl);
        var loader = new XMLHttpRequestLoader(request);
        
        loader.onResponse = onResponse;

        loader.load();
    }

    function onResponse (response: Response) {
        if (response.success) {
            signal.dispatch(parser(Json.parse(response.data)));
        } else {
            trace("Error: ");
            trace(response);
        }
    }
}
