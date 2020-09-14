<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<%
    /*
            =>자바 : 오라클 <==> HTML을 연결시켜주는 역할 
            =>오라클 : 공유에 필요한 데이터를 저장하는 공간 
            =>HTML : 사용자 => 화면을 보여줄 내용 
              CSS  : HTML을 디자인 (변경할 정도)
            =>JavaScript : 브라우저 안에서 이벤트 발생 (마우스 클릭...)
    */
    // 오라클 데이터를 읽어온다 
    EmpDAO dao=new EmpDAO();
    ArrayList<MovieVO> list=dao.movieListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#table_content{
  border-collapse:collapse;/*라인선을 한개로 통합*/
  border-top-width: 2px;/*위부분에 라인*/
  border-top-color: #333;/*진한 회색*/
  border-top-style: solid;/*일반 라인선*/
  
  border-bottom-width: 1px;/*아래 라인선 추가*/
  border-bottom-color: #333;
  border-bottom-style: solid;
}
/*
    th,td가 공통으로 들어가는 부분 
*/
#table_content th,td{
  /*
      margin : top left bottom right
      margin-top
      margin-left
      margin-bottom
      margin-right
      
      예)
       margin : 0px (),(),()
                    0px 0px 0px
       margin : 50px 20px 
                50px 20px 50px 20px
                top=bottom left=right
                
       margin : 50 20 30 => 자동으로 left(20)
       
       => bottom값이 생략되면 => top값을 설정 
       => right값이 생략이되면 => left값을 설정
       => padding도 같은 방법으로 적용 
  */
   margin: 0px;
   padding: 8px;
   font-size: 9pt;
}
/* th만 설정되는 부분*/
#table_content th{
   background-color: #999;
   color:white;
   border-bottom-width: 1px;
   border-bottom-color: #333;
}
/* td만 가지고 있는 부분*/
#table_content td{
   border-bottom-width: 1px;
   border-bottom-color: #333;
   border-bottom-style: dotted;
}
/*
   색상 
   1) 지정된 칼라색상 : black , red...
   2) 16진법 #CCCCFF
   3) RGB(255,255,255) => 그림판 
   
     원하는 위치만 제어 : nth-child(2n+1) ==> 2n+1 ==> n(0) 1 3 5...
                            3n+1
*/
#table_content tr:nth-child(2n+1)
{
   background-color: RGB(255,255,200);   
}
#table_content .dataTr:hover{
   background-color: #FC6;
   cursor: pointer;/*Hand_Cursor*/
}
img {
  border-radius: 12px;/*타원형식으로 출력 */
}
</style>
</head>
<body>
  <center>
    <h1>영화목록</h1>
    <table id="table_content" width=900>
      <tr>
        <th>번호</th>
        <th></th>
        <th>제목</th>
        <th>감독</th>
        <th>출연</th>
        <th>장르</th>
        <%--
          <th> : 가운데 정렬
         --%>
      </tr>
      <%-- 출력 --%>
      <%
         for(MovieVO vo:list)
         {
      %>
            <tr class="dataTr">
              <td align=center><%=vo.getMno() %></td>
              <td align=center>
                <img src="<%=vo.getPoster() %>" width=35 height=35>
              </td>
              <td><%=vo.getTitle() %></td>
              <td><%=vo.getDirector() %></td>
              <td><%=vo.getActor() %></td>
              <td><%=vo.getGenre() %></td>
            </tr>
      <%
         }
      %>
    </table>
  </center>
</body>
</html>