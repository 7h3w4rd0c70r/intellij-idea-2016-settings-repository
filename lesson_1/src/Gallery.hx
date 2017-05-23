
class Gallery {
    var loader: loaders.Loader<msignal.Signal.Signal1<skeletons.Gallery>> = new loaders.Loader<msignal.Signal.Signal1<skeletons.Gallery>>(skeletons.Gallery, parsers.Gallery, "/list.json");

    public function new() { }

    public function load() {
        loader.completed(onLoad);
        loader.load();
    }

    function onLoad (gallery: skeletons.Gallery) {
        var galleryViewer: viewers.Gallery = new viewers.Gallery(gallery);
        galleryViewer.mount("gallery");
    }
}
