#Upload img
$('#upload-img').on 'change', ->
  files = if ! !@files then @files else []
  # no file selected, or no FileReader support
  if !files.length or !window.FileReader
    return
  # only image file
  if /^image/.test(files[0].type)
    # instance of the FileReader
    reader = new FileReader
    # read the local file
    reader.readAsDataURL files[0]
    # set image data as background of div
    reader.onloadend = (e) ->
      $('#img-preview-block').css
        'background-image': 'url(' + e.target.result + ')'
        'background-size': 'cover'
      return
  return