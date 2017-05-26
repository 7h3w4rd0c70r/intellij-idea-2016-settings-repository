
package viewers;

import js.Browser;
import react.React;
import react.ReactDOM;
import react.ReactComponent;
import react.ReactMacro.jsx;

class Image extends ReactComponent {
    public function new(props: Dynamic) {
        super();
    }

    override function render() {
        return jsx('
            <div className="container">
                <img className="image" src=${'http://localhost/gallery/'+ props.image.src} />
                <div className="middle">
                    <div className="text">${props.image.title}</div>
                </div>
            </div>
        ');
    }
}
