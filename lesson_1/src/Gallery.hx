
import msignal.Signal;
import loaders.Loader;

class Gallery {
    var loader: Loader<skeletons.Gallery> = new Loader<skeletons.Gallery>(parsers.Gallery.parse, "/list.json");

    public function new() { }

    public function load() {
        loader.listen(onLoad);
        loader.load();
    }

    function onLoad (gallery: skeletons.Gallery) {
        var galleryViewer: viewers.Gallery = new viewers.Gallery(gallery);
        galleryViewer.mount("gallery");
    }
}
