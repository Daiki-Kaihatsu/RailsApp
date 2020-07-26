# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# 
# 新規投稿画面の画像プレビュー
$(document).on 'turbolinks:load', ->
  $('#cover-image').click ->
    $('#board_image').click()
    false
    
  $('#board_image').on 'change',(e) ->
    console.log(e)
    file = e.target.files[0]
    reader = new FileReader
    $preview = $('.board-image')
    t = this
    # 画像ファイル以外の場合は何もしない
    if file.type.indexOf('image') < 0
      return false
    # ファイル読み込みが完了した際のイベント登録
    reader.onload = do (file) ->
      (e) ->
        
        #既存のプレビューを削除
        $preview.empty()
        # .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.attr("src",e.target.result)
        return
    reader.readAsDataURL file
    return
  return

# 追加フォーム(画像プレビューなし)
$ ->
  num = 1
  imgView = (n) ->
    reader = new FileReader
    document.getElementById('file_' + n).onchange = (e) ->
      reader.addEventListener 'load', (e) ->
        $('#view_' + n).html '<img src="' + e.target.result + '" />'
        return
      reader.readAsDataURL @files[0]
      return

    return

  imgView num
  $('button#add').click ->
      num = num + 1
      tr_form = '' + '<tr>' + '<td><input type="text" name="text[]"></td>' + '<td><div  id="view_' + num + '"></div><input type="file" id="file_' + num + '" name="img[]" accept="image/*" /></td>' + '</tr>'
      $(tr_form).appendTo $('table > tbody')
      $('#reload').html '<input type="button" value="リロードする" onclick="window.location.reload();" /><br>'
      imgView num
    return
  return

# 追加フォーム(画像プレビューあり)