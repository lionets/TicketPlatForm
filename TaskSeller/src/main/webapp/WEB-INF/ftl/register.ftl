<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>小蜜蜂试用 | 注册掌柜账户</title>
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
  
  <link rel="stylesheet" href="${basePath}/css/login/style.css"/>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="${basePath}/static/js/html5shiv.min.js"></script>
  <script src="${basePath}/static/js/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="${basePath}/static/css/googleapis-fonts.css">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="${basePath}/open/index.shtml"><b>小蜜蜂</b>试用</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">注 册 一 个 新 的 掌 柜 账 户</p>

    <form action="../../index.html" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="平 台 邀 请 码">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="用户名，唯一标识不能修改">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="phone" class="form-control" placeholder="手机号码">
        <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
      	<select name="type" class="form-control">
        	<option>请 选 择 掌 柜 类 型</option>
        	<option value="1">淘&nbsp;&nbsp;宝</option>
        	<option value="2">京&nbsp;&nbsp;东</option>
        	<option value="3">蘑&nbsp;&nbsp;菇&nbsp;&nbsp;街</option>
        	<option value="4">拼&nbsp;&nbsp;多&nbsp;&nbsp;多</option>
        </select>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="掌&nbsp;&nbsp;柜&nbsp;&nbsp;号">
        <span class="glyphicon glyphicon-home form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="密          码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="确认密码">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" disabled placeholder="短信验证码">
        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> 我 同 意 <a href="#">《注册条款》</a>
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button id="send" type="button" class="btn btn-info btn-block btn-flat">发验证码</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <a href="#" class="btn btn-block btn-success btn-flat text-center" style="text-align: center;"> 立 即 注 册  </a>
    </div>

    <a href="${basePath}/u/login.shtml" class="text-center">已有平台账户，立即登录</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

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
  	$("#send").click({
  		var load = layer.load();
  		$.post("${basePath}/u/subRegister.shtml",$("#_form").serialize() ,function(result){
			layer.close(load);
			if(result && result.status!= 200){
			    return layer.msg(result.message,function(){}),!1;
			}else{
				layer.msg('注册成功！' );
			    window.location.href= result.back_url || "${basePath}/";
			}
		},"json");
  	});
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</html>
