
package lesson_1.src;

import haxe.Json;
import js.Browser;

class Gallery {
    public function new() { }

    public function load() {
        var api = new Remote("http://localhost/gallery");
        api
            .get("/list.json")
            .then(function (jsonGallery) {
                var gallery = Json.parse(jsonGallery);
                this.appendImages(gallery.imgs);
            });
    }

    public function appendImages(imgs: Array<Dynamic>) {
        for (img in imgs) {
            var imgNode = Image.create(img.desc, img.src);
            Browser.document.getElementById("gallery").appendChild(imgNode);
        }
    }
}
