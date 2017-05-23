
package loaders;

import yloader.impl.js.XMLHttpRequestLoader;
import yloader.valueObject.Parameter;
import yloader.valueObject.Request;
import yloader.valueObject.Response;
import msignal.Signal;

class Gallery extends loaders.Loader {
    public function new() {
        super(new Signal1<skeletons.Gallery>(), resolve, "/list.json");
    }

    public function resolve(data: Dynamic): Dynamic {
        return parsers.Gallery.parse(data);
    }

    public function listen(callback) {
        signal.add(callback);
    }
}
