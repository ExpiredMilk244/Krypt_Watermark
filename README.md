# ud-watermark

ud-watermark offers a fully customisable watermark for your server. It includes both text and image options.

## Installation

1. Download latest release.
2. Drag `ud-watermark` folder into your FiveM server's resources folder.
3. Add the following line to your server.cfg file:

```
start ud-watermark
```

## Configuration

You can edit all options in the `config.lua` file to your liking.

To change the image, go to the `img` folder in the resource, and replace `logo.png` with your image. For better results, use a circled cropped PNG with a size of 300-400px.

Note that the image must be named `logo.png` for it to work.

To make changes to the image's size and position, edit the `style.css`.

## License

[MIT](https://choosealicense.com/licenses/mit/)