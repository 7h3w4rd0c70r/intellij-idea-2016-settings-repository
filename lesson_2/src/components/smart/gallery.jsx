
import React, { Component } from 'react'

import api from 'core/api'

import GalleryDumb from 'dumb/gallery'

export default class extends Component {
    constructor(props) {
        super(props)

        this.renderer = GalleryDumb.bind(this)

        this.state = { }
    }

    componentDidMount() {
        api
            .get('/list.json')
            .then((response) => {console.log(response)
                this.setState(response.data)
            })
            .catch((response) => {
                console.log(response)
            })
    }

    render() {
        return this.renderer()
    }
}
