<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device=width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <style>
        body{
            -ms-user-select: none; 
            -moz-user-select: -moz-none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            user-select: none; 
        }  
        #adminmenuinfo{
            width: 100px;
            background-color: rgba(65, 105, 225, 0.185);
            border-radius: 10px;
            margin: 0 auto;
            text-align: center;
            margin-bottom: 10px;
        }
        #menu{
        	font-size: 40px;
        	width: 998px;
        	margin: 0 auto;
        	text-align: center;
        }
        
        /* ======== Calendar ======== */
        .clearfix:after {
            content: '';
            display: inline-block;
            width: 990px;
        }
        #mainCalender{
            width: 998px;
            margin: 0 auto;
        }
        #todaystatus{
            font-size: 30px;
            color: cornflowerblue;
            text-align: center;
            background-color: rgba(220, 241, 255, 0.342);
        }
        .todaystatus{
            border-radius: 30px;
        }
        .my-calendar {
            margin: 0 auto;
            width: 700px;
            padding: 20px 20px 10px;
            text-align: center;
            font-weight: 800;
            border: 1px solid #ddd;
        }

        .my-calendar .clicked-date {
            border-radius: 25px;
            margin-top: 36px;
            width: 42%;
            padding: 46px 0 26px;
            background: rgba(104, 167, 226, 0.192);
            float: left;
        }

        .my-calendar .calendar-box {
            width: 58%;
            padding-left: 30px;
            float: right;
        }

        .clicked-date .cal-day {
            font-size: 24px;
        }

        .clicked-date .cal-date {
            font-size: 130px;
        }

        .ctr-box {
            padding: 0 16px;
            margin-bottom: 20px;
            font-size: 20px;
        }

        .ctr-box .btn-cal {
            position: relative;
            /* float: left; */
            width: 25px;
            height: 25px;
            margin-top: 5px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            background: none;
        }

        .ctr-box .btn-cal:after {
            content: '<';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            line-height: 25px;
            font-weight: bold;
            font-size: 20px;
        }

        .ctr-box .btn-cal.next {
            float: right;
        }

        .ctr-box .btn-cal.next:after {
            content: '>';
        }

        .cal-table {
            width: 100%;
        }

        .cal-table th {
            width: 14.2857%;
            padding-bottom: 5px;
            font-size: 16px;
            font-weight: 900;
        }

        .cal-table td {
            padding: 3px 0;
            height: 50px;
            font-size: 15px;
            vertical-align: middle;
        }

        .cal-table td.day {
            position: relative;
            cursor: pointer;
        }

        .cal-table td.today {
            background: #ffd255;
            border-radius: 50%;
            color: #fff;
        }

        .cal-table td.day-active {
            background: #ff8585;
            border-radius: 50%;
            color: #fff;
        }

        .cal-table td.has-event:after {
            content: '';
            display: block;
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 4px;
            background: #FFC107;
        }
        #container {
            margin: 0 auto;
        }
        #content {
            /* float: left; */
            /* padding:50px 50px; */
            margin: 0 auto;
            padding-bottom: 40px;
            background: #fff;
            width: 840px;
        }

        #cafeAdmin #content {
            color: #444;
        }
        .stat_title {
            font-weight: 700;
            display: inline-block;
            /* height: 18px; */
            font-size: 20px;
            line-height: 1.2;
            vertical-align: top;
            color: #222;
        }

        .value_increase.up {
            color: #ed3e49;
        }

        .value_increase {
            text-align:center;
            font-weight:700;
            position: relative;
            top: 1px;
            display: inline-block;
            height: 18px;
            font-size: 25px;
            line-height: 18px;
            vertical-align: middle;
        }

        .box_stat {
            /* position: relative; */
            margin: 0 auto;
            margin-bottom: 30px;
            margin-top: 50px;
            height: 170px;
            width: 900px;
            box-sizing: border-box;
            border: 1px solid #e2e2e2;
            background-color: #fafafa;
        }

        .box_stat .stat {
            position: relative;
            display: inline-block;
            width: 19%;
            height: 88px;
            padding: 10px;  
            vertical-align: top;
            text-align: center;
            /* float: left; */
        }

    </style>
</head>
<body>
    <%@ include file="/resources/html/header.jsp" %>
<div id="container">
    <div>
        <div>
            <div id="adminmenuinfo">관리자 전용</div>
            <div id=menu>
            	<h2>전체</h2>
                <%@include file="menu.jsp"%>
            </div>
        </div>
    </div>
    <div id=mainCalender>
        <div class="my-calendar clearfix">
            <div class="clicked-date">
                <div class="cal-day"></div>
                <div class="cal-date"></div>
            </div>
            <div class="calendar-box">
                <div class="ctr-box clearfix">
                    <button type="button" title="prev" class="btn-cal prev">
                    </button>
                    <span class="cal-month"></span> <span class="cal-year"></span>
                    <button type="button" title="next" class="btn-cal next">
                    </button>
                </div>
                <table class="cal-table">
                    <thead>
                        <tr>
                            <th>일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th>토</th>
                        </tr>
                    </thead>
                    <tbody class="cal-body"></tbody>
                </table>
            </div>
        </div>
        <!-- // .my-calendar -->
    </div>

    <div>    
        <!-- =================  Today Total  ================-->
        <form action="/admin/main">
            <input type="hidden" name="date" value="to_char(current_date, 'yy/mm/dd')">
            <div class="box_stat" id="statBox">
                <div id="todaystatus">
                    <span class="todaystatus">TODAY'S STATUS</span>
                </div>	
                <div class="stat">
                    <span class="stat_title">신규가입자<br><br></span>
                    <br>
                    <span class="value_increase" id="inquire_span">${total.useridno} 명</span>
                </div>

                <div class="stat">
                    <span class="stat_title">신규 리뷰<br><br></span>
                    <br>
                    <span class="value_increase" id="report_span">${total.countrno} 개</span>
                </div>

                <div class="stat">
                    <span class="stat_title">신규게시물<br><br></span>
                    <br>
                    <span class="value_increase" id="board_span">${total.countbno} 개</span>
                </div>

                <div class="stat">
                    <span class="stat_title">신고<br><br></span>
                    <br>
                    <span class="value_increase" id="newMember_span">${total.countrptno} 건</span>
                </div>

                <div class="stat">
                    <span class="stat_title">요청사항<br><br></span>
                    <br>
                    <span class="value_increase" id="saleBoard_span">${total.compno} 건</span>
                </div>
            </div>
        </form>
    </div>


    <!--달력생성-->
    <script type="text/javascript">
        const init = {
        monList: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayList: ['일', '월', '화', '수', '목', '금', '토'],
        today: new Date(),
        monForChange: new Date().getMonth(),
        activeDate: new Date(),
        getFirstDay: (yy, mm) => new Date(yy, mm, 1),
        getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
        nextMonth: function () {
        let d = new Date();
        d.setDate(1);
        d.setMonth(++this.monForChange);
        this.activeDate = d;
        return d;
        },
        prevMonth: function () {
        let d = new Date();
        d.setDate(1);
        d.setMonth(--this.monForChange);
        this.activeDate = d;
        return d;
        },
        addZero: (num) => (num < 10) ? '0' + num : num,
        activeDTag: null,
        getIndex: function (node) {
        let index = 0;
        while (node = node.previousElementSibling) {
        index++;
        }
        return index;
        }
        };
        
        const $calBody = document.querySelector('.cal-body');
        const $btnNext = document.querySelector('.btn-cal.next');
        const $btnPrev = document.querySelector('.btn-cal.prev');
        function loadDate (date, dayIn) {
        document.querySelector('.cal-date').textContent = date;
        document.querySelector('.cal-day').textContent = init.dayList[dayIn];
        }
        
        function loadYYMM (fullDate) {
        let yy = fullDate.getFullYear();
        let mm = fullDate.getMonth();
        let firstDay = init.getFirstDay(yy, mm);
        let lastDay = init.getLastDay(yy, mm);
        let markToday;  // for marking today date
        if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
        markToday = init.today.getDate();
        }
        document.querySelector('.cal-month').textContent = init.monList[mm];
        document.querySelector('.cal-year').textContent = yy;
        let trtd = '';
        let startCount;
        let countDay = 0;
        for (let i = 0; i < 6; i++) {
        trtd += '<tr>';
        for (let j = 0; j < 7; j++) {
        if (i === 0 && !startCount && j === firstDay.getDay()) {
            startCount = 1;
        }
        if (!startCount) {
            trtd += '<td>'
        } else {
            let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
            trtd += '<td class="day';
            trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
            trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
        }
        trtd += (startCount) ? ++countDay : '';
        if (countDay === lastDay.getDate()) { 
            startCount = 0; 
        }
        trtd += '</td>';
        }
        trtd += '</tr>';
        }
        $calBody.innerHTML = trtd;
        }
        function createNewList (val) {
        let id = new Date().getTime() + '';
        let yy = init.activeDate.getFullYear();
        let mm = init.activeDate.getMonth() + 1;
        let dd = init.activeDate.getDate();
        const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);
        
        let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);
        
        let eventData = {};
        eventData['date'] = date;
        eventData['memo'] = val;
        eventData['complete'] = false;
        eventData['id'] = id;
        init.event.push(eventData);
        $todoList.appendChild(createLi(id, val, date));
        }
        
        loadYYMM(init.today);
        loadDate(init.today.getDate(), init.today.getDay());
        
        $btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
        $btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));
        
        $calBody.addEventListener('click', (e) => {
        if (e.target.classList.contains('day')) {
        if (init.activeDTag) {
        init.activeDTag.classList.remove('day-active');
        }
        let day = Number(e.target.textContent);
        loadDate(day, e.target.cellIndex);
        e.target.classList.add('day-active');
        init.activeDTag = e.target;
        init.activeDate.setDate(day);
        // reloadTodo();
        }
        });
    </script>
        
   
    
    
    <%@ include file="/resources/html/footer.jsp" %>
</div>
</body>
</html>