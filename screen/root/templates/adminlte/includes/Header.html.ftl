<!DOCTYPE html> 
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${html_title!(((ec.tenant.tenantName)!'管理平台') + " - " + (sri.screenUrlInfo.targetScreen.getDefaultMenuName())!"Page")}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="/root/templates/adminlte/AdminLTE/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/root/templates/adminlte/plugins/font-awesome4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/root/templates/adminlte/plugins/ionicons2.0.1/ionicons.min.css">
    
    
    <link rel="stylesheet" href="/root/templates/adminlte/plugins/jquery-ui/jquery-ui.min.css"/>   
    
    <!--<link rel="stylesheet" href="/root/templates/adminlte/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css"/> -->  
    
    <link rel="stylesheet" href="/root/templates/adminlte/plugins/chosen/chosen.min.css"/>   
     
    <link rel="stylesheet" href="/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">  
    
    
    
    <!-- Theme style -->
    <link rel="stylesheet" href="/root/templates/adminlte/AdminLTE/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for troot starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="/root/templates/adminlte/AdminLTE/dist/css/skins/skin-blue-light.min.css">
    <#--<link rel="stylesheet" href="/root/templates/adminlte/AdminLTE/dist/css/skins/_all-skins.min.css">-->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="/root/templates/adminlte/plugins/html5shiv3.7.3/html5shiv.min.js"></script>
        <script src="/root/templates/adminlte/plugins/respond1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <link rel="stylesheet" href="/root/templates/adminlte/css/default.css">
    <link rel="stylesheet" href="/root/templates/adminlte/css/adminlte.css">    
    
     <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.1.4 -->
    <script src="/root/templates/adminlte/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
    <!-- Bootstrap 3.3.5 -->
    <script src="/root/templates/adminlte/AdminLTE/bootstrap/js/bootstrap.min.js"></script>    
    
    
    <script src="/root/templates/adminlte/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    
    <!--<script src="/root/templates/adminlte/plugins/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="/root/templates/adminlte/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>-->
    <script src="/lib/moment/moment-with-locales.min.js" type="text/javascript"></script>
    <script src="/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>


    <script src="/root/templates/adminlte/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js" type="text/javascript"></script>

    <script src="/root/templates/adminlte/plugins/chosen/chosen.jquery.min.js" type="text/javascript"></script>  
    <!--  
    <script src="/root/js/ueditor/ueditor.config.js"></script>
    <script src="/root/js/ueditor/ueditor.all.min.js"></script>
    <script src="/root/js/ueditor/lang/zh-cn/zh-cn.js"></script> -->
    <!-- SlimScroll -->
    <script src="/root/templates/adminlte/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>    
    <!-- FastClick -->
    <script src="/root/templates/adminlte/plugins/fastclick/fastclick.js"></script>       
    <!-- AdminLTE App -->
    <script src="/root/templates/adminlte/AdminLTE/dist/js/app.js"></script>   
    
    
        
  </head>
  <!-- hold-transition保持IE下不闪屏 -->
  <body class="hold-transition  skin-blue-light fixed ">
  <#--<body class="hold-transition  skin-blue-light layout-boxed ">-->
    <!-- Site wrapper -->
    <div class="wrapper">