$(document).ready(function() {
	//1차카테고리 오버
	$("div#categoryOne_menu  li a").on("mouseover", function(e) {
		e.preventDefault();  //a태그의 링크기능을 제거
		//console.log("1차카테고리 오버");
		let sel_one_category = $(this);
		let cgt_code = $(this).data("cgt_code");

		console.log("1차 카테고리 코드: " +cgt_code);

		

		let url = '/category/twooCategory/' + cgt_code;
		$.getJSON(url, function(category) {

			console.log(category);
			let str = "<ul class='nav justify-content-center' id='twoo_category'>";
			for(let i=0; i<category.length; i++) {
				str += '<li class="nav-item">';
				str +=  '<a class="nav-link" href="#" data-cgt_code="'+ category[i].cgt_code +'" data-cgt_name="' + category[i].cgt_name +'">'+ category[i].cgt_name + '</a>';
				str += '</li>'

			}

			str +='</ul>';
			console.log(str);
			sel_one_category.parent().parent().next().remove();
			sel_one_category.parent().parent().after(str);

			//2차카테고리 바깥클릭시 제거작업
			$(document).on("mousedown", function(e) {
				if (!sel_one_category.parent().parent().next().is(e.target) && sel_one_category.parent().parent().next().has(e.target).length === 0) {
				  // 2차 카테고리 목록을 제거
				  sel_one_category.parent().parent().next().remove();
				}


				//2차카테고리 선택
				//[중요]

				/*
				$("정적태그를 참조하는 선택자 ").on("이벤트명", "동적태그를 참조하는 선택자" , function() {

				});
				*/


			});
			

		});
	});




	$("div#categoryOne_menu").on("click", "ul#twoo_category li a", function(e) {
		e.preventDefault();
		let sel_two_category = $(this);
		let cgt_code = $(this).data("cgt_code");
	
		let url = '/category/threeCategory/' + cgt_code;
		$.getJSON(url, function(category) {
		  let str = "<ul class='nav justify-content-center' id='three_category'>";
		  for (let i = 0; i < category.length; i++) {
			str += '<li class="nav-item">';
			str += '<a class="nav-link" href="#" data-cgt_code="' + category[i].cgt_code + '" data-cgt_name="' + category[i].cgt_name + '">' + category[i].cgt_name + '</a>';
			str += '</li>';
		  }
		  str += '</ul>';
	
		  sel_two_category.parent().parent().next().remove();
		  sel_two_category.parent().parent().after(str);
	
		  // 3차 카테고리 바깥 클릭 시 제거 작업
		  $(document).on("mousedown", function(e) {
			if (!sel_two_category.parent().parent().next().is(e.target) && sel_two_category.parent().parent().next().has(e.target).length === 0) {
			  sel_two_category.parent().parent().next().remove();
			}
		  });


				//2차카테고리 선택
				//[중요]

				/*
				$("정적태그를 참조하는 선택자 ").on("이벤트명", "동적태그를 참조하는 선택자" , function() {

				});
				*/

				$("div#categoryOne_menu").on("click", "ul#three_category li a", function() {
					let cgt_code = $(this).data("cgt_code");
					let cgt_name = $(this).data("cgt_name");
					location.href = `/user/product/prod_list?cgt_code=${cgt_code}&cgt_name=${cgt_name}`;

			});
			

		});
	});
});