

$(function(){
	// スマートフォン用、メインメニューのオフキャンバス
	$("body").mobile_menu({
		menu: ['#main-nav #slidemenu_contents' ], //オフキャンバスに含めるobj
		menu_width: 250,	//メニューの横幅
		prepend_button_to: '#menu-btn',  //トリガーになるobjを指定
		button_content:'<i class="icon-bars"></i><br>メニュー' 
	});

	// メインメニューのアコーティオン
	$('.menu-accordion a').on('click', function(){  
		$(this).parent().next('.menu-accordion-content').slideToggle('fast');
		return false;
	});
	
	// headerのdropdownMenu
	$('#is-category-dropdown-switch').click(function(){
		$('#is-category-dropdown-box').toggle();
		return false;
	});

	// 献立ページ、レシピページ、保存と保存後の切り替え
	$("#save-btn").on('click', function(){
		if ( $(this).hasClass('menu-saved')) {
			$(this).removeClass("menu-saved");
			$('.save-btn-text', this).text('保存');
		}else {
			$(this).addClass("menu-saved");
			$('.save-btn-text', this).text('削除');
		}
	});

	/* レシピ作成ページ 
	=================================================*/
	/* 作り方の編集部分 順番を入れ替え*/
	$('a.step-prev').on('click', function(){
		// prev, nextを含む親作り方を取得
		var step = $(this).parents('.step');
		if( $(step).is('.step:first') ){ //作り方が左端、1番目だったら動かさない
			return false;
		} else { //動かす
			$(step).insertBefore($(step).prev());
			return false;
		}
	});

	$('a.step-next').on('click', function(){
		// prev, nextを含む親作り方を取得
		var step = $(this).parents('.step');
		if( $(step).is('.step:last') ) { //作り方が右端、最後だったら動かさない
			return false;
		} else { //動かす
			$(step).insertAfter($(step).next());
			return false;
		}
	});

	/* レシピの書き方、アコーディオン */
	$('.togglable').on('click', function(){
		var parent = $(this).parent();
		var target = $('.togglable', parent );
		if( $(target).hasClass('active-togglable')) {
			$(target).removeClass('active-togglable');
		}else{
			$(target).addClass('active-togglable');
		}

		$('.toggle-block', parent).slideToggle();
		return false;
	});

	// 献立とレシピを切り替えるタブ
	$('li.tab-switch').on('click', function(){
		$('li.tab-switch').removeClass('tab-active');
		$(this).addClass('tab-active');
		$('#tab-box .tab-container').hide();
		$($('a' ,this).attr('href')).show();
		return false;
	});

	// indexのDnoteとはのアコーディオン、pcでは動かないように
	$('.is-sp-toggle-switch').on('click', function(){
		if( 640 > $(window).width()){
			if( $(this).hasClass('active-toggle')) {
				$(this).removeClass('active-toggle');
			} else {
				$(this).addClass('active-toggle');
			}
			$($(this).next('.is-sp-toggle-box') ).slideToggle();
			return false;
		}
	});
});

