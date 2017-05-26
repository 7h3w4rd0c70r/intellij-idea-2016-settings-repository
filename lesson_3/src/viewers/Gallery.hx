
package viewers;

import js.Browser;
import react.React;
import react.ReactDOM;
import react.ReactComponent;
import react.ReactMacro.jsx;

import viewers.Image;

class Gallery extends ReactComponent {
    // var images = [ ];

    public function new(props: Dynamic) {
        super();
        // props.gallery.images.map(function (image) {
        //     images.push(jsx('<$Image image=$image />'));
        // });
    }

    override function render() {
        return jsx('
            <div>
                <div className="gallery-title">
                    ${props.gallery.title}
                </div>
                <div>
                    ${[for (image in props.gallery.images) jsx('<$Image image=$image />')]}
                </div>
            </div>
        ');
    }
}
