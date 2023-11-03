<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>!function(){"use strict";var e=document.createElement("style");e.innerText="[data-block-name] { visibility : hidden }",document.head.appendChild(e),document.addEventListener("DOMContentLoaded",function(){return e.remove()})}();</script>
	
	<style>
section[data-block-index="1"] {
	background-color: transparent;
	padding-top: 0;
	padding-bottom: 0
}

@media ( max-width :767px) {
	section[data-block-index="1"] {
		padding-top: 0;
		padding-bottom: 0
	}
}

section[data-block-index="1"] .banner-carousel {
	position: relative
}

section[data-block-index="1"] .banner-carousel .scroll-wrapper {
	width: 100%;
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	overflow: hidden;
	position: relative
}

section[data-block-index="1"] .banner-carousel .item-wrapper {
	width: 100%;
	text-align: center;
	flex-shrink: 0;
	margin: 0 1px
}

section[data-block-index="1"] .banner-carousel .banner-image-wrapper {
	height: 0;
	padding-bottom: 100%;
	position: relative;
	overflow: hidden
}

section[data-block-index="1"] .banner-carousel .banner-image-wrapper picture img
	{
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute;
	top: 0;
	left: 0
}

section[data-block-index="1"] .banner-carousel .scroller {
	position: absolute;
	top: calc(40% - 40px);
	width: 48px;
	height: 48px;
	border-radius: 9999px;
	z-index: 1;
	cursor: pointer;
	background:
		url("data:image/svg+xml,%3Csvg viewBox='0 0 14 24' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M1.37504 11.0622L10.7497 1.6876C11.2673 1.16991 12.1067 1.16991 12.6244 1.6876C13.1421 2.20529 13.1421 3.04463 12.6244 3.56232L3.24976 12.9369C2.73207 13.4546 1.89273 13.4546 1.37504 12.9369C0.85735 12.4192 0.85735 11.5799 1.37504 11.0622Z' fill='black'/%3E%3Cpath d='M3.24949 11.0625L12.6251 20.4381C13.1428 20.9558 13.1428 21.7952 12.6251 22.3128C12.1075 22.8305 11.2681 22.8305 10.7504 22.3128L1.37478 12.9372C0.857089 12.4195 0.85709 11.5802 1.37478 11.0625C1.89247 10.5448 2.73181 10.5448 3.24949 11.0625Z' fill='black'/%3E%3C/svg%3E"),
		rgba(217, 217, 217, .75);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 9px 16px
}

section[data-block-index="1"] .banner-carousel .scroller.scroll-left {
	left: 3px
}

section[data-block-index="1"] .banner-carousel .scroller.scroll-right {
	right: 3px;
	transform: rotate(180deg)
}

section[data-block-index="1"] .banner-carousel h2 {
	font-size: 24px;
	margin-top: 16px;
	margin-bottom: 12px;
	display: flex;
	justify-content: center;
	align-items: center;
	line-height: 100%;
	font-weight: 800
}

section[data-block-index="1"] .banner-carousel p {
	line-height: 120%;
	font-size: 16px;
	margin-bottom: 12px;
	margin-top: 0
}

section[data-block-index="1"] .banner-carousel video {
	width: 100%
}

section[data-block-index="1"] .banner-carousel .banner-image-wrapper video .mobileVideo
	{
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute;
	top: 0;
	left: 0
}

#desktopVideo {
	display: none
}

#mobileVideo {
	display: block
}

.subtitle {
	color: #000
}

section[data-block-index="1"] .banner-image-link {
	display: block;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0
}

section[data-block-index="1"] .buttons a.pilled-button:last-child {
	background-color: rgba(255, 0, 0, 0) !important;
	color: #000 !important;
	border: 1px solid #000
}

@media ( min-width :767px) {
	section[data-block-index="1"] .banner-carousel .banner-image-wrapper {
		padding-bottom: 56.25%
	}
	section[data-block-index="1"] .banner-carousel .scroller {
		width: 70px;
		height: 70px;
		background-size: 14px 24px;
		top: calc(43.75% - 60px)
	}
	section[data-block-index="1"] .banner-carousel .scroller.scroll-left {
		left: -35px
	}
	section[data-block-index="1"] .banner-carousel .scroller.scroll-right {
		right: -35px
	}
	section[data-block-index="1"] .banner-carousel h2 {
		font-size: 48px;
		margin: 24px 0 12px
	}
	section[data-block-index="1"] .banner-carousel p {
		margin-bottom: 20px
	}
	#desktopVideo {
		display: block
	}
	#mobileVideo {
		display: none
	}
	section[data-block-index="1"] .buttons a.pilled-button:last-child {
		margin-left: 8px
	}
}

@media ( max-width :767px) {
	section[data-block-index="1"] .inner-wrapper {
		padding-bottom: 10px
	}
	section[data-block-index="1"] .content-wrapper {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column
	}
	section[data-block-index="1"] .buttons {
		display: flex;
		flex-direction: column;
		row-gap: 8px;
		text-align: center;
		flex-wrap: wrap;
		max-width: fit-content
	}
}
<section class="cms-custom-block" data-block-index="0" data-block-name="CUSTOM_BLOCK_FOR_GLOABL_CSS"> </section>
</style>
	<section class="cms-pug-block" data-block-index="1"
		data-block-name="HP_Banner">
		<div class="wrapper banner-carousel banner-section">
			<div class="inner-wrapper">
				<a class="scroller scroll-left"></a><a class="scroller scroll-right"></a>
				<div class="scroll-wrapper">
					<div class="item-wrapper" data-included-segment-ids="4582"
						data-excluded-segment-ids="7903,7905,7906,7958,7951,7952,7910,7965,7966,7907,7909,7900,7901,7902,7937,7919,7920,7953,7954,7955,7959,7957,7961,7962,7967,7956,7960">
						<div class="banner-image-wrapper">
							<picture>
							<source
								srcset="https://cdn-stamplib.casetify.com/cms/image/d69679bfa3d8c44213810013bff233ae.jpg.webp"
								media="(min-width: 767px)">
							<img
								src="https://cdn-stamplib.casetify.com/cms/image/b73a5073a4c471701d4e70e024ae199b.jpg.webp"
								alt="NEW! 아이폰15 케이스" loading="lazy"></picture>
							<a class="banner-image-link"
								id="LandingPage_Banner_KR - iPhone 15 Launch -  iPhone 15 Apple Style (Blank Case) iPhone 15 Pro"
								href="/iphone-cases/iphone-15-pro-cases"></a>
						</div>
						<div class="content-wrapper">
							<h2 class="banner-title">
								<div>NEW! 아이폰15 케이스</div>
							</h2>
							<p class="subtitle">새로운 아이폰을 위한 강력한 보호력!</p>
							<div class="button">
								<a class="pilled-button"
									id="LandingPage_Banner_KR - iPhone 15 Launch -  iPhone 15 Apple Style (Blank Case) iPhone 15 Pro"
									href="/iphone-cases/iphone-15-pro-cases">지금 구매하기</a>
							</div>
						</div>
					</div>
					<div class="item-wrapper" data-included-segment-ids="4582"
						data-excluded-segment-ids="7903,7905,7906,7958,7951,7952,7910,7965,7966,7907,7909,7900,7901,7902,7937,7919,7920,7953,7954,7955,7959,7957,7961,7962,7967,7956,7960">
						<div class="banner-image-wrapper">
							<picture>
							<source
								srcset="https://cdn-stamplib.casetify.com/cms/image/0a2b29dedf239f086a08d29fce3c7445.jpg.webp"
								media="(min-width: 767px)">
							<img
								src="https://cdn-stamplib.casetify.com/cms/image/f0089131afdf1bfde6eb9b50725b776a.jpg.webp"
								alt="절제된 미니멀리즘의 미학" loading="lazy"></picture>
							<a class="banner-image-link"
								id="LandingPage_Banner_KR - Wabi Sabi Case"
								href="/product/the-wabi-sabi-case#16006158"></a>
						</div>
						<div class="content-wrapper">
							<h2 class="banner-title">
								<div>절제된 미니멀리즘의 미학</div>
							</h2>
							<p class="subtitle">아이폰 14와 15 시리즈 완벽 지원</p>
							<div class="button">
								<a class="pilled-button"
									id="LandingPage_Banner_KR - Wabi Sabi Case"
									href="/product/the-wabi-sabi-case#16006158">지금 구매하기</a>
							</div>
						</div>
					</div>
					<div class="item-wrapper" data-included-segment-ids="4582"
						data-excluded-segment-ids="7903,7905,7906,7958,7951,7952,7910,7965,7966,7907,7909,7900,7901,7902,7937,7919,7920,7953,7954,7955,7959,7957,7961,7962,7967,7956,7960">
						<div class="banner-image-wrapper">
							<picture>
							<source
								srcset="https://cdn-stamplib.casetify.com/cms/image/239a49e1b893f54f2c49e841c5ad423c.jpg.webp"
								media="(min-width: 767px)">
							<img
								src="https://cdn-stamplib.casetify.com/cms/image/6e84aa13f777118a51f20ea6e2525e8a.jpg.webp"
								alt="Freedom to Bounce" loading="lazy"></picture>
							<a class="banner-image-link"
								id="LandingPage_Banner_KR - iPhone 15 Launch - Ultra Bounce Case"
								href="/case-type/ultra-bounce-case-magsafe-compatible"></a>
						</div>
						<div class="content-wrapper">
							<h2 class="banner-title">
								<div>Freedom to Bounce</div>
							</h2>
							<p class="subtitle">
								케이스티파이 역사상 가장 강력한 폰케이스의 탄생<br>울트라 바운스 케이스
							</p>
							<div class="button">
								<a class="pilled-button"
									id="LandingPage_Banner_KR - iPhone 15 Launch - Ultra Bounce Case"
									href="/case-type/ultra-bounce-case-magsafe-compatible">지금
									구매하기</a>
							</div>
						</div>
					</div>
					<div class="item-wrapper" data-included-segment-ids="4582"
						data-excluded-segment-ids="7903,7905,7906,7958,7951,7952,7910,7965,7966,7907,7909,7900,7901,7902,7937,7919,7920,7953,7954,7955,7959,7957,7961,7962,7967,7956,7960">
						<div class="banner-image-wrapper">
							<picture>
							<source
								srcset="https://cdn-stamplib.casetify.com/cms/image/5edc68321344ed0ea14126c2cb316282.jpg.webp"
								media="(min-width: 767px)">
							<img
								src="https://cdn-stamplib.casetify.com/cms/image/6be948daa64da789090443a8506c3a78.jpg.webp"
								alt="CASETiFY ARTiSTS : INAPSQUARE" loading="lazy"></picture>
							<a class="banner-image-link"
								id="LandingPage_Banner_KR - INAPSQUARE"
								href="/artist/inapsquare"></a>
						</div>
						<div class="content-wrapper">
							<h2 class="banner-title">
								<div>CASETiFY ARTiSTS : INAPSQUARE</div>
							</h2>
							<p class="subtitle">
								<br>
							</p>
							<div class="button">
								<a class="pilled-button" id="LandingPage_Banner_KR - INAPSQUARE"
									href="/artist/inapsquare">지금 구매하기</a>
							</div>
						</div>
					</div>
					<div class="item-wrapper" data-included-segment-ids="4582"
						data-excluded-segment-ids="7903,7905,7906,7958,7951,7952,7910,7965,7966,7907,7909,7900,7901,7902,7937,7919,7920,7953,7954,7955,7959,7957,7961,7962,7967,7956,7960">
						<div class="banner-image-wrapper">
							<video autoplay="autoplay" loop="loop" playsinline="playsinline"
								muted="muted" id="desktopVideo">
								Your browser does not support the video tag.
								<source
									src="https://cdn-stamplib.casetify.com/cms/video/d3be35ca438794214c4b0840a6518b10.mp4"
									type="video/mp4">
							</video>
							<video autoplay="autoplay" loop="loop" playsinline="playsinline"
								muted="muted" id="mobileVideo">
								Your browser does not support the video tag.
								<source
									src="https://cdn-stamplib.casetify.com/cms/video/9d436ae653557795cfe6c84c7a4e177b.mp4"
									type="video/mp4">
							</video>
							<a class="banner-image-link"
								id="LandingPage_Banner_KR - iPhone 15 Launch - Screen Protector"
								href="/product/screen-protector"></a>
						</div>
						<div class="content-wrapper">
							<h2 class="banner-title">
								<div>액정 수리 비용과 안녕!</div>
							</h2>
							<p class="subtitle">손쉬운 무결점 부착</p>
							<div class="button">
								<a class="pilled-button"
									id="LandingPage_Banner_KR - iPhone 15 Launch - Screen Protector"
									href="/product/screen-protector">지금 구매하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>!function(){"use strict";var n=document.currentScript.closest("section[data-block-name]"),l=0,i=n.querySelector(".scroll-wrapper"),o=Array.from(n.querySelectorAll(".item-wrapper")).length,e=n.querySelector(".scroll-left"),r=n.querySelector(".scroll-right"),c=navigator.userAgent,a=setTimeout(function(){u(1)},1e4);function u(e){var r,t;(l+=e)<0?l=o-1:o<=l&&(l=0),0<o&&(t=(null===(r=n.querySelectorAll(".item-wrapper"))||void 0===r?void 0:r[l]).offsetLeft,c.match(/safari/i)&&!c.match(/chrome/i)?i.scrollTo({left:t}):i.scrollTo({left:t,behavior:"smooth"})),clearTimeout(a),a=setTimeout(function(){u(1)},1e4)}null!=e&&e.addEventListener("click",function(e){u(-1)}),null!=r&&r.addEventListener("click",function(e){u(1)}),window.addEventListener("resize",function(){return u(0)});var t=Array.from(n.querySelectorAll(".item-wrapper h2.banner-title")),s=Array.from(n.querySelectorAll(".item-wrapper subtitle"));t.forEach(function(e){e.innerText.includes("<br>")&&(e.innerText=e.innerText.replace(/\s?(<br\s?\/?>)\s?/g,"\r\n"))}),s.forEach(function(e){e.innerText.includes("<br>")&&(e.innerText=e.innerText.replace(/\s?(<br\s?\/?>)\s?/g,"\r\n"))})}();</script>
	</section>

</body>
</html>