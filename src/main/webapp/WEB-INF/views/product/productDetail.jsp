<%@ page language='java' contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
   crossorigin="anonymous"></script>

<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<style>
* {
   box-sizing: border-box
}

div {
   border: 0px solid black;
}

/*    모든 영역*/
#container {
   height: 1500px
}

/*    왼쪽 메뉴*/
#sidemenu {
   float: left;
   width: 271px;
   position: fixed;
   left: 50px;
   padding: 32px 0 10px 50px;
   border: 0px;
}

#sidefix {
   border: 0px;
}

#sidefix ul {
   list-style: none;
}

#sidefix ul li a {
   text-decoration: none;
   color: black;
   position: relative;
   display: inline-block;
   margin: 7px;
   color: #000;
   font-size: 11px;
   text-transform: uppercase;
}

#sidefix ul li a:hover {
   opacity: 50%
}

#category ul li a {
   font-size: 11px;
}

#search {
   width: 110px;
   height: 17px;
   border: 0;
   vertical-align: middle;
   background: none;
   border-bottom: 1px solid #3e3e3e;
}

/*    중앙 내용*/
#contents {
   float: left;
   width: 1070px;
   height: 1500px;
   margin-left: 430px;
   margin-top: 45px;
   font-size: 11px;
}

#mainpic {
   width: 50%;
   height: 628px;
   float: left;
   padding: 30px;
}

#mainpic>img {
   width: 100%;
   height: 100%;
}

#maindetail {
   width: 50%;
   height: 628px;
   float: left;
   margin-bottom: 100px;
}

#reviewtable, #qnatable {
   border: 1px solid #dfdfdf;
   text-align: center;
   width: 1000px;
   position: relative;
   left: 40px;
}

#reviewtable_write, #qnatable_write {
   border: 1px solid #dfdfdf;
   text-align: center;
   width: 1000px;
   position: relative;
   left: 40px;
}

#reviewtable th, #qnatable th {
   font-weight: normal;
   font-size: 12px;
}

#reviewtable tr td, #qnatable tr td {
   border: 1px solid #dfdfdf;
}

/*    오른쪽 메뉴*/
#rightmenu {
   float: left;
   width: 250px;
   position: fixed;
   right: 130px;
   padding: 49px 80px 0px 0px;
   text-align: right;
}

#rightmenu ul li {
   text-decoration: none;
   color: black;
   display: inline-block;
   margin: 0px 0px 5px 0;
   font-size: 11px;
   text-transform: uppercase;
}

#Payment_Scheduled {
   float: left;
   width: 300px;
   width: 250px;
   position: fixed;
   right: 180px;
   top: 350px;
   font-size: 11px;
   color: gray;
}

#Payment_Scheduled input {
   color: #999
}

.amount {
   width: 30px;
   border: hidden;
}

#total {
   width: 80px;
   border: hidden;
   text-align: center;
}

.item {
   border-bottom: 1px solid #dfdfdf;
   border-top: 1px solid #dfdfdf;
   width: 200px;
   padding-bottom: 5px;
   padding-top: 5px;
   margin-top: 5px;
   text-align: center;
}

#totalPrice {
   border-bottom: 1px solid #dfdfdf;
   width: 200px;
   text-align: center;
}

/*        FOOTER*/
.footer {
   font-size: 11px;
   text-align: center;
}

.footer a {
   text-decoration: none;
   color: black;
}

/*부가 설명*/
#detail {
   margin-bottom: 30px;
}

/* 옵션 선택 */
select {
   width: 50%;
   padding: .8em .5em;
   font-family: inherit;
   background:
      url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
      no-repeat 95% 50%;
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   border-radius: 0px;
   margin-bottom: 5px;
   margin-top: 5px;
}

select::-ms-expand {
   /* for IE 11 */
   display: none;
}

/*   버튼*/
#buybtn {
   width: 30%;
   height: 50px;
   background-color: black;
   color: white;
   border: 0;
   border-radius: 5px;
}

#buybtn:hover {
   background-color: lightgray;
   color: black;
   transition-duration: 0.5s;
}

#cartbtn {
   width: 30%;
   height: 50px;
   background-color: whitesmoke;
   border: 0;
   border-radius: 5px;
}

#cartbtn:hover {
   background-color: lightgray;
   color: white;
   transition-duration: 0.5s;
}
/*    상세설명*/
#subdetailheader {
   text-align: center;
}

#subdetail {
   width: 100%;
}

#subpic {
   text-align: center;
}

#subpic>img {
   margin: auto;
   width: 100%;
}

#totalPrice {
   display: none;
}

.item>.del {
   border: 0;
}

#mainimage {
   display: block;
   width: 100%;
}

.magnifier {
   width: 150px;
   height: 150px;
   position: absolute;
   border-radius: 0;
   box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px
      rgba(0, 0, 0, 0.25);
   display: none;
}

input {
   border: 1px solid #dedede;
}

textarea {
   border: 1px solid #dedede;
}

.reviewDetail, .answerDetail {
   display: none;
}

.review:hover, .answer:hover {
   cursor: pointer;
}
</style>
</head>
<body>
   <!--       전체 영역-->
   <div id=OSF_ALL>

      <!--           왼쪽메뉴, 중앙 내용, 오른쪽 메뉴 -->
      <div id="container">

         <!--               사이드메뉴-->
         <div id="sidemenu">
            <div id="sidefix">
               <a href=""> <img src="/resources/images/logo.png"
                  style="width: 130px; position: relative; left: 45px">
               </a>
               <div class="memberpage">
                  <ul>
                     <li><a href="">login</a> <a href="">join us</a></li>
                     <li><a href="">my page</a> <a href="">cart </a> <a href="">order</a>
                     </li>

                  </ul>
               </div>


               <div id="category">
                  <ul>
                     <li><a href="">NEW ARRIVAL</a></li>
                     <li><a href="">BEST ITEM</a></li>
                     <li><a href="">OUTERWEAR</a></li>
                     <li><a href="">TOP</a></li>
                     <li><a href="">PANTS</a></li>
                     <li><a href="">ACC</a></li>
                     <li><a href="" style="font-size: 11px;">OSF DAILY BOOK</a></li>

                  </ul>
               </div>

               <div>
                  <ul>
                     <li><a href=""><img src="/resources/images/search.png"
                           style="width: 15px"></a> <input id="search" type="text">

                     </li>
                  </ul>
                  <ul>
                     <li><a href=""><img src="/resources/images/instar.png"
                           width="20px"
                           style="position: relative; top: 6px; border-radius: 9px"></a>
                        <a href=""><img src="/resources/images/kakao.png"
                           width="20px"
                           style="position: relative; top: 6px; border-radius: 9px"></a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>

         <div id="contents">
            <div id='mainpic'
               style="padding: 20px; margin: auto; text-align: center; width: 500px; height: 500px; position: relative; left: 42px;">
               <img src="/mainpic/${pdto.title_img }"
                  style="width: 100%; height: 100%;" id='mainimage'>
            </div>
            <div id='maindetail'
               style="margin-top: 0px; margin-right: 0px; padding: 20px; height: 500px; color: #555555; position: relative; left: 70px; width: 480px;">
               <form action="payMent" method="post" name="payMent" id='frm'>
                  <div style="font-size: 13px;">${pdto.pname }</div>
                  <div style="line-height: 50px; height: 210px; font-size: 13px;">
                     ${pdto.content }</div>
                  <div style="line-height: 50px; font-size: 13px;">
                     <b>PRICE</b> &nbsp; &nbsp; ${pdto.price }
                  </div>


                  <div id='option'>
                     <div>
                        <b>COLOR</b>&nbsp; &nbsp; <select id='color'
                           onchange="changeColor()" style="width: 50%">
                           <option>[필수] 옵션을 선택해주세요.</option>
                           <c:forEach var='i' items='${color }'>
                              <option>${i}</option>
                           </c:forEach>
                        </select>
                     </div>

                     <div>
                        <b>SIZE</b> &nbsp; &nbsp; &nbsp; &nbsp; <select id='size'
                           style="width: 50%" onchange="selectSize()">
                           <option>[필수] 색상을 선택해주세요.</option>
                        </select> <br> <br>
                     </div>

                  </div>
                  <br>
                  <div class="bcbtn">
                     <button class="btn btn-dark" id=buybtn type="submit"
                        class="btn btn-outline-secondary" value="BUY">BUY NOW</button>
                     &nbsp;&nbsp; <input type="button" value='CART' id='cartbtn'>
                     <input type='hidden' name='pseq' value="${pdto.pseq }">
                  </div>
                  <div id="Payment_Scheduled">
                     <div id="Payment"></div>
                     <br>
                     <div id='totalPrice'>
                        <b>total :</b>&nbsp;&nbsp;<input type='number' name='sum'
                           id='total' size='4' readonly style="border: hidden">KRW<br>
                     </div>
                  </div>
               </form>
            </div>
            <div id='subdetail'>
               <div id='subdetailheader'
                  style="position: relative; bottom: 100px; text-align: center;">
                  <div id='subpic' style="position: relative; left: 40px;">
                     <c:forEach var='i' items='${idto }'>
                        <div
                           style="width: 500px; height: 500px; float: left; padding: 20px">
                           <img src="/subpic/${i.sysname }" style="width: 100%;">
                        </div>
                     </c:forEach>
                  </div>
               </div>
               <div class="se-component se-text se-l-default" id="SE-bbb7f38c-c506-45a8-a936-5c4ec7931d9a" style='width:100%;float:left;'>
                    <div class="se-component-content">
                        <div class="se-section se-section-text se-l-default">
                            <div class="se-module se-module-text">

                                    <!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-dea870f0-a22f-4c8d-9496-a34a8ad88771"><span style="color:#000000;" class="se-fs-fs11 se-ff-system  se-style-unset " id="SE-21eea40e-1ba0-435a-b51e-d30cd767d319"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-a9a01531-5d26-4de2-b2fd-a68288ab52a3"><span style="color:#000000;" class="se-fs-fs19 se-ff-system  se-style-unset " id="SE-808c66fe-9ccd-4a12-8336-f9eea79e8d74">배송안내</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-c51a6685-a0ec-4365-a3e7-6cf0f6385eb0"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-b98ee3ef-f0e5-4d5a-998f-4f1ef7b8990c">으로 </span><span style="color:#f12f22;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-4d14fee7-a1ec-4e51-b7ad-abdd849c4fc7">1~5일</span><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-10c8f97d-f386-4b54-8d54-a7d3352c81ee"> 정도 소요됩니다.</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-3f575b40-94aa-4e06-9af4-158ede20a83f"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-a6f9974e-bdab-42f3-8a15-f1a3d168ed26">배송비는 기본 3000원 , 10만원 이상 구매 시 무료배송 해드립니다.</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-a6a3c2cd-d192-4ad1-ac6c-43bd3272e00c"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-bd7d9fbd-05a4-4e6d-b74f-a8b35446b4af">배송이 지연되는 경우 주문자분 연락처로 개별연락 드리겠습니다.</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-e5aef70a-b690-4684-9062-c0d12fcb4f97"><span style="color:#000000;" class="se-fs-fs19 se-ff-system  se-style-unset " id="SE-daaec7d6-3d74-4c0b-be69-a4292b5eae4f"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-4f8a06b5-3452-4844-bf94-94fc6e8d3213"><span style="color:#000000;" class="se-fs-fs19 se-ff-system  se-style-unset " id="SE-9367f2a7-bece-4646-b09a-45e76e8bb89c">교환 / 반품 안내</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-d5ccdffd-6eda-4921-8cc8-77d675408fb6"><span style="color:#000000;" class="se-fs-fs19 se-ff-system  se-style-unset " id="SE-e5ff7fe4-ed46-4300-9ef9-68650be5d979"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-0d9689c4-9869-46e2-a521-baf43fcf9ba8"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-f2ba9e1b-63ef-4105-8fd7-2ca8849da744">교환/반품 주소 - 강원도 원주시 우산동 상지대길 9 (402호)</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-02ef82c2-46bb-4902-81da-0d4185a9274f"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-a6d177df-852c-4cb5-9538-24acf5761749">교환/반품 방법 - 상품수령 </span><span style="color:#f12f22;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-65a61558-b002-4154-b7bf-160002b9ce69">1일</span><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-c6265c23-fbb1-4741-a722-1bb8fa80923d"> </span><span style="color:#f12f22;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-eeead429-1127-4476-bcad-0ed282e5c44b">이내에</span><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-863371ad-72b3-4d28-99a9-76b2f04516df"> 원에스핏 QnA 게시판 </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-7325fd7a-05b5-4404-a81f-cd6b841ca479"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-b9d66164-4593-436c-8ef4-bab2759a7ff3">인스타 - 8_8__st </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-bf91faae-5ca1-4f19-94a9-3be3349d3a5f"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-108a1f72-8a25-4400-b4bb-486c597a37a9">                  -010-8450-7648  으로 교환/반품 신청 </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-e1f23ef5-5bb4-47cc-9009-2bbc50afbfe1"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-8f06ed95-ee8d-496d-858f-337e72458792">상품 수령일로 부터 </span><span style="color:#f12f22;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-256b93df-50fe-448d-a9bd-655da90883ef">7일</span><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-47d2bc7d-850a-4c5c-829c-1d21f4efd580"> </span><span style="color:#f12f22;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-0cf45f4b-6640-4ea1-9c4e-73d70a5d7b83">이내에</span><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-3561b8e7-9aa2-4d63-ac6d-6cd30ea6ea81"> 원에스핏으로 상품이 도착해야됩니다.</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-307a450f-8d44-4eaa-8e18-b76544161728"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-1b88bb5f-e599-4013-8798-78955934cfe7"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-95b277ff-d0ec-458d-bab4-b3deb58b3a90"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-52ba20ea-1c5d-4b89-905c-5fa20ff4be80">단순변심으로 인한 교환/환불의 경우는  택배비 </span><span style="color:#f12f22;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-6bd39b9e-0416-4daa-86ec-de8b32e4a9b6">3000원</span><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-70e00e58-7e2d-4e86-993c-aa35cc3c0e0a"> 동봉 </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-94b25726-764f-4692-a9c7-cffa1df7390c"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-f711295e-f45b-4777-b1b6-3873c8d7c979">무료배송의 경우 </span><span style="color:#f12f22;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-86e9c93c-1a59-420e-af6b-d6218b308e5d">6000원</span><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-8d8b2733-9c00-4edc-99dc-1fd9efb65450"> 동봉후 선불로 보내주시기 바랍니다. </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-c3bc7fda-aa77-4f2b-8229-37b5f2cdf5cf"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-542d861a-e929-4c61-98a4-5408526ba750"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-c263e26d-6fdd-464c-8810-d251336ef74c"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-d8df31ba-8c4d-4905-af78-9e491dd3afc4">불량상품 교환일경우 배송비는 원에스핏에서 부담합니다.</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-83ec7a6e-cb47-4d7e-9272-72d695ac7002"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-290a67bf-2368-48fc-b28f-f5dccb05a37c"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-d2e9772f-8f22-481e-98bf-cf9f95d1aaab"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-cda998a8-40ca-4b49-8419-272a48d3fa3b">교환/반품이 </span><span style="color:#f12f22;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-86d3dc96-27b8-44e6-9329-dde1d541be9e">불가능한</span><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-35ef0784-ab53-431e-beeb-4a368f39d6d5"> 경우</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-27a97324-0ce3-4134-9e01-5965947bd5f4"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-89c70d28-a73c-41b8-8245-14c2c7a7bfc1"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-725d3e9e-12b1-4927-bd4c-c47b21f8c1d3"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-a749e8b5-9d3f-4787-988e-37a16d159e43">-제품착용 흔적이 있을경우 (얼룩 , 화장품 , 탈취제 , 향수)</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-fdead976-0a12-4cdf-9e01-334de5d6da56"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-42832df8-96d5-42b7-a11f-35f8019f6a20">-세탁이나 수선으로 인해 상품이 변질된 경우 </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-44746f42-d495-41ae-b35b-11b3416c1011"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-8cc565dc-c22b-44e1-b038-551c6bc72f1e">-악세사리 ,수제화 등 주문제작 상품일 경우 </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-2a633b63-b465-4adc-8e89-e75114331c6d"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-17ab7301-0294-4b43-9f7e-ce3e184d7115">-상품의 택/라벨 이 손상된 경우 </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-16860ea7-ad7a-46de-bcfe-c98f7bff8294"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-06bc71a6-e011-4b56-ae0f-f277b9651227">-포장 부주위로 반품/교환 배송중 상품이 훼손될 경우</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-b7f3cb4b-589e-43c6-9189-17ebbf7ecad6"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-d28fc5d3-3bbd-4e77-a869-489c28ca0a43">-고의적인 상품훼손 흔적이 발견될경우</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-b5a3e472-876b-440d-bd79-e9df25106118"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-bcb477be-68b8-438f-a7d4-64acc9034b69"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-286754d3-b330-482d-9adb-a64b506bdce8"><span style="color:#000000;" class="se-fs-fs19 se-ff-system  se-style-unset " id="SE-b1a13e69-43f3-41d0-9741-b8911849d145">유의사항 안내</span><span style="color:#000;background-color:#fff;" class="se-fs- se-ff-system  se-style-unset " id="SE-3282a549-087e-4d05-afb3-43cabdc64471"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-ee64c60f-84e3-4133-a43f-db7e3e3654be"><span style="color:#000000;" class="se-fs-fs19 se-ff-system  se-style-unset " id="SE-38f78fda-2a80-4539-85c8-e3ab80acc765"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-81535c71-c70d-4dc0-8486-e97d280bf0c0"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-33011286-8580-481a-8b3f-8cb1c2bb2052">-모든  제품의 첫 세탁은 드라이클리닝을 권장합니다.</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-29c2d52b-3b4b-47e8-850e-c9b9a38b3318"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-8688387a-bd91-4510-88fd-94184b70c081">-상품의 색상은 모니터와 화면의 밝기에 따라 미세한 차이가 있을 수 있습니다.</span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-3321ac8c-36e5-4c99-ac4a-d1aafa10cd79"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-0f3c8812-0677-47ca-9596-94a2657e5e0a">-측정방법에 따라서 1~2cm의 오차가 있을수 있습니다. </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-dfa743d1-83b0-46fc-a783-398396084783"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-da871331-7544-44ae-a972-a536a33c41a2"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-8610ee42-91f9-41a1-910f-7c2f28a22fe0"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-639cce24-0c37-46c9-9755-08f78d788215"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-31f6b26e-cd88-48a5-8cbb-d8cfde396f0e"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-96e4c767-1d4a-4e6d-ad03-3b6586f07081"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-b43f2fd5-b822-4393-9ca0-371112911d13"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-198c44f5-464a-47f3-9384-94a9e0fb51d0"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-19b8fd59-599f-4b43-8846-005ebe6563ef"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-27c0ceb5-7ab9-402a-abc1-538bdd31b74a"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-2e565bfc-8e9f-4d66-b472-71c9dc7f8628"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-7ceb4fc1-a5e9-4b1b-be4d-d006fc5e43e9"> </span></p><!-- } SE-TEXT --><!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align-center " style="" id="SE-c0f6441b-cfa3-4f1e-9fb0-45f7d2df7b09"><span style="color:#000000;" class="se-fs-fs13 se-ff-system  se-style-unset " id="SE-7b740862-45fd-4111-a60b-7999767fca6f"> </span></p><!-- } SE-TEXT -->
                            </div>
                        </div>
                    </div>
                </div>

               <table id="reviewtable"
                  style="position: relative; left: 40px; font-size: 11px">
                  <colgroup>
                     <col style="width: 15%">
                     <col style="width: 50%">
                     <col style="width: 15%">
                     <col style="width: 15%">
                  </colgroup>
                  <thead>
                     <tr>
                        <th colspan="4"
                           style="border: hidden; border-bottom: 1px solid #dfdfdf; text-align: left;"><b>REVIEW</b><br>
                           상품의 사용후기를 적어주세요.<br> <br></th>
                     </tr>
                     <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col" style="border-right: 1px solid #dfdfdf">작성일</th>
                     </tr>
                     <c:choose>
                        <c:when test="${empty rdto}">
                           <tr>
                              <td colspan="6" align="center" style="height: 50px;">게시글이
                                 없습니다.</td>
                           </tr>
                        </c:when>
                        <c:otherwise>
                           <c:forEach var='i' items='${rdto}'>
                              <tr class='review'>
                                 <td style="border-right: hidden">${i.bno }</td>
                                 <c:choose>
                                    <c:when test="${empty i.img }">
                                       <td style="border-right: hidden">${i.title }</td>
                                    </c:when>
                                    <c:otherwise>
                                       <td style="border-right: hidden">${i.title }<img
                                          src="/product/icon.png"></td>
                                    </c:otherwise>
                                 </c:choose>
                                 <td style="border-right: hidden">${i.writer }</td>
                                 <td>${i.write_date }</td>
                              </tr>

                              <tr style="height: 200px;" class='reviewDetail'>
                                 <td style="border-right: hidden; padding: 15px;" colspan='1'><c:choose>
                                       <c:when test="${!empty i.img }">
                                          <img src="/product/${i.pseq}/review/${i.img }"
                                             style="width: 200px; height: 200px;">
                                       </c:when>
                                       <c:otherwise></c:otherwise>
                                    </c:choose></td>
                                 <td colspan='3'
                                    style="vertical-align: top; text-align: left; padding: 15px;">
                                    ${i.content }</td>
                              </tr>

                           </c:forEach>
                        </c:otherwise>
                     </c:choose>

                     <tr
                        style="border-left: hidden; border-right: hidden; height: 50px;">
                        <td colspan="6" style="text-align: right; border-bottom: hidden">
                           <input type="button" value="제품후기작성 "
                           style="background-color: white;" id="reviewbtn1">
                        </td>
                     </tr>
                  </thead>
               </table>

               <form action="review" method="post" enctype="multipart/form-data">
                  <input type='hidden' name='pseq' value="${pdto.pseq }">
                  <table id="reviewtable_write" style="display: none;">
                     <colgroup>
                        <col style="width: 80px">
                        <col style="width: 100%">
                     </colgroup>
                     <tr style="border-top: hidden;">
                        <td style="height: 35px; font-size: 12px;">&nbsp;&nbsp;제목</td>
                        <td style="text-align: left;">&nbsp;&nbsp;<input
                           name="title" type="text" style="width: 50%; height: 20px;"></td>
                     </tr>
                     <tr>
                        <td colspan="6"><textarea name="content"
                              style="width: 100%; height: 250px; font-size: 12px;">키 - / 몸무게

- 구매하신 사이즈와 색상 

- 상품 후기 - (20자 이상으로 작성해 주시기 바랍니다.)
                                            </textarea></td>
                     </tr>
                     <tr>
                        <td colspan="6">
                           <div style="width: 100px;">
                              <div class="xbox" id='View_area' align=center
                                 style="border: 1px solid #dedede; width: 200px; height: 200px;">
                                 <a onclick=document.all.profile_pt.click(); id=atag
                                    style="color: gray; font-size: 20px; opacity: 70%; line-height: 200px;">IMAGE
                                 </a>
                              </div>
                              <input type="file" name="file" id="profile_pt"
                                 onchange="previewImage(this,'View_area')"
                                 style="display: none;" />
                              <div class="img_notice"
                                 style="font-size: 12px; text-align: center; color: green">200
                                 x 200 권장</div>
                           </div>
                        </td>
                     </tr>
                     <tr style="border: hidden; border-top: 1px">
                        <td colspan="6" style="text-align: right"><input
                           type="submit" value="제품후기작성 "
                           style="background-color: white; font-size: 12px;"
                           id="reviewbtn2"></td>
                     </tr>

                  </table>
               </form>

               <table id="qnatable"
                  style="position: relative; left: 40px; font-size: 11px">
                  <colgroup>
                     <col style="width: 15%">
                     <col style="width: 50%">
                     <col style="width: 15%">
                     <col style="width: 15%">
                  </colgroup>
                  <thead>
                     <tr>
                        <th colspan="6"
                           style="border: hidden; border-bottom: 1px solid #dfdfdf; text-align: left;"><b>
                              Q&A</b><br>상품에 대해 궁금한 점을 해결해 드립니다.<br> <br></th>
                     </tr>
                     <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col" style="border-right: 1px solid #dfdfdf;">작성일</th>
                     </tr>
                     <c:choose>
                        <c:when test="${empty qdto}">
                           <tr>
                              <td colspan="6" align="center" style="height: 50px;">게시글이
                                 없습니다.</td>
                           </tr>
                        </c:when>
                        <c:otherwise>
                           <c:forEach var='i' items='${qdto}'>
                              <tr class="answer">
                                 <td style="border-right: hidden">${i.bno }</td>
                                 <td style="border-right: hidden">${i.title }</td>
                                 <td style="border-right: hidden">${i.writer }</td>
                                 <td>${i.write_date }</td>
                              </tr>

                              <tr style="height: 200px; border-top: 1px solid black;"
                                 class='answerDetail'>
                                 <td colspan='4'
                                    style="vertical-align: top; text-align: left; padding: 15px; border-top: 1px solid black;">
                                    ${i.content }</td>
                              </tr>

                              <tr style="height: 200px;" class='answerDetail'>
                                 <td colspan='4'
                                    style="vertical-align: top; text-align: left; padding: 15px;">
                                    ${i.content }</td>
                              </tr>


                           </c:forEach>
                        </c:otherwise>
                     </c:choose>

                     <tr
                        style="border-left: hidden; border-right: hidden; height: 50px;">
                        <td colspan="6" style="text-align: right; border-bottom: hidden">
                           <input type="button" value="상품문의하기 "
                           style="background-color: white;" id="qnabtn1">
                        </td>
                     </tr>
                  </thead>
               </table>

               <form action="question" method="post">
                  <input type='hidden' name='pseq' value="${pdto.pseq }">
                  <table id="qnatable_write" style="display: none;">
                     <colgroup>
                        <col style="width: 80px">
                        <col style="width: 100%">
                     </colgroup>
                     <tr style="border-top: hidden;">
                        <td style="height: 35px; font-size: 12px;">&nbsp;&nbsp;제목</td>
                        <td style="text-align: left;">&nbsp;&nbsp;<input
                           name="title" type="text" style="width: 50%; height: 20px;"></td>
                     </tr>
                     <tr>
                        <td colspan="6"><textarea name="content"
                              style="width: 100%; height: 250px; font-size: 12px;"></textarea></td>
                     </tr>
                     <tr style="border: hidden; border-top: 1px">
                        <td colspan="6" style="text-align: right"><input
                           type="submit" value="상품문의하기 "
                           style="background-color: white; font-size: 12px;" id="qnabtn2"></td>
                     </tr>

                  </table>
               </form>


               <div class="footer"
                  style="float: left; width: 1068px; margin-top: 50px;">
                  <a href="">사이트 소개</a> | <a href="">이용약관</a> | <a href="">개인정보취급방침</a>
                  | <a href="">이메일 무단수집거부</a> | <a href="">책임의 한계와 법적고지</a> | <a
                     href="">이용안내</a> | <a href="">모바일 버전</a> <br> <br>
                  <div>
                     COMPANY : ONESFIT <br> PHONE : 010-7777-7777 <br> 사업자
                     번호 : 145-51-00571 <br> 주소 : 강원도 원주시 우산동 상지대길 9 (402호) <br>
                     OWNER : 원에스핏 | WEB MANAGER : 잊재웡 <br> @ OSF ONESFIT

                  </div>
               </div>
            </div>
         </div>


         <div id="rightmenu">
            <ul>
               <li><b>OPENING</b></li>
               <br>
               <li class="phone">T. 02-777-7777</li>
               <li class="font10">MON-FRI / 11AM - 5PM</li>
               <li class="font10">lunch / 1AM - 2PM</li>
               <li class="font10">(close, sat sun holiday)</li>
            </ul>


            <ul>

            </ul>
            <ul>
               <li><b>BANK INFO</b></li>
               <br>
               <li>국민 5591-010-4168-906</li>
               <li>ONESFIT (권성택)</li>
            </ul>
         </div>
      </div>

      <input type='hidden' value='${loginId }' id='loginId'> <input
         type='hidden' value='${pdto.pseq }' id='pseq'>
   </div>
   <script>
                    $("#cartbtn")
                        .on(
                        "click",
                        function() {
                            /* var option1 = $("#size option").index(
                                $("#size option:selected"));
                            var option2 = $("#color option").index(
                                $("#color option:selected")); */
                            var size = $.map($('.picksize'), function (el) { return el.value; });
                            var color = $.map($('.pickcolor'), function (el) { return el.value; });
                            var amount = $.map($('.amount'), function (el) { return el.value; });   
                            var length = $(".pickoption").length;
                            if(length !=0){
                                $
                                    .ajax(
                                    {
                                        url : "cartAdd",
                                        dataType : "Json",
                                        data : {                                                   
                                            pseq : $("#pseq").val(),
                                            option1 : JSON.stringify(size),
                                            option2 : JSON.stringify(color),
                                            amounts : JSON.stringify(amount),
                                            length :length
                                        }
                                    })
                                    .done(
                                    function(resp) {
                                        if (resp.result > 0) {
                                           $(".item").remove();
                                           $("#total").val("0");
                                           $("#totalPrice").css("display","none");
                                            var check = confirm("장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?");
                                            if (check) {
                                                location.href = "#";
                                            }
                                        } else {
                                            alert("알수 없는 오류로 장바구니에 담기지 않았습니다.");
                                        }
                                    })
                            }else{
                               alert("옵션을 선택해주세요.");
                            }                           
                        })
                        
                        $("#frm").on("submit",function(){
                            var length = $(".pickoption").length;
                            if(length==0){
                               alert("옵션을 선택해주세요.");
                               return false;
                            }
                        })
                </script>
   <script> 
                        function changeColor() {
                            $(".sizeoption").remove();
                            if ($("#color option").index($("#color option:selected")) != 0) {            
                                $.ajax({
                                    url : "colorSelect",
                                    data : {
                                        pseq : $("#pseq").val(),
                                        color : $("#color option:selected").val()
                                    }
                                }).done(
                                    function(resp) {
                                        var optionLen = resp.length;                     
                                        for (var i = 0; i < optionLen; i++) {
                                            if(resp[i].item_count>0){
                                                $("#size").append(
                                                    "<option class='sizeoption'>" + resp[i].psize + "</option>");
                                            }else{
                                                $("#size").append(
                                                    "<option class='sizeoption' disabled>" + resp[i].psize + "[품절]</option>");
                                            }
                                        }
                                    })
                            }          
                        }
                        
                        function selectSize(){
                           var color =$("#color option:selected").val();
                           var size = $("#size option:selected").val();
                           var total = $("#total").val();
                           var length = $(".pickoption").length;
                           var arr = $.map($('.pickoption'), function (el) { return el.value; });
                           
                           if($("#size option").index($("#size option:selected"))!=0){
                              for(var i=0;i<length;i++){                                 
                                 if((color+size)==arr[i]){
                                    alert("이미 선택된 옵션입니다.");
                                    $("#color option:eq(0)").prop("selected",true);
                                      $("#size option:eq(0)").prop("selected",true);
                                      $(".sizeoption").remove();
                                    return false;
                                 }
                              }                              
                              $("#Payment").append(
                                      "<div class='item'><b>${pdto.pname}</b>&nbsp; &nbsp; &nbsp;<input type='hidden' class='pickoption' value='"+color+size+"'><input type='hidden' class='pickcolor' name='color' value='"+color+"'><input type='hidden' class='picksize' name='size' value='"+size+"'> <input type='number' name='amount' class='amount' value='1' size='1'min='1' onchange='change();'>"+
                                      "-"+color+"/"+size+"&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' class='del' value='x'></div>");
                              $("#total").val(Number(total)+Number(${pdto.price}));  
                              $("#color option:eq(0)").prop("selected",true);
                              $("#size option:eq(0)").prop("selected",true);
                              $(".sizeoption").remove();
                              $("#totalPrice").css("display","block");
                           }
                        }                       
            
                    </script>
   <script>
                       function change(){
                          var amount=0;
                          var total = $("#total").val();
                          $(".amount").each(function(){
                             amount +=Number($(this).val());                             
                          })
                          if(amount!=0){
                             $("#total").val(amount*${pdto.price});
                          }else{
                             $("#total").val(0);
                              $("#totalPrice").css("display","none");
                          }
                       }      
                       $(document).on("click",".del",function(){
                          $(this).parent("div").remove();
                          return change();
                       })
                        var review = document.getElementById("review");

                        $("#reviewbtn1").on("click",function() {
                            $("#reviewtable_write").css("display","block");
                            $("#reviewbtn1").css("display","none");
                        })
                        
                         $("#qnabtn1").on("click",function() {
                            $("#qnatable_write").css("display","block");
                            $("#qnabtn1").css("display","none");
                        })

                        
                        function previewImage(targetObj, View_area) {
                var preview = document.getElementById(View_area); //div id
                var ua = window.navigator.userAgent;

                //ie일때(IE8 이하에서만 작동)
                if (ua.indexOf("MSIE") > -1) {
                    targetObj.select();
                    try {
                        var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
                        var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


                        if (ie_preview_error) {
                            preview.removeChild(ie_preview_error); //error가 있으면 delete
                        }

                        var img = document.getElementById(View_area); //이미지가 뿌려질 곳

                        //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
                        img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
                    } catch (e) {
                        if (!document.getElementById("ie_preview_error_" + View_area)) {
                            var info = document.createElement("<p>");
                            info.id = "ie_preview_error_" + View_area;
                            info.innerHTML = e.name;
                            preview.insertBefore(info, null);
                        }
                    }
                    //ie가 아닐때(크롬, 사파리, FF)
                } else {
                    var files = targetObj.files;
                    for ( var i = 0; i < files.length; i++) {
                        var file = files[i];
                        var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
                        if (!file.type.match(imageType))
                            continue;
                        var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
                        if (prevImg) {
                            preview.removeChild(prevImg);
                        }
                        var img = document.createElement("img"); 
                        img.id = "prev_" + View_area;
                        img.classList.add("obj");
                        img.file = file;
                        img.style.width = '200px';
                        img.style.height = '200px';
                        $("#View_area").html("");
                        img.setAttribute('onclick','document.all.file.click();');
                        preview.prepend(img);
                        $("#View_area").css("border","none");
                        if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                            var reader = new FileReader();
                            reader.onloadend = (function(aImg) {
                                return function(e) {
                                    aImg.src = e.target.result;
                                };
                            })(img);
                            reader.readAsDataURL(file);
                        } else { // safari is not supported FileReader
                            //alert('not supported FileReader');
                            if (!document.getElementById("sfr_preview_error_"
                                                         + View_area)) {
                                var info = document.createElement("p");
                                info.id = "sfr_preview_error_" + View_area;
                                info.innerHTML = "not supported FileReader";
                                preview.insertBefore(info, null);
                            }
                        }
                    }
                }
            }                        
                     $("#mainpic")
                        .on('mousemove', magnify)
                        .prepend("<div class='magnifier'></div>")
                        .children('.magnifier').css({
                            "background": "url('" + $("#mainimage").attr("src") + "') no-repeat"
                        });
                     
                    var target = $('#mainimage');
                    var magnifier = $('.magnifier');
                    function magnify(e) {
                        
                        // 1
                        var mouseX = e.pageX - $(this).offset().left;
                        var mouseY = e.pageY - $(this).offset().top;
                     
                        // 2
                        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
                            magnifier.fadeIn(100);
                        } else {
                            magnifier.fadeOut(100);
                        }
                     
                        // 3
                        if (magnifier.is(":visible")) {
                     
                            // 4    
                            var rx = -(mouseX / target.width() * target[0].naturalWidth - magnifier.width() / 2);
                            var ry = -(mouseY / target.height() * target[0].naturalHeight - magnifier.height()  /2);
                     
                            // 5
                            var px = mouseX - magnifier.width() / 2;
                            var py = mouseY - magnifier.height() / 2;
                     
                            // 6
                            magnifier.css({
                                left: px,
                                top: py,
                                backgroundPosition: rx + "px " + ry + "px"
                            });
                        }
                    }
                    
                   $(".review").on("click",function(){                	 
                       $(this).next().toggle();
                    })                  
                       
                    $(".answer").on("click",function(){
                             $(this).next().toggle();
                          })  



                    </script>
</body>
</html>