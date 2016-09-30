
<#include "DefaultScreenMacros.html.ftl"/>

<#macro container>
    <#assign divId><@nodeId .node/></#assign>
    <${.node["@type"]!"div"}<#if divId??> id="${divId}"</#if><#if .node["@style"]?has_content> class="${ec.resource.expand(.node["@style"], "")}"</#if>><#recurse>
    </${.node["@type"]!"div"}><!-- CONTAINER OVERRIDE EXAMPLE -->
</#macro>
<#-- ================ AdminLTE左侧菜单 ================ -->
<#macro "left-side">
      <!-- Left side column. contains the sidebar --> 
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <ul class="sidebar-menu"> 
            <li class="header">主菜单</li>          
            <#recurse>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>      
</#macro>
<#--一级菜单-->
<#macro "left-tree-nodes">
    <#assign linkNode = .node>
    <#assign curUrl = ec.resource.expand(linkNode["@url"], "#")>
    <#assign textLocation = ec.resource.expand(linkNode["@location"], "")>
    <#assign subMenus = sri.sfi.getScreenDefinition(textLocation).getMenuSubscreensItems()>
    <#assign currentScreenPath = ec.resource.expand(linkNode["@currentScreenPath"], "#")>
    <#assign urlInstance = sri.buildUrl(currentScreenPath)>
    <#--<#assign subMenuNum =subMenus.size()>-->
    <#assign subMenuNum =0>
            <#list subMenus as subscreensItem>   
                <#assign currentScreenDef = sri.sfi.getScreenDefinition(subscreensItem.location)>   
                <#assign currentUrlInfo = sri.buildUrl(currentScreenPath+"/${subscreensItem.name}")>   
                <#if currentUrlInfo.isPermitted()>     
                    <#if !currentScreenDef.hasRequiredParameters()>
                        <#assign subMenuNum = subMenuNum + 1>
                    </#if>                
                </#if>
            </#list>
    <#if sri.buildUrl(currentScreenPath).inCurrentScreenPath>
        <#if subMenuNum gt 0>
            <li class="active treeview">
              <a href="#">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
                 <span>${ec.resource.expand(linkNode["@text"], "")}</span>
                 <i class="fa fa-angle-left pull-right"></i> 
              </a>
              <ul class="treeview-menu menu-open">
                <#recurse>
              </ul>
            </li>
        <#else>
            <li class="active">
              <a href="${ec.resource.expand(linkNode["@url"], "#")}">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if> 
                <span>${ec.resource.expand(linkNode["@text"], "")} </span> 
                <!--<i class="fa fa-angle-left pull-right"></i>-->
              </a>
            </li>        
        </#if>
    <#else>
        <#if subMenuNum gt 0>
             <li class="treeview">
              <a href="#">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
                 <span>${ec.resource.expand(linkNode["@text"], "")}</span>
                 <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">       
                <#recurse>
              </ul>
            </li> 
        <#else>
            <li>
              <a href="${ec.resource.expand(linkNode["@url"], "#")}">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
                <span>${ec.resource.expand(linkNode["@text"], "")} </span> 
                <#--<small class="label pull-right bg-green">new</small>-->
              </a>
            </li>         
        </#if>
    </#if>
</#macro>
<#--二到N级菜单-->
<#macro "left-tree-subnodes">
    <#assign linkNode = .node>
    <#assign curUrl = ec.resource.expand(linkNode["@url"], "#")>
    <#assign currentScreenPath = ec.resource.expand(linkNode["@currentScreenPath"], "#")>
    <#assign textLocation = ec.resource.expand(linkNode["@location"], "")>
    <#assign subMenus =sri.sfi.getScreenDefinition(textLocation).getMenuSubscreensItems()>
    <#assign urlInstance = sri.buildUrl(currentScreenPath)>
    <#--<#assign subMenuNum =subMenus.size()>-->
    <#assign subMenuNum =0>
            <#list subMenus as subscreensItem>   
                <#assign currentScreenDef = sri.sfi.getScreenDefinition(subscreensItem.location)>   
                <#assign currentUrlInfo = sri.buildUrl(currentScreenPath+"/${subscreensItem.name}")>   
                <#if currentUrlInfo.isPermitted()>     

                    <#if !currentScreenDef.hasRequiredParameters()>
                        <#assign subMenuNum = subMenuNum + 1>
                    </#if>                
                </#if>
            </#list>
<#--${subMenuNum}-->
    <#--${textLocation}-->
<#--${sri.screenUrlInfo.toString()}----${currentScreenPath}-->
    <#if sri.buildUrl(currentScreenPath).inCurrentScreenPath>
        <#if subMenuNum gt 0>
                <li class="active">
                  <a href="#">

                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">

                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
                   ${ec.resource.expand(linkNode["@text"], "")}
                      <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu menu-open">
                    <#recurse>
                  </ul>
                </li>
        <#else>
        <li class="active">
            <a href="${ec.resource.expand(linkNode["@url"], "#")}">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
            ${ec.resource.expand(linkNode["@text"], "")}
            </a>
        </li>
        </#if>
    <#else> 
        <#if subMenuNum gt 0>
                <li>
                  <a href="#">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
                   ${ec.resource.expand(linkNode["@text"], "")}
                      <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu"> 
                    <#recurse>
                  </ul>
                </li>
        <#else>
        <li>
            <a href="${ec.resource.expand(linkNode["@url"], "#")}">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
            ${ec.resource.expand(linkNode["@text"], "")}
            </a>
        </li>
        </#if>
    </#if>
</#macro> 


