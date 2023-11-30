<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Pricing example · Bootstrap v4.6</title>


    

    <!-- Bootstrap core CSS -->
<link href="https://getbootstrap.com/docs/4.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="https://getbootstrap.com/docs/4.6/examples/pricing/pricing.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="reviewTemplate" type="text/x-handlebars-template">
  <table class="table table-sm">
     <thead>
        <tr>
           <th scope="col">번호</th>
           <th scope="col">리뷰내용</th>
           <th scope="col">평점</th>
           <th scope="col">날짜</th>
           <th scope="col">비고</th>
        </tr>
     </thead>
     <tbody>
        {{#each .}}
        <tr>
           <th scope="row" class="rew_num">{{rew_num}}</th>
           <td class="rew_content">{{rew_content}}</td>
           <td class="rew_score">{{convertRating rew_score}}</td>
           <td class="rew_regdate">{{convertDate rew_regdate}}</td>
           <td>{{authControlView mbsp_id rew_num rew_score}}</td>
           <td>
        </tr>
        {{/each}}
     </tbody>
  </table>
</script>

<script>
  $( function() {
    $( "#tabs_prod_detail" ).tabs();
  } );
  </script>

    <!-- Favicons -->


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      body {
	font-family: Arial, Helvetica, sans-serif;
}

table {
	font-size: 1em;
}

.ui-draggable, .ui-droppable {
	background-position: top;
}

/*별점 기본선택자*/
p#star_rv_score a.rv_score {
  font-size: 22px;
  text-decoration: none;
  color: lightgray;
}
/*별점에 마우스 오버했을경우 사용되는 css선택자*/
p#star_rv_score a.rv_score.on {
  color: red;
}
    </style>

    
    <!-- Custom styles for this template -->
    <link rel="stylesheet">
  </head>
  <body>
    

<%@include file="/WEB-INF/views/comm/header.jsp" %>


<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">

  <h1 class="display-4"></h1>
  <p>2차 카테고리: ${cgt_name }</p>
</div>

<div class="container">
  <di class="card-deck mb-3 text-center row">
    <div class="col-md-6">
      <img class="btn_prod_img" data-prod_num="${productVO.prod_num }" src="/user/product/imageDisplay?dateFolderName=${productVO.prod_up_folder }&fileName=${productVO.prod_img }" width="100%" height="225">
    </div>
    <di class="col-md-6">
      <div class="row text-left">
        <div class="col">
          ${productVO.prod_name }
        </div>
      </div>
      <div class="row text-left">
        <div class="col">
          가격 : <span id="unit_price">${productVO.prod_price }</span>
        </div>
      </div>
      <div class="row text-left">
        <div class="col">
        수량 <input type="number" id="btn_quantity" value="1" style="width: 80px;">
        </div>
      </div>
      <div class="row text-left">
        <div class="col">
          총상품금액: <span id="tot_price">${productVO.prod_price }</span>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <button type="button" class="btn btn-primary" name="btn_order" data-prod_num="${productVO.prod_num }">구매하기</button>
      </div>
        <div class="col-md-6">
          <button type="button" class="btn btn-primary" name="btn_cart_add" data-prod_num="${productVO.prod_num }">장바구니</button>
        </div>
      </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div id="tabs_prod_detail">
        <ul>
          <li><a href="#tabs-prodetail">상품설명</a></li>
          <li><a href="#tabs-proreview">상품후기</a></li>
        </ul>
        <div id="tabs-prodetail">
          <p>${productVO.prod_content }</p>
        </div>
        <div id="tabs-proreview">
          <p>상품후기 목록</p>
          <div class="row">
            <div class="col-md-12" id="review_list">

            </div>
          </div>
          <div class="row">
            <div class="col-md-6" id="review_paging">
              
            </div>
          </div>
          <div class="row">
            <div class="col-md-12 text-right">
              <button type="button" id="btn_review_write" class="btn btn-primary" data-prod_num="${productVO.prod_num }">상품후기작성</button>
            </div>
            </div>
        </div>
      </div>
    </div>
  </div>

  <div class="container">
     <div class="row justify-content-end">
        <div class="col-md-7 text-center">
   <!--1)페이지번호 클릭할 때 사용  [이전]  1   2   3   4   5 [다음]  -->
   <!--2)목록에서 상품이미지 또는 상품명 클릭할 때 사용   -->
     <form id="actionForm" action="" method="get">
      <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
      <input type="hidden" name="amount"  id="amount" value="${pageMaker.cri.amount}" />
      <input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
      <input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
      
            <input type="hidden" name="cgt_code" id="cgt_code" value="${cgt_code }" />
            <input type="hidden" name="cgt_name" id="cgt_name" value="${cgt_name }" />
     </form>

   </div>
</div>
</div>

<%@include file="/WEB-INF/views/comm/footer.jsp" %>
</div>

<%-- <%@include file="/WEB-INF/views/comm/plugin.jsp" %>  css파일부분 작동안함 jquery-3.6.0.js // 3.5.0버전과 충돌--%> 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script src="/js/category_menu.js"></script>

<!-- 상품후기 Modal -->

<div class="modal fade" id="review_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       <!-- <h5 class="modal-title" id="exampleModalLabel">상품후기</h5>-->
        <b>상품후기</b><span id="rew_num">5</span><span id="rew_regdate"></span>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">별점:</label>
            <p id="star_rv_score">
              <a class="rv_score" href="#">☆</a>
              <a class="rv_score" href="#">☆</a>
              <a class="rv_score" href="#">☆</a>
              <a class="rv_score" href="#">☆</a>
              <a class="rv_score" href="#">☆</a>
            </p>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">내용:</label>
            <textarea class="form-control" id="rew_content"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="btn_review_save" class="btn btn-primary" data-prod_num="${productVO.prod_num }">상품후기저장</button>
        <button type="button" id="btn_review_modify" class="btn btn-primary">상품후기수정</button>
      </div>
    </div>
  </div>
</div> 
<script>

$(document).ready(function (){

let actionForm = $("#actionForm");

// <!--[이전] 1 2 3 4 5 [다음] 클릭 이벤트 설정--> <a>태그
$(".movepage").on("click", function(e) {
  e.preventDefault(); //a태그의 링크기능을 제거. href속성에 페이지번호를 숨겨둠

  actionForm.attr("action", "/user/product/prod_list");
  actionForm.find("input[name='pageNum']").val($(this).attr("href"));


  actionForm.submit();
});
});

//장바구니 추가
$("button[name='btn_cart_add']").on("click", function() {
//console.log("장바구니");

$.ajax({
url: '/user/Cart/cart_add',
type: 'post',
data: {prod_num : $(this).data("prod_num"), cart_amount :  $("#btn_quantity").val()},
dataType: 'text',
//인스펙터에서 ajax구문에 에러를보내는데 받기위한 작업
beforeSend: function(xhr) {
xhr.setRequestHeader("AJAX" , "true");
},

success: function(result) {
  if(result === "success"){
    alert("장바구니에 추가됨");
    if(confirm("장바구니로 이동하겠습니까?")) {
      location.href = "/user/Cart/cart_list";
    }
  }
},          
    error : function(xhr, status, error) {
    alert(status);
    alert("로그인 페이지로 이동합니다.");
    location.href="/member/login";
    }
});
});

//구매하기(주문)
$("button[name='btn_order']").on("click" , function(){

let url = "/user/order/order_ready?prod_num=" + $(this).data("prod_num") + "&cart_amount=" + $("#btn_quantity").val();
location.href = url;
});



$(".btn_prod_img").on("click" , function() {

  let actionForm = $("#actionForm");
  console.log("상품상세설명");

  actionForm.attr("action", "/user/product/prod_detail");

  let prod_num = $(this).data("prod_num");

  actionForm.find("input[name='prod_num']").remove();
  // <input type='hidden' name='prod_num' value='상품코드'
  actionForm.append("<input type='hidden' name='prod_num' value='" + prod_num + "'>");
  actionForm.submit();

});

//수량변경시
$("#btn_quantity").on("change", function() {
  let tot_price = parseFloat($("#unit_price").text()) * parseFloat($("#btn_quantity").val());


  //총상품금액 표시
  $("#tot_price").text(tot_price);
}); 

  //상품후기 작성
  $("#btn_review_write").on("click", function(){

    $('#btn_review_modify').hide(); //상품수정하기버튼 숨김
    $('#btn_review_save').show();   //상품후기저장버튼 나타내기
$('#review_modal').modal('show');
$('#rew_content').text('');


  // 별점 초기화 아래 구문참조
  $("p#star_rv_score a.rv_score").each(function() {
        $(this).removeClass("on");
    });
});

$("#add_comment_btn").on("click", function(){

});

//ready event end
$("p#star_rv_score a.rv_score").on("click", function(e){
e.preventDefault(); // 링크 기본 동작 제거
$(this).parent().children().removeClass("on");
$(this).addClass("on").prevAll("a").addClass("on");
});


//상품명 목록 불러오는작업 (이벤트 사용안하고 ,직접호출)
/*
let reviewPage = 1;     //목록에서 1번째 페이지를 의미
//@GetMapping("/list/{prod_num}/{page}")
let url = "/user/review/list" + 상품코드 + "/" +reviewPage;
*/

let reviewPage = 1;     //목록에서 1번째 페이지를 의미
//@GetMapping("/list/{prod_num}/{page}")
let url = "/user/review/list/" + "${productVO.prod_num }" + "/" +reviewPage;

getReviewInfo(url);

function getReviewInfo(url) {
  $.getJSON(url, function(data) {
    //console.log("상품후기 :" + data.list[0].rew_content);
    //console.log("페이지넘버 :" + data.pageMaker.total);
    //review_list

    printReviewList(data.list, $("#review_list"), $("#reviewTemplate"))


    //review_paging
    printPaging(data.pageMaker, $("#review_paging"));

  });
}

//상품후기작업함수
let printReviewList = function(reviewDate , target , template) {
  let templasteObj = Handlebars.compile(template.html());
  let reviewHtml = templasteObj(reviewDate);

  //상품후기목록 위치를 참조하여 추가
  $("#review_list").children().remove();
  target.append(reviewHtml);


}
//2)페이징 기능작업함수
let printPaging = function(pageMaker, target) {
  
  let pagingStr = '<nav id="navigation" aria-label="Page navigation example">';
    pagingStr += '<ul class="pagination">';

  
  //이전표시여부
  if(pageMaker.prev) {
    pagingStr += '<li class="page-item"><a class="page-link" href="' + (pageMaker.startPage - 1)  + '">[Prev]</a></li>';
    
  }
  //페이지번호 출력
  for(let i=pageMaker.startPage; i<=pageMaker.endPage; i++) {
    let className = pageMaker.cri.pageNum == i ? 'active' : '';
    pagingStr += '<li class="page-item ' + className + '"><a class="page-link" href="' + i + '">' + i + '</a></li>'
  }


  //다음표시여부
  if(pageMaker.next) {
    pagingStr += '<li class="page-item"><a class="page-link" href="' + (pageMaker.startPage + 1)  + '">[Next]</a></li>';
    
  }
  pagingStr += '</ul>';
  pagingStr += '</nav>';

  target.children().remove();
  target.append(pagingStr);


}






//사용자 정의 Helper (핸들바의 함수)
//상품후기 등록일 milisecond ->자바스크립트의 Date객체로 변환.
Handlebars.registerHelper("convertDate", function(reviewtime) {

  const dateObj = new Date(reviewtime);
  let year = dateObj.getFullYear();
  let month = dateObj.getMonth() + 1;
  let date = dateObj.getDate();
  let hour = dateObj.getHours();
  let minute = dateObj.getMinutes();

  return year + "/" + month + "/" + date + " " + hour + ":" + minute;
});

//별점 값을 별 텍스트로 변경하기
Handlebars.registerHelper("convertRating", function(rating) {
  let starStr = "";
  switch(rating) {
    case 1:
    starStr = "★☆☆☆☆"
    break;
    case 2:
    starStr = "★★☆☆☆"
    break;
    case 3:
    starStr = "★★★☆☆"
    break;
    case 4:
    starStr = "★★★★☆"
    break;
    case 5:
    starStr = "★★★★★"
    break;

  }

  return starStr;
});


//상품후기 수정/삭제 버튼 표시
Handlebars.registerHelper("authControlView", function(mbsp_id, rew_num , rew_score) {
  let str = "";
  let login_id = '${sessionScope.loginStatus.mbsp_id}';

  if(login_id == mbsp_id) {
    str += '<button type="button" name="btn_review_edit" class="btn btn-info" data-rew_score="' + rew_score +'">Edit</button>';
    str += '<button type="button" name="btn_review_del"  class="btn btn-danger" data-rew_num="' + rew_num +'">Delete</button>';
  
  console.log(str);
  //출력내용이 태그일때 사용
  return new Handlebars.SafeString(str);
  }else {
    str += '<p>' + mbsp_id + '</p>';
    return new Handlebars.SafeString(str);
  }


});



//상품후기 수정버튼 클릭
$("div#review_list").on("click" , "button[name='btn_review_edit']", function() {
//modal() 메서드는 부트스트랩 메서드

  /*
  console.log("번호", $(this).parent().parent().find(".rew_num").text());
  console.log("내용", $(this).parent().parent().find(".rew_content").text());
  console.log("별점", $(this).parent().parent().find(".rew_score").text());
  console.log("날짜", $(this).parent().parent().find(".rew_regdate").text());
  */

  //평점작업
  let rew_score = $(this).data("rew_score");
  console.log ("별평점" , rew_score);
  $("#star_rv_score a.rv_score").each(function(index, item) {
    if(index < rew_score) {
      $(item).addClass("on");
    }else {
      $(item).removeClass("on");
    }
  });


  
//상품후기 내용
  $("#rew_content").text($(this).parent().parent().find(".rew_content").text());
  //상품후기 번호
  $("#rew_num").text($(this).parent().parent().find(".rew_num").text());
  //상품후기 작성일
  $("#rew_regdate").text($(this).parent().parent().find(".rew_regdate").text());

  $("#btn_review_save").hide();
  $("#btn_review_modify").show();
  $("#btn_review_modify").data("rew_num" , $(this).parent().parent().find(".rew_num").text());
  $('#review_modal').modal('show');  


});


//상품후기 수정하기
$("#btn_review_modify").on("click", function() {
  let rew_num = $("#rew_num").text();
  let rew_content = $("#rew_content").val();
  // 별점
  let rew_score = 0;
  $("p#star_rv_score a.rv_score").each(function(index, item) {
    if ($(this).attr("class") == "rv_score on") {
      rew_score += 1;
    }
  });




  let review_data = {rew_num:rew_num, rew_content:rew_content, rew_score:rew_score}
  
  $.ajax({
  url : '/user/review/modify',
  headers : {
    "Content-Type" : "application/json; charset:UTF-8" , "X-HTTP-Method-Override" : "PUT"
  },
  type : 'put',
  data : JSON.stringify(review_data), //object -> json으로 변환
  dataType : 'text',
  //인스펙터에서 ajax구문에 에러를보내는데 받기위한 작업
  beforeSend: function(xhr) {
  xhr.setRequestHeader("AJAX" , "true");
  },
  success : function(result) {
    if(result == 'success') {
      alert("상품평이 수정됨.");
      $('#review_modal').modal('hide'); //부트스트랩 4.6버전의 자바스크립트명령어
      //상품평 불러오는작업
      getReviewInfo(url);
    }
  },          
    error : function(xhr, status, error) {
    alert(status);
    alert("로그인 페이지로 이동합니다.");
    location.href="/member/login";
    }
});
});









//상품후기 삭제버튼 클릭
$("div#review_list").on("click" ,"button[name='btn_review_del']", function() {
  //console.log("상품후기 삭제")
  if(!confirm("상품후기를 삭제하시겠습니까?")) return;

  let rew_num = $(this).data("rew_num");

  $.ajax({
  url : '/user/review/delete/' + rew_num,
  headers : {
    "Content-Type" : "application/json; charset:UTF-8" , "X-HTTP-Method-Override" : "DELETE"
  },
  type : 'delete',
  data : JSON.stringify(rew_num), //object -> json으로 변환
  dataType : 'text',
  //인스펙터에서 ajax구문에 에러를보내는데 받기위한 작업
  beforeSend: function(xhr) {
  xhr.setRequestHeader("AJAX" , "true");
  },
  success : function(result) {
    if(result == 'success') {
      alert("상품평이 삭제됨.");

    
      //상품평 불러오는작업

      url = "/user/review/list/" + "${ProductVO.prod_num}" + "/" + reviewPage;
      getReviewInfo(url);
    }
  },          
    error : function(xhr, status, error) {
    alert(status);
    alert("로그인 페이지로 이동합니다.");
    location.href="/member/login";
    }
});
});


//페이징 번호 클릭
$("div#review_paging").on("click" , "nav#navigation ul a", function(e) {
  e.preventDefault();
  //console.log("페이지 번호");

  reviewPage = $(this).attr("href"); //상품후기 선택 페이지번호

  let url = "/user/review/list/" + "${productVO.prod_num }" + "/" +reviewPage;

  getReviewInfo(url); //스프링에서 상품후기, 페이지번호 데이터 가져오는 함수.


});











//상품후기저장
$("#btn_review_save").on("click", function(){
//별점 값
let rew_score = 0;
let rew_content = $("#rew_content").val();

$("p#star_rv_score a.rv_score").each(function(index, item){
  if($(this).hasClass("on")){
  rew_score += 1;
  }
});

if(rew_score == 0) {
  alert("별점을 선택하세요.");
  return;
}

if(rew_content == "") {
  alert("상품평을 작성해주세요.");
  return;
}

//ajax를 사용하여 스프링으로 리뷰데이터 전송작업
let review_data = {prod_num: $(this).data("prod_num"), rew_content : rew_content , rew_score : rew_score};

$.ajax({
  url : '/user/review/new',
  headers : {
    "Content-Type" : "application/json; charset:UTF-8" , "X-HTTP-Method-Override" : "POST"
  },
  type : 'post',
  data : JSON.stringify(review_data), //object -> json으로 변환
  dataType : 'text',
  //인스펙터에서 ajax구문에 에러를보내는데 받기위한 작업
  beforeSend: function(xhr) {
  xhr.setRequestHeader("AJAX" , "true");
  },
  success : function(result) {
    if(result == 'success') {
      alert("상품평이 등록됨.");
      $('#review_modal').modal('hide'); //부트스트랩 4.6버전의 자바스크립트명령어
          //상품평 불러오는작업
          getReviewInfo(url);
    }
  },          
    error : function(xhr, status, error) {
    alert(status);
    alert("로그인 페이지로 이동합니다.");
    location.href="/member/login";
    }
});

});

</script>


  </body>
</html>
