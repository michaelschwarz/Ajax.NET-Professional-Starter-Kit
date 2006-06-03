<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleInfo.ascx.cs" Inherits="controls_ArticleInfo" %>

<h1><%= Title %></h1>

<div class="date" onmouseover="getAgeInDays(<%= AjaxPro.JavaScriptSerializer.Serialize(Published) %>);">Published: <%= Published %>
<%
	if(Published.Ticks != Edited.Ticks && Edited > DateTime.MinValue)
	{
%>
<span class="datePipe"> | </span>Edited: <%= Edited %>
<%
	}
%>
</div>
<div class="byline"><%= Author %></div>
<div class="overview"><p><%= Description %></p></div>
<div style="height: 18px"></div>