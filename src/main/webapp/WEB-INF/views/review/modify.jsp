<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰등록페이지</title>

    <style>
 
    </style>
    
    <link href="/resources/css/letterboxd.css" rel="stylesheet" media="screen, projection" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>
        $(function () {
            console.clear();
            console.debug('jq started...');
            
            $('#diary-entry-submit-button').click(function () {
                console.log('onclick for #listBtn clicked...');
                // GET, Request URI: /film/${filmVO.film_id}
                location.href = '/film/${filmVO.film_id}';  // 아니면 마이페이지-리뷰로 이동
            }); // onclick for #diary-entry-submit-button
        }); // .jq
        
    </script>
    
</head>

<body>

    <div id="colorbox" class="" 
    style="display: block; 
    	overflow: hidden; 
    	position: absolute; 
    	visibility: visible; 
    	width: 836px; 
    	height: 418px; 
    	top: 267px; 
    	left: 4px;"><div id="cboxWrapper" style="height: 418px; width: 836px;"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left; width: 800px;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left; height: 382px;"></div><div id="cboxContent" style="float: left; width: 800px; height: 382px;"><div id="cboxLoadedContent" style="overflow: hidden; width: 800px; height: 382px;"><div id="modal" class="modal wide">
	<article id="add-film" class="clearfix expanded">
		<section class="not-expanded">
			<h1 id="add-film-title">Add to your films…</h1>
			<!-- <fieldset>
				<div class="row form-row">
					<label>Name of Film</label>
					<input type="text" class="field-large field -reversed -large ac_input" id="frm-film-name" data-url="/s/autocompletefilm" autocomplete="off"><p class="optional-add">Or add <a href="#add-this-film" class="add-this-film modal-link needsclick" data-film-id="433863" data-film-name="The Lighthouse" data-poster-url="/film/the-lighthouse-2019/image-150/" data-film-release-year="2019">The Lighthouse</a></p>
				</div>
			</fieldset> -->
		</section>
		
		<aside class="col-4 left gutter-right-1 expanded">
			<a id="back-to-film-search" href="#" class="replace back-button" style="display: none;">Back</a>
			<section id="poster-frame" class="poster-list -p150 no-hover">

<div class="react-component poster film-poster film-poster-433863 linked-film-poster" 
data-component-class="globals.comps.FilmPosterComponent" 
data-film-id="433863" 
data-film-name="The Lighthouse" 
data-poster-url="/film/the-lighthouse-2019/image-150/" 
data-film-release-year="2019" 
data-new-list-with-film-action="/list/new/with/the-lighthouse-2019/" 
data-remove-from-watchlist-action="/film/the-lighthouse-2019/remove-from-watchlist/" 
data-add-to-watchlist-action="/film/the-lighthouse-2019/add-to-watchlist/" 
data-rate-action="/film/the-lighthouse-2019/rate/" 
data-mark-as-watched-action="/film/the-lighthouse-2019/mark-as-watched/" 
data-mark-as-not-watched-action="/film/the-lighthouse-2019/mark-as-not-watched/" 
data-film-link="/film/the-lighthouse-2019/"><div>
<img src="https://www.themoviedb.org/t/p/original${filmVO.poster_path}" width="150" height="225" alt="The Lighthouse" srcset="https://a.ltrbxd.com/resized/film-poster/4/3/3/8/6/3/433863-the-lighthouse-0-300-0-450-crop.jpg?k=9c4f0eb0d1 2x" class="image"><a href="/film/the-lighthouse-2019/" class="frame" target="_blank"><span class="frame-title">The Lighthouse (2019)</span><span class="overlay"></span></a></div></div>

</section>
			
		</aside>
		
		<section class="col col-13 overflow expanded">
			<h1 id="diary-entry-form-heading">${filmVO.title} </h1>
			<h2 class="headline-2 prettify"><span id="film-title">${filmVO.title}</span> <small class="metadata" id="film-year">2019</small></h2>
			
			<form method="post" action="/${filmVO.film_id}/review/register/" id="diary-entry-form" class="fields-reversed"><input type="hidden" name="__csrf" value="a6d05d85249b6cbb8f2e">
				<input type="hidden" name="viewingId" value="" id="frm-viewing-id">
				<input type="hidden" name="filmId" value="433863" id="frm-film-id">
				<fieldset>
					
					<div class="form-row">
						<textarea name="review" id="frm-review" class="field" placeholder="리뷰를 작성해보세요"></textarea>
					</div>
					<div class="form-row clearfix">
						<div class="col col-7 has-topnote add-tags">
							

						</div>
						<div class="col col-1 col-right like-field">
							<label class="option-label -like">
								<input id="film-like-checkbox" type="checkbox" name="liked" value="true" class="like-checkbox"><i class="substitute"></i> 
								좋아요
							</label>
						</div>
						<div class="col col-4 col-right has-topnote rate-film">
							<label>별점</label>
							<p class="note -topnote rating-text"></p>
							<input id="frm-rating" name="rating" type="range" min="0" max="10" step="1" value="0" style="display: none;">
							<div class="rateit" data-rateit-backingfld="#frm-rating" data-rateit-starwidth="13" data-rateit-starheight="26" data-rateit-resetable="true"><button id="rateit-reset-2" class="rateit-reset" aria-label="reset rating" aria-controls="rateit-range-2" style="display: block;"></button><div id="rateit-range-2" class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0" aria-valuemax="10" aria-valuenow="0" style="width: 130px; height: 26px;" aria-readonly="false"><div class="rateit-selected" style="height: 26px; width: 0px;"></div><div class="rateit-hover" style="height:26px"></div></div></div>
						</div>
					</div>
					<div class="form-row clearfix row-last  row-sharing">
						<div id="contains-spoilers" class="col col-6 col-gap overflow" style="opacity: 0.35;">
							<label for="frm-spoilers" class="label-spoilers option-label -checkbox -default">
								<input type="checkbox" name="containsSpoilers" id="frm-spoilers" class="checkbox" value="true" disabled=""><i class="substitute"></i>  
								스포일러를 포함하고 있어요
							</label>
							<p id="frm-spoilers-locked-label" class="note" style="display:none">A moderator has locked this field.</p>
						</div>

						<div class="col right">
							<input id="diary-entry-submit-button" type="submit" class="button -action button-action" value="Save">
							<a href="#" id="diary-entry-delete-button" class="button button-delete -destructive ajax-click-action" data-confirm="Are you sure you want to delete this&nbsp;entry?">Delete</a>
						</div>
					</div>
				</fieldset>
			</form>
		</section>
	</article>
</div></div><div id="cboxTitle" style="float: left; display: block;"></div><div id="cboxCurrent" style="float: left; display: none;"></div><div id="cboxNext" style="float: left; display: none;"></div><div id="cboxPrevious" style="float: left; display: none;"></div><div id="cboxSlideshow" style="float: left; display: none;"></div><div id="cboxClose" style="float: left;">close</div></div><div id="cboxMiddleRight" style="float: left; height: 382px;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left; width: 800px;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div>
  

    


</body>
</html>