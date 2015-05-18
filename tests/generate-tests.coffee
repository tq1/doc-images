chai    = require('chai')
expect  = chai.expect
assert  = chai.assert
fs      = require('fs')

tq1docs = require('../')
options = null
images_full_path = null

rmDir = (dirPath, removeSelf) ->
  if removeSelf == undefined
    removeSelf = true
  try
    files = fs.readdirSync(dirPath)
  catch e
    return
  if files.length > 0
    i = 0
    while i < files.length
      filePath = dirPath + '/' + files[i]
      if fs.statSync(filePath).isFile()
        fs.unlinkSync filePath
      else
        rmDir filePath
      i++
  if removeSelf
    fs.rmdirSync dirPath
  return

describe 'Basic Test', () ->

  beforeEach (done) ->

    options =
      source_path: 'tests/source'
      source_extension: 'txt'
      images_path: 'tests/images'

    images_full_path = process.cwd() + '/' + options.images_path
    rmDir images_full_path, false
    done()

  afterEach (done) ->
    rmDir images_full_path, false
    done()

  it 'should generate image', (done) ->

    tq1docs.generate options, (err) ->
      if err
        console.error err
        assert.fail(err)
      else
        files = fs.readdirSync(images_full_path)
        assert.equal(files.length, 2)

        done()
