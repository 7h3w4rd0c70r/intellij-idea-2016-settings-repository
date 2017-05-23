
package viewers;

import js.Browser;

class Gallery {
    var gallery: skeletons.Gallery;

    public function new(gallery: skeletons.Gallery) {
        this.gallery = gallery;
    }

    public function mount(nodeId: String) {
        var galleryNode: js.html.Node = this.createNode();
        Browser.document.getElementById(nodeId).appendChild(galleryNode);
    }

    private function createNode(): js.html.Node {
        var galleryNode: js.html.Element = Browser.document.createElement("div");
        var galleryTitleNode: js.html.Element = Browser.document.createElement("div");
        var galleryImagesNode: js.html.Element = Browser.document.createElement("div");

        galleryTitleNode.innerText = this.gallery.title;
        galleryTitleNode.className = "gallery-title";

        this.gallery
            .images
            .map(function (image: skeletons.Image) {
                var imageViewer: viewers.Image = new viewers.Image(image);
                var imageNode: js.html.Node = imageViewer.createNode();
                galleryImagesNode.appendChild(imageNode);
            });

        galleryNode.appendChild(galleryTitleNode);
        galleryNode.appendChild(galleryImagesNode);

        return galleryNode;
    }
}
