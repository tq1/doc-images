# Doc Images

## Usage

1. Add `br-tq1-doc-images` dependency to your `package.json`

  ```json
  "dependencies": {
    "br-tq1-doc-images": "git+https://github.com/tq1/br-tq1-doc-images.git"
  }
  ```
  
2. Create the text file with [mermaid](http://knsv.github.io/mermaid/)`. Try using the [editor](http://knsv.github.io/mermaid/live_editor/).

3. Call the require `var tq1docs = require('br-tq1-doc-images');`. To generate the images, call the method `tq1docs.generate` passing the configuration object and a callback function. The options is:

  - source_path: path to the text files
  - source_extension: files extension
  - images_path: output images path

## Example

  ```
  var tq1docs = require('br-tq1-doc-images');
  tq1docs.generate({
    source_path: 'docs/src',
    source_extension: 'txt',
    images_path: 'docs/images'
  }, function(err) {
    if (err) {
      console.error('errr generating docs: ' + err);
    } else {
      console.info('docs generated :)');
    }
  });
  ```