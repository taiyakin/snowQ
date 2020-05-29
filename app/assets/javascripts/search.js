$(function() {
  var search_list = $(".main-content__list");
//検索結果（質問リスト）の HTMLを生成
  function appendQuestion(question) {
  var html = `<a class="main-content__list__question" href="/questions/${question.id}">
                <div class='main-content__list__question-title'>${question.title}</div>
                <div class='main-content__list__question-text'>${question.text}</div>
              </a>`
//HTMLを追加
  search_list.append(html);
 }
//エラーメッセージ
  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

//検索を入力したら発火、サーチアクションへ。入力した内容が(params[:keyword])
  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/questions/search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(questions) {
      //emptyで子要素（質問リスト）を削除
      $(".main-content__list").empty();
      //検索結果で該当する質問リストをビューに追加
      if (questions.length !== 0) {
        questions.forEach(function(question){
          appendQuestion(question);
        });
      }
      else {
        appendErrMsgToHTML("一致する質問がありません");
      }
    })
  });
});