
import msignal.Signal;
import js.Browser;
import react.React;
import react.ReactDOM;
import react.ReactComponent;
import react.ReactMacro.jsx;

import viewers.Gallery;
import loaders.Loader;

class App extends ReactComponent {
    var loader: Loader<skeletons.Gallery> = new Loader<skeletons.Gallery>(parsers.Gallery.parse, "/list.json");

    public function new(props: Dynamic) {
        super();
        state = { gallery: null };
    }

    static public function main(nodeId: String) {
        ReactDOM.render(jsx('<App />'), Browser.document.getElementById(nodeId));
    }

    override function componentDidMount() {
        loader.listen(onGalleryLoad);
        loader.load();
    }

    function onGalleryLoad(gallery: skeletons.Gallery) {
        setState({ gallery: gallery });
    }

    override function render() {
        if (state.gallery == null)
            return jsx('
                <div className="ui active page dimmer">
                    <div className="ui huge text loader">
                        Loading gallery...
                    </div>
                </div>
            ');
        
        return jsx('
            <$Gallery gallery=${state.gallery} />
        ');
    }
}
