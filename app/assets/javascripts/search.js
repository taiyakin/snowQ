$(function() {
  var search_list = $(".main-content__list");
  function appendQuestion(question) {
  var html = `<a class="main-content__list__question" href="/questions/${question.id}">
                <div class='main-content__list__question-title'>${question.title}</div>
                <div class='main-content__list__question-text'>${question.text}</div>
              </a>`

  search_list.append(html);
 }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }


  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/questions/search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(questions) {
      $(".main-content__list").empty();
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