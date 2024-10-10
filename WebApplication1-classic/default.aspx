﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication1.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Classic</h1>
        <div>
            <button id="btn_test" type="button">Test</button>
        </div>
    </form>

    <script nonce="abcdefghijklmnopqrstuvwxyz" src="scripts/jquery-3.7.1.min.js"></script>
    <script nonce="abcdefghijklmnopqrstuvwxyz">

        function test_callback(res) {
            alert(res.value);
        }

        jQuery(function () {

            jQuery("#btn_test").bind("click", function (ev) {
				WebApplication1.test.Test("Michael", test_callback);
            });

        });

	</script>

</body>
</html>
