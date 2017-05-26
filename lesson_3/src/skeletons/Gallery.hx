
package skeletons;

class Gallery {
    public var title(default, null): String;
    public var images(default, null): Array<skeletons.Image>;

    public function new(title: String, images: Array<skeletons.Image>) {
        this.title = title;
        this.images = images;
    }
}
