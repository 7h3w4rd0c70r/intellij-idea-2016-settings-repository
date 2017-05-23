
class Gallery {
    public function new() { }

    public function load() {
        var galleryLoader: loaders.Gallery = new loaders.Gallery();
        galleryLoader.listen(onLoad);
        galleryLoader.load();
    }

    function onLoad (gallery: skeletons.Gallery) {
        var galleryViewer: viewers.Gallery = new viewers.Gallery(gallery);
        galleryViewer.mount("gallery");
    }
}
