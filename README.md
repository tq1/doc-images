# Doc Images

[![NPM](https://nodei.co/npm/docs-images.png)](https://nodei.co/npm/docs-images/)

## Usage

1. Add `npm install docs-images` to you `package.json`
  
2. Create the text file with [mermaid](http://knsv.github.io/mermaid/)`. Try using the [editor](http://knsv.github.io/mermaid/live_editor/).

3. Call the require `var tq1docs = require('br-tq1-doc-images');`. To generate the images, call the method `tq1docs.generate` passing the configuration object and a callback function. The options is:

  - source_path: path to the text files
  - source_extension: files extension
  - images_path: output images path

## Example

  ```
  var docs-images = require('doc-images');
  tq1docs.generate({
    source_path: 'docs/src',
    source_extension: 'txt',
    images_path: 'docs/images'
  }, function(err) {
    if (err) {
      console.log('errr generating docs: ' + err);
    } else {
      console.log('docs generated :)');
    }
  });
  ```