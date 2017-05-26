
package parsers;

class Image {
    static public function parse(unparsed: Dynamic): skeletons.Image {
        var title: String;
        var src: String;

        if (unparsed.title != null) {
            title = unparsed.title;
        } else {
            trace("Missing property title in Image.parse(unparsed: Dynamic)");
            return null;
        }

        if (unparsed.src != null) {
            src = unparsed.src;
        } else {
            trace("Missing property src in Iage.parse(unparsed: Dynamic)");
            return null;
        }

        return new skeletons.Image(title, src);
    }

    static public function parseMany(unparsed: Array<Dynamic>): Array<skeletons.Image> {
        var images: Array<skeletons.Image> = [ ];
        
        for (img in unparsed) {
            images.push(Image.parse(img));
        }

        return images;
    }
}
