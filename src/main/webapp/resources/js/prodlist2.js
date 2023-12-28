
/**
 * 사용자 카테고리 목록
 */
var fnStepCategory = (function() {
    var stepCategory = {
        'step1' : {},
        'step2' : {},
        'step3' : {},
        'step4' : {},
    };

    // 부모 카테고리 정보 그리기 
    var drawParentStepCategories = function (parentStepCategories, selectedStepCategories, skin_module) {
        //네비 정보가 있는경우 노출
        if (typeof(selectedStepCategories.step1) !== 'undefined') {
            if(selectedStepCategories.step1 !== 0){
                skin_module.find(".top_navi_map").removeClass('Hide')
            }
        }

        for (var category_depth in parentStepCategories) {
            var categories = parentStepCategories[category_depth];
            // 상단 네비게이션 맵 그리기 
            drawTopNaviMap(selectedStepCategories, skin_module, category_depth, categories);
        }
    };
    
    
    // 상단 네비 정보 그리기 
    var drawTopNaviMap = function (selectedStepCategories, skin_module, category_depth, categories) {
        if (typeof(category_depth) === 'undefined') {
            category_depth = 0;
        }
        if (typeof(categories) === 'undefined') {
            categories = {};
        }
        var objTopNaviMap = skin_module.find('.top_navi_map');
        
        // 현재 선택된 카테고리 고유키
        var selectedCategorySeq = selectedStepCategories['step' + category_depth];
        
        var objNaviCategory = skin_module.find('.dumyTopNaviMapCategory').clone();
        objNaviCategory.removeClass('dumyTopNaviMapCategory');
        objNaviCategory.addClass('objTopNaviMapCategory');
        
        // 셀렉트박스에 옵션 추가
        var objSelectBox = objNaviCategory.find('.topNaviMapSelectBox');
        // remove style css
        objSelectBox.removeAttr('style');
        
        for (var i in categories) {
            var category = categories[i];
            var category_seq = category.category_seq;
            var category_encode = category.category_encode;
            var category_name = category.category_name;
            
            var objSelectOption = skin_module.find('.dumyTopNaviMapOption').clone();
            objSelectOption.removeClass('dumyTopNaviMapOption');
            objSelectOption.addClass('objTopNaviMapOption');
            objSelectOption.val(category_seq);
            objSelectOption.html(category_name);
            objSelectOption.attr('data-category_encode', category_encode);
            
            objSelectBox.append(objSelectOption);
        }
        
        if (selectedCategorySeq !== 0 && selectedCategorySeq != undefined) {
            // 셀랙트 박스 선택
            objSelectBox.val(selectedCategorySeq);
            
            // 셀렉트 박스 추가
            objTopNaviMap.append(objNaviCategory);
        }
    };
    
    /**
     * 자식 카테고리 정보 얻기
     */
    var readNextStepCategories  = function(category_encode, urlBasicReadCategories, fn) {
        if (typeof(category_encode) === 'undefined') {
            category_encode = 0;
        }
        if (typeof(urlBasicReadCategories) === 'undefined') {
            urlBasicReadCategories = '';
        }
        if (typeof(fn) === 'undefined') {
            fn = null;
        }
        var params = {
        }; 
        
        var urlReadCategories = urlBasicReadCategories.replace("%category_encode%", category_encode);
        
        if (typeof(PAGE_MODE) !== 'undefined') {
            params['m'] = PAGE_MODE;
        }
        
        if (urlReadCategories) {
            // 데이터 세팅
            $.get(urlReadCategories, params, function (res) {
                if (typeof(fn) === 'function') {
                    fn(res);
                }
            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                alert('[' + jqXHR.status + '] ' + jqXHR.responseJSON.error);
            });
        }
    };
    
    /**
     * 계층형 카테고리 조회
     */
    var getStepCategory  = function(category_encode, urlBasicGetStepCategory, fn) {
        if (typeof(category_encode) === 'undefined') {
            category_encode = 0;
        }
        if (typeof(urlBasicGetStepCategory) === 'undefined') {
            urlBasicGetStepCategory = '';
        }
        if (typeof(fn) === 'undefined') {
            fn = null;
        }
        var params = {
        }; 
        
        var urlReadCategories = urlBasicGetStepCategory.replace("%category_encode%", category_encode);
        
        if (typeof(PAGE_MODE) !== 'undefined') {
            params['m'] = PAGE_MODE;
        }
        if (urlReadCategories) {
            // 데이터 세팅
            $.get(urlReadCategories, params, function (res) {
                if (typeof(fn) === 'function') {
                    fn(res);
                }
            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                alert('[' + jqXHR.status + '] ' + jqXHR.responseJSON.error);
            });
        }
    };

    return {
        readNextStepCategories  : readNextStepCategories, 
        getStepCategory  : getStepCategory,
        drawTopNaviMap : drawTopNaviMap,
        drawParentStepCategories : drawParentStepCategories,
    };
})();