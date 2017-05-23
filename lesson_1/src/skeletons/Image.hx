
package skeletons;

class Image {
    public var title(default, null): String;
    public var src(default, null): String;

    public function new(title: String, src: String) {
        this.title = title;
        this.src = src;
    }
}
