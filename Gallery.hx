
import haxe.Json;
import js.Promise;
import js.html.XMLHttpRequest;
import js.Browser;

class Remote {
    var baseUrl: String;

    public function new(baseUrl: String) {
        this.baseUrl = baseUrl;
    }

    public function get(url: String) {
        return new Promise(function (resolve, reject) {
            var request = new XMLHttpRequest();
            request.open("GET", this.baseUrl + url, true);
            request.onload = function (e) {
                return resolve(request.response);
            };
            request.onerror = function (e) {
                trace("An error occured...");
                trace(e);
                reject("");
            };
            request.send();
        });
    }
}

class Gallery {
    static public function main() {
        var Api = new Remote("http://localhost/gallery");
        Api
            .get("/list.json")
            .then(function (jsonGallery) {
                var gallery = Json.parse(jsonGallery);
                Gallery.appendImages(gallery.imgs);
            });
    }

    static public function appendImages(urls: Array<String>) {
        for (url in urls) {
            var imageNode = Browser.document.createElement("img");
            imageNode.setAttribute("src", "http://localhost/gallery/" + url);
            imageNode.setAttribute("width", "250px");
            imageNode.setAttribute("style", "display: block; border: 3px solid #ddd; margin: 20px auto 20px auto;");
            Browser.document.getElementById("gallery").appendChild(imageNode);
        }
    }
}
