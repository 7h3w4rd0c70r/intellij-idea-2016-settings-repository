
import msignal.Signal;
import loaders.Loader;

class Gallery {
<<<<<<< HEAD
    public function new() { }

    public function load() {
        var galleryLoader: loaders.Gallery = new loaders.Gallery();
        galleryLoader.listen(onLoad);
        galleryLoader.load();
=======
    var loader: Loader<skeletons.Gallery> = new Loader<skeletons.Gallery>(parsers.Gallery.parse, "/list.json");

    public function new() { }

    public function load() {
        loader.listen(onLoad);
        loader.load();
>>>>>>> b233d1af875eb9b82fac7c745d6a42e52d6593b8
    }

    function onLoad (gallery: skeletons.Gallery) {
        var galleryViewer: viewers.Gallery = new viewers.Gallery(gallery);
        galleryViewer.mount("gallery");
    }
}
