
package lesson_1.src;

import js.Browser;

class Image {
    static public function create(desc: String, src: String) {
        var imgContainerNode = Browser.document.createElement("div");
        var descNode = Browser.document.createElement("div");
        var imgNode = Browser.document.createElement("img");
        var descContainerNode = Browser.document.createElement("div");

        imgContainerNode.className = "container";
        descContainerNode.className = "middle";
        imgNode.className = "image";
        descNode.className = "text";

        imgNode.setAttribute("src", "http://localhost/gallery/" + src);

        descNode.innerText = desc;

        descContainerNode.appendChild(descNode);
        imgContainerNode.appendChild(imgNode);
        imgContainerNode.appendChild(descContainerNode);
        
        return imgContainerNode;
    }
}
