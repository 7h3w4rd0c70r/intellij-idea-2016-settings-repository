
package viewers;

import js.Browser;

class Image {
    var image: skeletons.Image;

    public function new(image: skeletons.Image) {
        this.image = image;
    }

    public function mount(nodeId: String) {
        var imageNode: js.html.Node = this.createNode();
        Browser.document.getElementById(nodeId).appendChild(imageNode);
    }

    public function createNode(): js.html.Node {
        var imgContainerNode: js.html.Element = Browser.document.createElement("div");
        var descNode: js.html.Element = Browser.document.createElement("div");
        var imgNode: js.html.Element = Browser.document.createElement("img");
        var descContainerNode: js.html.Element = Browser.document.createElement("div");

        imgContainerNode.className = "container";
        descContainerNode.className = "middle";
        imgNode.className = "image";
        descNode.className = "text";

        imgNode.setAttribute("src", "http://localhost/gallery/" + this.image.src);

        descNode.innerText = this.image.title;

        descContainerNode.appendChild(descNode);
        imgContainerNode.appendChild(imgNode);
        imgContainerNode.appendChild(descContainerNode);

        return imgContainerNode;
    }
}
