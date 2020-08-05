
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/29
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="./css/index.css">
  <script src="./js/jquery-3.5.1.js"></script>
  <script src="./js/index.js"></script>
  <style>
    .Active{
      font-size: 30px !important;
    }
    .Disabled{
      font-size: 20px !important;
    }
  </style>
  <script type="text/javascript">
    function refreshCode(){
      //1.获取验证码图片对象
      let recode;
      recode = document.getElementById("recode");

      //2.设置其src属性，加时间戳
      recode.src = "${pageContext.request.contextPath}/checkCodeServlet?time="+new Date().getTime();
    }
  </script>
</head>
<body>
<div class="box">
  <img src="./img/1307.png" alt="" id="BP">
  <svg class="PIN" focusable="false" fill="#EDE7E3">
    <path
            d="M6,8c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM12,20c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM6,20c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM6,14c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM12,14c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM16,6c0,1.1 0.9,2 2,2s2,-0.9 2,-2 -0.9,-2 -2,-2 -2,0.9 -2,2zM12,8c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM18,14c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2zM18,20c1.1,0 2,-0.9 2,-2s-0.9,-2 -2,-2 -2,0.9 -2,2 0.9,2 2,2z">
    </path>
  </svg>
  <div id="Userbox">
    <div class="left-box">
      <h2 class="Qrcode-title">Scan code login</h2>
      <img class="Qrcode-qrcode" width="300" height="300"
           src="./img/image.png"
           alt="二维码">
      <img class="Qrcode-tips" src="https://pic1.zhimg.com/80/v2-3ca9dfefdc7ab9034c123abd69a57ae0.png" alt="二维码">
      <div class="column">
        <div class="left-item">
          社交帐号登录
        </div>
        <div class="right-item">
          <ul>
            <li>
              <svg fill="#60c84d"
                   width="20" height="20">
                <path
                        d="M2.224 21.667s4.24-1.825 4.788-2.056C15.029 23.141 22 17.714 22 11.898 22 6.984 17.523 3 12 3S2 6.984 2 11.898c0 1.86.64 3.585 1.737 5.013-.274.833-1.513 4.756-1.513 4.756zm5.943-9.707c.69 0 1.25-.569 1.25-1.271a1.26 1.26 0 0 0-1.25-1.271c-.69 0-1.25.569-1.25 1.27 0 .703.56 1.272 1.25 1.272zm7.583 0c.69 0 1.25-.569 1.25-1.271a1.26 1.26 0 0 0-1.25-1.271c-.69 0-1.25.569-1.25 1.27 0 .703.56 1.272 1.25 1.272z"
                        fill-rule="evenodd"></path>
              </svg>
              &nbsp;<span>微信</span>
            </li>
            <li>
              <svg fill="#50c8fd" width="20"
                   height="20">
                <path
                        d="M12.003 2c-2.265 0-6.29 1.364-6.29 7.325v1.195S3.55 14.96 3.55 17.474c0 .665.17 1.025.281 1.025.114 0 .902-.484 1.748-2.072 0 0-.18 2.197 1.904 3.967 0 0-1.77.495-1.77 1.182 0 .686 4.078.43 6.29 0 2.239.425 6.287.687 6.287 0 0-.688-1.768-1.182-1.768-1.182 2.085-1.77 1.905-3.967 1.905-3.967.845 1.588 1.634 2.072 1.746 2.072.111 0 .283-.36.283-1.025 0-2.514-2.166-6.954-2.166-6.954V9.325C18.29 3.364 14.268 2 12.003 2z"
                        fill-rule="evenodd"></path>
              </svg>
              &nbsp;<span>QQ</span>
            </li>
            <li>
              <svg fill="#fb6622" width="20"
                   height="20">
                <path fill="#FB6622"
                      d="M15.518 3.06c8.834-.854 7.395 7.732 7.394 7.731-.625 1.439-1.673.309-1.673.309.596-7.519-5.692-6.329-5.692-6.329-.898-1.067-.029-1.711-.029-1.711zm4.131 6.985c-.661 1.01-1.377.126-1.376.126.205-3.179-2.396-2.598-2.396-2.598-.719-.765-.091-1.346-.091-1.346 4.882-.551 3.863 3.818 3.863 3.818zM5.317 7.519s4.615-3.86 6.443-1.328c0 0 .662 1.08-.111 2.797.003-.003 3.723-1.96 5.408.159 0 0 .848 1.095-.191 2.649 0 0 2.918-.099 2.918 2.715 0 2.811-4.104 6.44-9.315 6.44-5.214 0-8.026-2.092-8.596-3.102 0 0-3.475-4.495 3.444-10.33zm10.448 7.792s.232-4.411-5.71-4.207c-6.652.231-6.579 4.654-6.579 4.654.021.39.097 3.713 5.842 3.713 5.98 0 6.447-4.16 6.447-4.16zm-9.882.86s-.059-3.632 3.804-3.561c3.412.06 3.206 3.165 3.206 3.165s-.026 2.979-3.684 2.979c-3.288 0-3.326-2.583-3.326-2.583zm2.528 1.037c.672 0 1.212-.447 1.212-.998 0-.551-.543-.998-1.212-.998-.672 0-1.215.447-1.215.998 0 .551.546.998 1.215.998z"
                      fill-rule="evenodd"></path>
              </svg>
              &nbsp;<span>微博</span>
            </li>
          </ul>
        </div>
      </div>
      <!--

      -->
    </div>
    <div class="right-box">
      <h2><span class="btn Active" id="Login">Login in </span><span style="color: white;"> / </span><span class="btn Disabled"> Sign up</span></h2>
      <form action="">
        <label for="username" id="label1" >username</label>
        <input type="text" name="username" class="input1" data-place="#label1" autocomplete="off" id="username">

        <label for="password" id="label2" >password</label>
        <input type="password" name="password" class="input1" data-place="#label2" id="password">

        <label for="input3" id="label3">checkedpassword</label>
        <input type="password" name="checkedpassword" class="input1"  data-place="#label3" id="input3">
        <label for="input4" id="label4">verification</label>
        <div class="verification">
          <input type="text" name="checkedpassword" data-place="#label4" id="input4">
          <!--<img src="" alt="">-->
          <a href="javascript:refreshCode();" id="recode"><img class="img" src="${pageContext.request.contextPath}/checkCodeServlet" alt="看不清换一张" title="看不清换一张"></a>
        </div>
        <input type="submit" value="submit" name="submit" id="submit">
      </form>
    </div>
  </div>
</div>
<div class="alert-box"></div>
</body>
</html>