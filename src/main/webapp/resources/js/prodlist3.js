
/**
 * 사용자 카테고리 목록
 */
var fnCategoryProductList = (function() {
    var opt = {};
    
    var skin_module = null; // 모듈 객체
    
    var stepCategories = {}; // 계층형 카테고리 정보
    var selectedStepCategories = {}; // 선택한 계층형 카테고리 정보
    var selected_category_seq = 0;
    var selected_category_depth = 0;
    var selected_category_encode = 0;
    var siblingStepCategories = {}; // 형제 카테고리 정보
    var childStepCategories = {}; // 자식 카테고리 정보
    var parentStepCategories = {};  // 부모 카테고리 정보
    
    
    // 계층형 카테고리 정보에서 선택, 자식, 부모 카테고리 정보 추출
    var splitStepCategory = function () {
        // 계층형 카테고리를 역순으로 조회하며 추출
        var maxStepDepth = 4; // 최대카테고리
        for (var stepDepth = maxStepDepth; stepDepth > 0; stepDepth--) {
            var category = stepCategories['step' + stepDepth];
            if (typeof (category) !== 'undefined' && category.length > 0) {
                
                if (selected_category_depth < stepDepth) {
                    // 역순조회 시 차수가 선택된 카테고리 차수보다 큰 경우 자식 카테고리 
                    childStepCategories = category;
                } else if (selected_category_depth == stepDepth) {
                    // 역순조회 시 차수가 선택된 카테고리 차수와 같은 경우 형제 카테고리
                    siblingStepCategories = category;
                } else if (selected_category_depth > stepDepth) {
                    // 역순조회 시 차수가 선택된 카테고리 차수보다 작은 경우 부모 카테고리
                    parentStepCategories[stepDepth] = category;
                }
            }
        }
    };
    
    // 선택 카테고리 정보 그리기 
    var drawSelectdStepCategories = function () {
        // 현재 선택된 카테고리 추출
        var selectedCategory = {};
        for (var i in siblingStepCategories) {
            var category = siblingStepCategories[i];
            var category_seq = category.category_seq;
            if (selected_category_seq == category_seq) {
                selectedCategory = category;
            }
        }
        
        // 상단 네비게이션 맵 그리기 
        fnStepCategory.drawTopNaviMap(selectedStepCategories, skin_module, selected_category_depth, siblingStepCategories);
        
        // 중앙 정보 그리기
        drawMainCategory(selectedCategory);
    };
    
    // 자식 카테고리 정보 그리기 
    var drawChildStepCategories = function () {
        // 하단 네비 정보 그리기 
        drawBottomNaviMap(childStepCategories);
    };
    
    // 중앙 정보 그리기
    var drawMainCategory = function (category) {
        if (typeof(category) === 'undefined') {
            category = {};
        }
        var category_name = category.category_name;
        
        var objMainCategory = skin_module.find('.main_category');
        objMainCategory.html(' ' + category_name + ' ');
    };
    
    // 하단 네비 정보 그리기 
    var drawBottomNaviMap = function (categories) {
        if (typeof(categories) === 'undefined') {
            categories = {};
        }
        var objBottomNaviMap = skin_module.find('.bottom_navi_map');
        
        for (var i in categories) {
            var category = categories[i];
            var category_seq = category.category_seq;
            var category_encode = category.category_encode;
            var category_name = category.category_name;
            
            var objBottomNaviMapItem = skin_module.find('.dumyBottomNaviMapItem').clone();
            objBottomNaviMapItem.removeClass('dumyBottomNaviMapItem');
            objBottomNaviMapItem.addClass('objBottomNaviMapItem');
            
            var aTag = objBottomNaviMapItem.find('a');
            var categoryUrl = makeCategoryLink(category_encode);
            aTag.attr('href', categoryUrl);
            aTag.html(category_name);
            
            objBottomNaviMap.append(objBottomNaviMapItem);
        }
    };

    // 계층형 카테고리 그리기
    var drawStepCategory = function (res) {
        
        try {
            stepCategories = res.datas.stepCategories.list;  // 계층형 카테고리 정보
            selectedStepCategories = res.datas.stepCategories.selected;  // 선택한 계층형 카테고리 정보
            selected_category_seq = res.datas.category_seq;
            selected_category_depth = res.datas.category_depth;
            selected_category_encode = res.datas.category_encode;
            
            // 계층형 카테고리 정보에서 선택, 자식, 부모 카테고리 정보 추출
            splitStepCategory();
            
            // 부모 카테고리 정보 - 상단 네비게이션
            fnStepCategory.drawParentStepCategories(parentStepCategories, selectedStepCategories, skin_module);
            
            // 선택 카테고리 정보 - 중앙 
            drawSelectdStepCategories();
            
            // 자식 카테고리 정보 - 하단 
            drawChildStepCategories();
            
            // 이벤트 바인딩
            bindEvent(true);

        } catch (e) {
            console.log(e);
            if (typeof(res) === 'undefined' || typeof(res.error) === 'undefined') {
                alert(window.i18n.common.common.C00001.message);  // 잘못된 접근입니다.
            } else {
                alert(res.error);
            }
        }
    };
    
    // 이벤트 바인딩
    var bindEvent = function (force) {
        if (typeof(force) === 'undefined') {
            force = false;
        }
        if (force) {
            skin_module.find('.objTopNaviMapCategory').off('click');
            skin_module.find('.topNaviMapSelectBox').off('blur');
        }
        skin_module.find('.objTopNaviMapCategory').on('click', function (e) {
            if ($(this).data('click')) {
                
                var selcetedOption = $(this).find('option:selected');
                var category_seq = selcetedOption.val();
                var category_encode = selcetedOption.attr('data-category_encode');
                
                if (category_encode !== selected_category_encode) {
                    moveCategory(category_encode);
                }
                
                $(this).data('click', false);
            } else {
                $(this).data('click', true);
            }
        });
        skin_module.find('.topNaviMapSelectBox').on('blur', function (e) {
            skin_module.find('.objTopNaviMapCategory').data('click', false);
        });
    };
    
    // 카테고리 페이지 링크 만들기
    var makeCategoryLink = function (category_encode) {
        if (typeof(category_encode) === 'undefined') {
            category_encode = 0;
        }
        var url = opt.url.listLink.replace("%category_encode%", category_encode);
        return url;
    };
    
    // 카테고리 페이지 이동
    var moveCategory = function (category_encode) {
        if (typeof(category_encode) === 'undefined') {
            category_encode = 0;
        }
        var url = makeCategoryLink(category_encode);
        location.href = url;
    };
    
    // 상품 목록 조회에 필요한 파라미터 구성
    var makeCategoryProductParams = function () {
        var category_seq = opt.category_seq;
        var per_page = skin_module.find('.per_page').val();
        var page = skin_module.find('.page').val();
        var sort = skin_module.find('.sort').val();
        
        var params = {
            'per_page' : per_page,
            'page' : page,
            'sort' : sort,
            'category_seq' : category_seq,
        };

        var searchParams = fnProductList.makeProductParams(params);
        return searchParams;
    };
    
    // 페이징 정보 세팅
    var initSetPaging = function () {
        var per_page = opt.per_page;
        var page = opt.page;
        var sort = opt.sort;
        var category_config = opt.category_config;  // 카테고리 공통 설정값

        if (typeof(category_config) !== 'undefined') {
            if (category_config.orderby_criteria_type === 'regist_desc') {
                sort = 'regist_date|desc';
            } else if (category_config.orderby_criteria_type === 'price_desc') {
                sort = 'sale_price|desc';
            } else if (category_config.orderby_criteria_type === 'price_asc') {
                sort = 'sale_price|asc';
            }
            
            // 정렬 방법 설정
            if (typeof(category_config.display_col) !== 'undefined') {
                $('.category_ul').attr('data-line-up',category_config.display_col);
            }
            
            // 한 페이지에 보여주고 하는 갯수 설정
            if (typeof(category_config.display_col) !== 'undefined' && typeof(category_config.display_row) !== 'undefined') {
                per_page = parseInt(category_config.display_col * category_config.display_row);
            }    
        }

        /**
         * 최신순 regist_desc
         * 낮은 가격순 price_asc
         * 높은 가격순 price_desc
         */
        
        skin_module.find('.page').val(page);
        skin_module.find('.per_page').val(per_page);
        skin_module.find('.sort').val(sort);
    };
    
    
    // 상품 목록 초기화
    var initProductList = function () {
        
        // 페이징 정보 세팅
        initSetPaging();

        // 상품 목록 
        callProductList();
    };
    
    // 상품 목록 
    var callProductList = function () {
        var urlReadSearchProducts = opt.url.listProductData
        
        var targetCanvas = fnProductList.initTargetCanvas();
        targetCanvas.canvas = skin_module.find('.canvas_product_list');
        targetCanvas.dumyProductList.obj = skin_module.find('.dumyProductList');
        targetCanvas.dumyProductItem.obj = skin_module.find('.dumyProductItem');
        targetCanvas.dumyProductListEmpty.obj = skin_module.find('.dumyProductListEmpty');
        
        targetCanvas.searchPage.obj = skin_module.find('.page');
        targetCanvas.searchPerPage.obj = skin_module.find('.per_page');
        targetCanvas.searchPerRate.obj = skin_module.find('.sort');
        targetCanvas.pagination.canvas = skin_module.find('.paging_navigation');
        targetCanvas.pagination.obj = skin_module.find('.dumyPagination');
        
        // 상품 목록 조회
        var params = makeCategoryProductParams();

        var eventHandler = {
            callProductList: callProductList
        };

        fnProductList.viewProductList(urlReadSearchProducts, targetCanvas, params, eventHandler);
    };
    
    /**
     * init
     */
    var Init = function (initOpt) {
        opt = initOpt;
        
        // 모듈 인스턴스 확인
        skin_module = $('.skin_block[data-module-id="module-category"]');
        
        // 계층형 카테고리 정보 조회
        fnStepCategory.getStepCategory(0, opt.url.listCategoryData, drawStepCategory);
        
        // 상품 목록 초기화
        initProductList();
    };

    return {
        init : Init
    };
})();