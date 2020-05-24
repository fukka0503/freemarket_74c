$(function(){

  function appendOption(category) {
    let html = 
      `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML) {
    let childSelectHtml = '';
    childSelectHtml = 
      `<select class="item_input__body__category__children--select" id="children_category">
         <option value="" data-category="" >選択してください</option>
         ${insertHTML}</select>`
    $('#children_box').append(childSelectHtml);
  }
  function appendGrandchildrenBox(insertHTML) {
    let grandchildSelectHtml = '';
    grandchildSelectHtml = 
      `<select class="item_input__body__category__grandchildren--select" id="grandchildren_category" name="product[category_id]">
         <option value="" data-category="" >選択してください</option>
         ${insertHTML}</select>`
    $('#grandchildren_box').append(grandchildSelectHtml);
  }
  $(document).on("change","#parent_category", function() {
    let parentCategory =  $("#parent_category").val();
    if (parentCategory != "") {
      $.ajax( {
        type: 'GET',
        url: 'get_category_children',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children) {
        $("#children_box").empty();
        $("#grandchildren_box").empty();
        $('.size_box').val('');
        $('#size_box').css('display', 'none');
        let insertHTML = '';
        children.forEach(function(child) {
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function() {
        alert('error：子カテゴリーの取得に失敗');
      })
    }else{
      $("#children_box").empty();
      $("#grandchildren_box").empty();
      $('.size_box').val('');
      $('#size_box').css('display', 'none');
    }
  });
  $(document).on('change', '#children_box', function() {
    let childId = $('#children_category option:selected').data('category');
    if (childId != ""){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        datatype: 'json'
      })
      .done(function(grandchildren) {
        if (grandchildren.length != 0) {
          $("#grandchildren_box").empty();
          $('.size_box').val('');
          $('#size_box').css('display', 'none');
          let insertHTML = '';
          grandchildren.forEach(function(grandchild) {
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function() {
        alert('error:孫カテゴリーの取得に失敗');
      })
    }else{
      $("#grandchildren_box").empty();
      $('.size_box').val('');
      $('#size_box').css('display', 'none');      
    }
  });
  $(document).on('change', '#grandchildren_box', function() {
    let grandchildId = $('#grandchildren_category option:selected').data('category');
    if (grandchildId != "") {
      $('.size_box').val('');
      $('#size_box').css('display', 'block');
    } else {
      $('.size_box').val('');
      $('#size_box').css('display', 'none');
    }
  });
  
  
  
  
  
    // 画像用のinputを生成する関数
    const buildFileField = (num)=> {
      const html = `<div data-index="${num}" class="js-file_box">
      <input class="js-file" type="file"
      name="product[images_attributes][${num}][picture]"
      id="product_images_attributes_${num}_picture"><br>
      </div>`;
      return html;
    }
    // プレビュー用のimgタグを生成する関数
    const buildImg = (index, url)=> {
      const html = `<div><img class="picture" data-index="${index}" src="${url}" width="122px" height="146px">
      <div class="js-remove">削除</div></div>`;
      return html;
    }
    
    // file_fieldのnameに動的なindexをつける為の配列
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    // 既に使われているindexを除外
    lastIndex = $('.js-file_box:last').data('index');
    fileIndex.splice(0, lastIndex);
    
    
    $('.hidden-destroy').hide();
    
    $('#image-box').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');
      console.log(targetIndex)
      // ファイルのブラウザ上でのURLを取得する
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      if( $('img.picture').length == 4) {
        $('.image').css({"display": "none"})
      }
  
      // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('picture', blobUrl);
      } else {  // 新規画像追加の処理
        $('#previews').append(buildImg(targetIndex, blobUrl));
        let limitFileField = $(".js-file_box:last").data("index");
        // fileIndexの先頭の数字を使ってinputを作る
        $('#image-box').prepend(buildFileField(fileIndex[0]));
        fileIndex.shift();
        // 末尾の数に1足した数を追加する
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      }
      $(".image").prop("for", `product_images_attributes_${targetIndex +1}_picture`)
    });
    
    $('#previews').on('click', '.js-remove', function() {
      const targetIndex = $(this).parent().data('index')
      // 該当indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`#product_images_attributes_${targetIndex}__destroy`);
      console.log(hiddenCheck)
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop('checked', true);
      
      $(this).parent().remove();
      $(`img[data-index="${targetIndex}"]`).remove();
      
      // 画像入力欄が0個にならないようにしておく
      if ($('.js-file').length == 0) $('#previews').append(buildFileField(fileIndex[0]));
    });
  });