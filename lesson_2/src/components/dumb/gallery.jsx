
import React from 'react'

import ImageSmart from 'smart/image'

export default function () {
    return (
        <div>
            {this.state.imgs && this.state.imgs.map((img, key) => <ImageSmart key={key} {...img} />)}
        </div>
    )
}
