
import React, { Component } from 'react'

import ImageDumb from 'dumb/image'

export default class extends Component {
    constructor(props) {
        super(props)

        this.renderer = ImageDumb.bind(this)

        this.state = { }
    }

    render() {
        return this.renderer()
    }
}
