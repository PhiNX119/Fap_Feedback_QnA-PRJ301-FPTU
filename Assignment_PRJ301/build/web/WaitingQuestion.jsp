<%-- 
    Document   : Login
    Created on : Jul 3, 2023, 5:11:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QnA</title>
        <style>
            .header {
                display: flex;
                justify-content: space-around;
                margin-left: 90px;
                margin-right: 90px;
            }

            .middle {
                display: flex;
                justify-content: space-between;
                background-color: #f5f5f5;
                height: 30px;
                width: 1000px;
                margin: 0px auto;
                border-radius: 3px;
                margin-bottom: 20px;
            }

            .center {
                display: flex;
                justify-content: center;
            }

            .option {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .info{
                background-color: #5cb85c;
                border-radius: 3px;
                color: white;
                font-size: 15px;
                padding: 1px;
                padding-left: 4px;
                padding-right: 4px
            }

            body {
                font-family: "Arial", sans-serif;
            }

            h1, h2 {
                font-weight: 500;
                line-height: 1.1;
                color: inherit;
            }

            a {
                color: #337ab7;
                text-decoration: none;
            }

            textarea {
                margin-top: 15px;
                height: 100px;
                width: 500px;
            }

            .listquestion {
                border-color: #ddd;
                width: 1000px;
                font-size: 15px;
                margin-bottom: 30px;
            }

            .cat {
                background-color: #f0ad4e;
                display: inline;
                padding: 0.2em 0.6em 0.3em;
                font-size: 10px;
                font-weight: bold;
                line-height: 1;
                color: #fff;
                text-align: center;
                white-space: nowrap;
                vertical-align: baseline;
                border-radius: 0.25em;
                margin-left: 10px;
            }

            .hmm {
                padding-left: 10px;
            }

            .listquestion tr:hover{
                background-color: #f5f5f5;
            }
            
            .button {
                text-decoration: none;
                border-radius: 0.25em;
                background-color: #d43f3a;
                color: white;
                padding: 8px 12px;
            }

            .button:hover {
                background-color: #cc0033
            }
        </style>
    </head>
    <body>
        <!--------------------------Header------------------------------------------->
        <div class="header">
            <div>
                <h1>
                    <span>FPT University Academic Portal</span>
                </h1>
            </div>
            <div>
                <table>
                    <tr>
                        <td colspan="2"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                    </tr>
                    <tr>
                        <td><a href="https://apps.apple.com/app/id1527723314">
                                <img src="Images/app-store.png" style="width: 120px; height: 40px" alt="apple store"></a></td>
                        <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                <img src="Images/play-store.png" style="width: 120px; height: 40px" alt="google store"></a></td>
                    </tr>
                </table>
            </div>
        </div>
        <!--------------------------Kết thúc header---------------------------------->

        <div class="middle">
            <div style="font-size: 13px; margin-top: 6px">  
                <span>
                    <a href="home">Home</a>
                </span>
                <span>|</span>
                <span>
                    <a href="qna">Help</a>
                </span>
                <span>|</span>
                <span>
                    <b>Waiting Question</b>
                </span>
            </div>

            <div style="margin-top: 2px">
                <span class="info"><b>${loginTeacherData.getUsername()}</b></span>
                <span>|</span>
                <span class="info"><b><a style="color: white" href="logout">Logout</a></b></span>
                <span>|</span>
                <span class="info"><b>${loginTeacherData.getCampus()}</b></span>
            </div>  
        </div>

        <!--------------------------Login-------------------------------------------->
        <div class="center">

            <div style="height: 205px; width: 1000px;">

                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <div>                        
                    </div>
                    <div>
                        <input style="height: 30px" type="text" name="find" placeholder="What are you looking for?" oninput="search(this.value)">
                    </div>                    
                </div>

                <!--------------------------QnA list----------------------------------->
                <div style="margin-top: 20px">
                    <table border="1" class="listquestion">
                        <tr style="background-color: #6b90da; color: white; height: 35px">
                            <td class="hmm">QUESTION</td>
                            <td class="hmm">ACTION</td>
                        </tr>
                        <c:forEach items="${listWaitingQuestion}" var="q">                            
                                <tr style="font-size: 13px; height: 35px" class="autofindelement">
                                    <td class="hmm autofind">${q.getQuestion()}</td>
                                    <td class="hmm">
                                        <a href="waiting?questionId=${q.getQuestionId()}&answer=1">Answer</a> |
                                        <a onclick="return confirmDelete();" href="waiting?questionId=${q.getQuestionId()}&delete=1">Delete</a>
                                    </td>
                                </tr>
                        </c:forEach>
                    </table>
                </div>
                <!-----------------------------Footer-------------------------------------->
                <div style="height: 25px; font-size: 12px">
                    <br>
                    <b>Mọi góp ý, thắc mắc xin liên hệ: </b>
                    <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Phòng dịch vụ sinh viên</span>
                    : Email: <a href="mailto:dichvusinhvien@fe.edu.vn">dichvusinhvien@fe.edu.vn</a>.
                    Điện thoại: <span class="style1" style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">(024)7308.13.13 </span>
                </div>
                <div style="border-bottom: solid 1px #f5f5f5; height: 30px; font-size: 12px">
                    <p style="text-align: center">
                        © Powered by <a href="http://fpt.edu.vn" target="_blank">FPT University</a>&nbsp;|&nbsp;
                        <a href="http://cms.fpt.edu.vn/" target="_blank">CMS</a>&nbsp;|&nbsp; <a href="http://library.fpt.edu.vn" target="_blank">library</a>&nbsp;|&nbsp; <a href="http://library.books24x7.com" target="_blank">books24x7</a>
                        <span id="ctl00_lblHelpdesk"></span>
                    </p>
                </div>
                <!--------------------------Kết thúc footer----------------------------------->
            </div>
        </div>
        <script>
            let findList = document.querySelectorAll(".autofindelement");
            function search(input) {

                input = input.toLowerCase();

                for (let i of findList) {

                    let val = i.querySelector(".autofind");
                    console.log(i + ' ' + val);

                    if (val.textContent.toLowerCase().includes(input))
                        i.style.display = 'table-row';
                    else
                        i.style.display = 'none';
                }
            }
            
            function confirmDelete() {
                return confirm("Are you sure you want to delete this item?");
            }
        </script>
    </body>
</html>
