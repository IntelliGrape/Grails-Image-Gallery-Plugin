package org.grails.plugins.imagegallery

class ImageGalleryTagLib {

    static namespace = "ig"

    def show = {attrs ->
        Gallery gallery = (attrs['galleryInstance'])
        Boolean showInLightBox = attrs['showInLightBox'] ? true : false
        def options = attrs['options'] ?: 'autoplay: true'
        out << g.render(template: "${pluginContextPath}/grails-app/views/showGalleria", model: [theme: attrs['theme'] ?: 'classic', gallery: gallery, pluginContextPath: pluginContextPath, options: options ?: '', showInLightBox: showInLightBox])
    }

    def img = {attrs ->
        String thumbnailSrc = "${attrs['thumbnailSrc']}" ? "${attrs['thumbnailSrc']}" : ""
        attrs.remove('thumbnailSrc')
        String attributes = "${attrs.collect {k, v -> " $k=\"$v\"" }.join('')}"
        String image = "<img ${attributes} />"
        if (thumbnailSrc) {
            out << "<a href='${thumbnailSrc}'>${image}</a>"
        } else {
            out << image
        }
    }

    def resources = {
        out << "<script type='text/javascript' src='${g.resource(dir: pluginContextPath + '/galleria', file: 'galleria.js')}' ></script>"

    }
}
