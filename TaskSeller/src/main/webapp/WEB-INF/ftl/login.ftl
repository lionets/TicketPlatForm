<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>小蜜蜂试用 | 掌柜登录</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${basePath}/static/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${basePath}/static/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${basePath}/static/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${basePath}/static/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${basePath}/static/css/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="${basePath}/static/css/googleapis-fonts.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="${basePath}/open/index.shtml"><b>小蜜蜂</b>试用</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">进入小蜜蜂试用圈</p>

    <form id="loginForm" action="${basePath}/u/submitLoginForm.shtml" method="post">
      <#if Request["disable"]?exists>
      <div id="disableDiv" class="alert alert-warning">此账户已禁止登陆</div>
      </#if>
      <#if Request["error"]?exists>
      <div id="errorDiv" class="alert alert-danger">用户名或密码错误</div>
      </#if>
      <div id="emailFocus" class="alert alert-warning" style="display: none;">登录名不能为空</div>
      <div class="form-group has-feedback">
      	<#if Request["email"]?exists>
      	<input type="email" name="email" id="email" class="form-control" value="${Request["email"]}" placeholder="用户名/手机号">
      	</#if>
        <#if !Request["email"]?exists>
      	<input type="email" name='email' id="email" class="form-control" placeholder="用户名/手机号">
      	</#if>
        <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
      </div>
      <div id="passwordFocus" class="alert alert-warning" style="display: none;">登录密码不能为空</div>
      <div class="form-group has-feedback">
        <input type="password" name="pswd" id="pswd" class="form-control" placeholder="登 录 密 码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox" name="rememberMe" value="1"> 免登陆猛戳...
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="${basePath}/u/register.shtml" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> 免费注册账户 猛戳这里...</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> 密码忘记？ 点我找回...</a>
    </div>
    <!-- /.social-auth-links -->

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="${basePath}/static/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${basePath}/static/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${basePath}/static/js/icheck.min.js"></script>
<script  src="${basePath}/js/common/MD5.js"></script>
<script  src="${basePath}/js/common/layer/layer.js"></script>

<script>
  $(function () {
  	try{
		var _href = window.location.href+"";
		if(_href && _href.indexOf('?kickout')!=-1){
			layer.msg('您已经被踢出，请重新登录！');
		}
	}catch(e){
		
	}
	//回车事件绑定
	document.onkeydown=function(event){
		var e = event || window.event || arguments.callee.caller.arguments[0];
		if(e && e.keyCode==13){ 
			$('#login').click();
		}
	};
	function hideDiv(){
		$("#disableDiv").hide();
		$("#errorDiv").hide();
	}
	$('#email').keyup(function(){
		var email = $("#email").val();
		if(email == ''){
			$("#emailFocus").show();
		}else{
			$("#emailFocus").hide();
		}
		hideDiv();
	});
	$('#pswd').keyup(function(){
		var password = $("#pswd").val();
		if(password == ''){
			$("#passwordFocus").show();
		}else{
			$("#passwordFocus").hide();
		}
		hideDiv();
	});
	
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
    
    $('#loginForm').submit(function(){
		var email = $("#email").val();
		if(email == ''){
			$("#emailFocus").show();
			$("#pswd").focus();
			return false;
		}
		var password = $("#pswd").val();
		if(password == ''){
			$("#passwordFocus").show();
			$("#pswd").focus();
			return false;
		}else{
			$("#pswd").val(MD5(email +"#" + password));
		}
		return true;
	});
  });
</script>
</body>
</html>
