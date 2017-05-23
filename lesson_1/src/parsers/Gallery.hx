
package parsers;

class Gallery {
    static public function parse(unparsed: Dynamic): skeletons.Gallery {
        var title: String;
        var images: Array<skeletons.Image>;

        if (unparsed.title != null) {
            title = unparsed.title;
        } else {
            trace("Missing property 'title' in Gallery.parse(unparsed: Dynamic)");
            return null;
        }

        if (unparsed.images != null) {
            try {
                images = parsers.Image.parseMany(unparsed.images);
            } catch (e: Dynamic) {
                trace("Failed to parse 'images' in Gallery.parse(unparsed: Dynamic)");
                return null;
            }
        } else {
            trace("Missing property 'images' in Gallery.parse(unparsed: Dynamic)");
            return null;
        }

        return new skeletons.Gallery(title, images);
    }
}
