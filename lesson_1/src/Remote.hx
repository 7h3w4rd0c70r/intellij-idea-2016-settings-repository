
package lesson_1.src;

import js.Promise;
import yloader.impl.js.XMLHttpRequestLoader;
import yloader.valueObject.Parameter;
import yloader.valueObject.Request;
import yloader.valueObject.Response;

class Remote {
    var baseUrl: String;

    public function new(baseUrl: String) {
        this.baseUrl = baseUrl;
    }

    public function get(url: String) {
        return new Promise(function (resolve, reject) {
            var request = new Request(this.baseUrl + url);
            var loader = new XMLHttpRequestLoader(request);
            loader.onResponse = function (response: Response) {
                if (response.success) {
                    resolve(response.data);
                } else {
                    trace(response);
                    reject("");
                }
            }
            loader.load();
        });
    }
}
