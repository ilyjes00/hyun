
/**
 * 스킨 상품 목록
 */
var fnProductList = (function() {
    var opt = {};

    var paginationOption = {
        block: 10
    };
    
    var productList = {};  // 상품목록
    var targetCanvas = { // 상품 목록 그리는 기본 값
        canvas : $('.canvas_product_list'),
        dumyProductList : {
            obj : $('.dumyProductList')
        },
        dumyProductItem : {
            obj : $('.dumyProductItem'),
            classList : {
                soldout : 'product_soldout',
                notsale : 'product_notsale',
                link : 'product_link',
                image : 'product_thumbnail_img',
                product_info : {
                    product_link : 'product_link',
                    product_name : 'product_name',
                    product_desc : 'product_summary',
                    display_discount : 'product_display_discount',
                    sale_price : 'product_sale_price',
                    normal_price : 'product_normal_price',
                },
				sale_price : 'sale_price',
				cost_price : 'cost_price',
                no_data_area : 'no_data_area',
            }
        },
        dumyProductListEmpty : {
            obj : $('.dumyProductListEmpty')
        },
        searchPerPage : {
            obj : $('.per_page')
        },
        searchPage : {
            obj : $('.page')
        },
        searchPerRate : {
            obj : $('.sort')
        },
        searchKeyword : {
            obj : $('.btn_search')
        },
        count : {
            obj: $('.list_count'),
            classList : {
                num : 'num',
            }
        },
        pagination : {
            canvas : $('.paging_navigation'),
            obj : $('.dumyPagination'),
            classList : {
                direction_first : 'direction first',
                direction_prev : 'direction prev',
                direction_page : 'direction pagination',
                direction_next : 'direction next',
                direction_last : 'direction last'
            }
        },
    };
    
    var initTargetCanvas = function () {
        return targetCanvas;
    };
    
    // 상품목록 그리기
    var drawProoductList = function () {
        var productListTargetElement = targetCanvas.dumyProductList.obj.clone();
        var emptyProductList = targetCanvas.dumyProductListEmpty.obj.clone();

        // 갯수 업데이트
        targetCanvas.count.obj.find(makeFindClassString(targetCanvas.count.classList.num)).text(total+'개');

        if (total > 0) {
            // dummy class 삭제
            productListTargetElement.removeClass('dumyProductList');
            productListTargetElement.addClass('objProductList');

            $.each(productList, function (key, product) {
                var productItem = createProductItemElement(product);
    
                productListTargetElement.append(productItem);
            });
    
            targetCanvas.canvas.html(productListTargetElement);
        } else {
            // dummy class 삭제
            emptyProductList.removeClass('dumyProductListEmpty');
            targetCanvas.canvas.html(emptyProductList);
            targetCanvas.canvas.find(makeFindClassString(targetCanvas.dumyProductItem.classList.no_data_area)).show();
        }

    };

    // 상품 아이템 element 생성
    var createProductItemElement = function (product) {
        var productItemTarget = targetCanvas.dumyProductItem;

        // 상품 아이템 element dummy 복제
        var productElementReplication = productItemTarget.obj.clone();
        
        // dummy class 삭제
        productElementReplication.removeClass('dumyProductItem');
        productElementReplication.addClass('objProductItem');

        var productInfoObj = productItemTarget.classList.product_info;
		
		// TODO (MUST) : 각 element 들의 데이터 검증 기능 추가
		if (typeof(product.name) === 'undefined') {
			product.name = '';
		}

		if (typeof(product.summary) === 'undefined') {
			product.summary = '';
		}

		if (typeof(product.sale_price) === 'undefined' || isNaN(product.sale_price)) {
			product.sale_price = 0;
		}

		if (typeof(product.display_discount) === 'undefined' || isNaN(product.display_discount)) {
			product.display_discount = 0;
		}

		if (typeof(product.normal_price) === 'undefined' || isNaN(product.normal_price)) {
			product.normal_price = 0;
		}

		// 1. 품절 여부
        if (product.stock_staus === '') {
            productElementReplication.find(makeFindClassString(productItemTarget.classList.soldout)).remove();
        }
        // 1-1. 판매중지 여부
        if (product.is_sale === 'Y') {
            productElementReplication.find(makeFindClassString(productItemTarget.classList.notsale)).remove();
        }

        // 2. 상품 정보
        // 2-0 상품 링크
        productElementReplication.find(makeFindClassString(productInfoObj.product_link)).attr('href','/products/'+ product.product_display_seq);

        // 2-1 상품 명
        productElementReplication.find(makeFindClassString(productInfoObj.product_name)).html(product.name);
        // 2-2 상품 요약
        productElementReplication.find(makeFindClassString(productInfoObj.product_desc)).html(product.summary);

        // 2-4 상품 할인가격
		productElementReplication.find(makeFindClassString(productInfoObj.sale_price)).html(Math.round(product.sale_price).toLocaleString());

        // TODO (MUST) : 각 상품에 할인율에 따른 할인 퍼센트등 노출 분기처리
        if (Math.round(product.display_discount) > 0) {

			// 2-3 상품 할인율
            productElementReplication.find(makeFindClassString(productInfoObj.display_discount)).html(Math.round(product.display_discount).toLocaleString());
            // 2-5 상품 정상가격
            productElementReplication.find(makeFindClassString(productInfoObj.normal_price)).html(Math.round(product.normal_price).toLocaleString());
        } else {
            // 2-3 상품 할인율
            productElementReplication.find(makeFindClassString(productItemTarget.classList.sale_price)).remove();
            // 2-5 상품 정상가격
            productElementReplication.find(makeFindClassString(productItemTarget.classList.cost_price)).remove();
        }
        
        // 3. 대표이미지 경로
        if (typeof (product.images_url[1]) !== 'undefined' ) {
            var thumbnailSrc = product.images_url[1].origin;
        } else {
            thumbnailSrc = '/images/products/no_image.svg';
        }
        productElementReplication.find(makeFindClassString(productItemTarget.classList.image)).attr('src', thumbnailSrc);

        // 3-1 대표이미지 없는 경우 class추가
        if (typeof (product.images_url[1]) === 'undefined' ) {
            productElementReplication.find('.thumbnail_wrap').addClass('no_images');
        }

        return productElementReplication;
    }
	
	// 문자 검증
	var checkString = function (param) {
		
		var rtn = '';

		try {

			if (typeof(param) !== 'undefined') {
				rtn =  param;
			}
	
			if (!param) {
				rtn =  param;
			};

		} catch(e) {
			console.log(e);
		}

		return rtn;
	}


	// 숫자 검증 undefined 이거나 잘못된 값일 경우 0으로 반환
	var checkNumber = function (param) {
		
		var pattern = /[^0-9.]/gi; // 이외에는 제외
		var rtn = '';

		try {

			// 숫자를 제외하고는 제거
			if (pattern.test(param)) {  
				param = param.replace(pattern,''); 
			}

			rtn = checkString(param);

			if (isNaN(param)) {
				rtn = 0;
			}

		} catch(e) {
			console.log(e);
		}

		return rtn;
	}

    // TODO : 더 좋은 방법 강구
    var makeFindClassString = function (className) {
        var classNameArr = className.split(' ');
        var returnString = '.'+classNameArr.join('.');
        return returnString;
    }

    var drawPagination = function (productList, eventHandler) {
        // pagination 초기화
        targetCanvas.pagination.canvas.empty();

        var classList = targetCanvas.pagination.classList;

        // 페이징 영역 element deep copy
        var firstButton = targetCanvas.pagination.obj.find(makeFindClassString(classList.direction_first)).clone();
        var prevButton = targetCanvas.pagination.obj.find(makeFindClassString(classList.direction_prev)).clone();
        var nextButton = targetCanvas.pagination.obj.find(makeFindClassString(classList.direction_next)).clone();
        var lastButton = targetCanvas.pagination.obj.find(makeFindClassString(classList.direction_last)).clone();

        var productTotalCnt = parseInt(productList.total);
        var perPage = parseInt(targetCanvas.searchPerPage.obj.val());
        var page = parseInt(targetCanvas.searchPage.obj.val());
        var totalBlockCnt = Math.ceil(productTotalCnt/perPage);

        // 해당 블럭 시작번호
        var startPageNumber = Math.ceil(page/paginationOption.block);

        // 해당 블록 시작번호가 11 이상일 경우
        if (startPageNumber > 1) {
            startPageNumber = ((startPageNumber - 1) * paginationOption.block) + 1;
        }

        // 해당 블럭 마지막 번호
        var endPageNumber = startPageNumber + paginationOption.block - 1;

        // 1번 페이지가 아니면 전부 노출
        if (page != 1) {
            // first 버튼 append
            firstButton.find("a").click(function() {
                targetCanvas.searchPage.obj.val(1);
                eventHandler.callProductList();
            });

            targetCanvas.pagination.canvas.append(firstButton);

            // prev 버튼 append
            prevButton.find("a").click(function() {
                targetCanvas.searchPage.obj.val(page - 1);
                eventHandler.callProductList();
            });

            targetCanvas.pagination.canvas.append(prevButton);
        }

        // 페이징 영역 버튼들 block area 만들기
        var blockArea = [];
        for (i = startPageNumber; i <= totalBlockCnt; i++) {
            if(i <= endPageNumber) {
                blockArea.push(i);
            }
        }

        $.each(blockArea, function(index, value) {
            var pageButton = targetCanvas.pagination.obj.find(makeFindClassString(classList.direction_page)).clone();
            
            pageButton.find("p").html(value);
            if (page == value) {
                pageButton.addClass('on');
            } else {
                pageButton.find("a").click(value, function() {
                    targetCanvas.searchPage.obj.val(value);
                    eventHandler.callProductList();
                });
            }

            targetCanvas.pagination.canvas.append(pageButton);
        });

        // 마지막 페이지가 아니면 전부 노출
        if (page != totalBlockCnt && totalBlockCnt > 0) {
            // next 버튼 append
            nextButton.find("a").click(function() {
                targetCanvas.searchPage.obj.val(page + 1);
                eventHandler.callProductList();
            });

            targetCanvas.pagination.canvas.append(nextButton);

            // last 버튼 append
            lastButton.find("a").click(function() {
                targetCanvas.searchPage.obj.val(totalBlockCnt);
                eventHandler.callProductList();
            });
            targetCanvas.pagination.canvas.append(lastButton);
        }

    }
    
    // 상품 목록 조회
    var viewProductList = function (urlReadSearchProducts, paramsTargetCanvas, params, eventHandler, fn) {
        if (typeof(urlReadSearchProducts) === 'undefined') {
            urlReadSearchProducts = '';
        }
        if (typeof(params) === 'undefined') {
            params = [];
        }
        if (typeof(eventHandler) === 'undefined') {
            eventHandler = {};
        }
        if (typeof(fn) === 'undefined') {
            fn = null
        }
        
        if (typeof(PAGE_MODE) !== 'undefined') {
            params['m'] = PAGE_MODE;
        }
        
        targetCanvas = paramsTargetCanvas;
        if (urlReadSearchProducts) {
            // 데이터 세팅
            $.get(urlReadSearchProducts, params, function (res) {
                productList = res.data;
                total = res.total;
                                
                drawProoductList(total);

                if (typeof(fn) === 'function') {
                    fn(res);
                }
                
                drawPagination(res, eventHandler);

                // 이벤트 바인딩
                searchEventBinder(eventHandler);
            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                alert('[' + jqXHR.status + '] ' + jqXHR.responseJSON.error);
            });
        }
    };

    var searchEventBinder = function (eventHandler) {
        if (typeof(eventHandler) === 'undefined') {
            eventHandler = {};
        }
        //
        targetCanvas.searchPerPage.obj.off();
        targetCanvas.searchPerRate.obj.off();
        //targetCanvas.searchKeyword.obj.off();
 
        // 각 버튼별 기능 이벤트 바인딩
        var callBackEvent = function () {
            targetCanvas.searchPage.obj.val(1);
            eventHandler.callProductList();
        };
        targetCanvas.searchPerPage.obj.bind('change', callBackEvent);
        targetCanvas.searchPerRate.obj.bind('change', callBackEvent);
        //targetCanvas.searchKeyword.obj.bind('click', callBackEvent);
        // 페이지네이션 버튼 이벤트 바인딩
    }
    
    // 상품 목록 조회용 파라미터 가공
    var makeProductParams = function (params) {
        if (typeof(params) === 'undefined') {
            params = [];
        }
        var per_page = 10;
        var page = 1;
        var category_seq = 0;
        var keyword = '';
        var sort = 'regist_date|desc';

        if (typeof(params.per_page) !== 'undefined' && params.per_page) {
            per_page = params.per_page;
        }
        if (typeof(params.page) !== 'undefined' && params.page) {
            page = params.page;
        }
        if (typeof(params.sort) !== 'undefined' && params.sort) {
            sort = params.sort;
        }
        if (typeof(params.category_seq) !== 'undefined') {
            category_seq = params.category_seq;
        }
        if (typeof(params.keyword) !== 'undefined') {
            keyword = params.keyword;
        }
        
        var searchParams = {
            'per_page' : per_page,
            'length' : per_page,
            'page' : page,
            'search_keyword' : keyword,
            'sort' : sort,
        };

        // category_seq가 있을 경우에만 해당 값 넘긴다. search에서 category_seq가 불필요함
        if (category_seq > 0) {
            searchParams['search_with_child_category_seq'] = category_seq;
        }

        // 비동기를 이용한 데이터 처리이지만, 추후 URL 복사 후 공유할 경우를 대비해 URL에 QS Setting
        var url = {};
        var arrParams = [];
        var strParams = '';
        
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi,    function(_, key, value) {
            url[key] = value;
        });

        $.each(searchParams, function(key, value) {
            url[key] = value;
        });
        for (var key in url) {
            value = url[key]; 
            arrParams.push(key + '=' + value);
        }
        strParams = arrParams.join('&');
        var newRelativePathQuery = window.location.pathname + '?' + strParams;

        history.pushState(null, '', newRelativePathQuery);

        return searchParams;
    };
    
    return {
        viewProductList : viewProductList,
        initTargetCanvas : initTargetCanvas,
        makeProductParams : makeProductParams,
    };
})();