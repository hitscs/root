
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
    <#assign currentScreenPath = ec.resource.expand(linkNode["@currentScreenPath"], "#")>
    <#assign urlInstance = sri.buildUrl(currentScreenPath)>
    <#assign subMenuNum =ec.resource.expand(linkNode["@subMenuNum"], "0")>
    <#if sri.buildUrl(currentScreenPath).inCurrentScreenPath>
        <#if subMenuNum?eval gt 0>
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
                 <span class="pull-right-container">
                 <i class="fa fa-angle-left pull-right"></i> 
                 </span>
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
    
        <#if subMenuNum?eval gt 0>
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
                 <span class="pull-right-container">
                 <i class="fa fa-angle-left pull-right"></i> 
                 </span>
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
    <#assign urlInstance = sri.buildUrl(currentScreenPath)>
    <#assign subMenuNum =ec.resource.expand(linkNode["@subMenuNum"], "0")>
    <#if sri.buildUrl(currentScreenPath).inCurrentScreenPath>
        <#if subMenuNum?eval gt 0>
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
                 <span class="pull-right-container">
                 <i class="fa fa-angle-left pull-right"></i> 
                 </span>
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
        <#if subMenuNum?eval gt 0>

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
                 <span class="pull-right-container">
                 <i class="fa fa-angle-left pull-right"></i> 
                 </span>
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









<#macro "subscreens-menu"><#if hideNav! != "true">
    <#assign displayMenu = sri.activeInCurrentMenu!>
    <#assign menuId = .node["@id"]!"subscreensMenu">
    <#assign menuTitle = .node["@title"]!sri.getActiveScreenDef().getDefaultMenuName()!"Menu">
    <#if .node["@type"]! == "popup">
        <li id="${menuId}" class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">${ec.getResource().expand(menuTitle, "")} <i class="glyphicon glyphicon-chevron-right"></i></a>
            <ul class="dropdown-menu">
                <#list sri.getActiveScreenDef().getMenuSubscreensItems() as subscreensItem>
                    <#assign urlInstance = sri.buildUrl(subscreensItem.name)>
                    <#if urlInstance.isPermitted()>
                        <li<#if urlInstance.inCurrentScreenPath> class="active"</#if>><a href="<#if urlInstance.disableLink>#<#else>${urlInstance.minimalPathUrlWithParams}</#if>"><#rt>
                            <#assign expandedMenuTitle = ec.getResource().expand(subscreensItem.menuTitle, "")>
                            <#if urlInstance.sui.menuImage?has_content>
                                <#if urlInstance.sui.menuImageType == "icon">
                                    <#t><i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                                <#elseif urlInstance.sui.menuImageType == "url-plain">
                                    <#t><img src="${urlInstance.sui.menuImage}" alt="${expandedMenuTitle}" width="18" style="padding-right: 4px;"/>
                                <#else><#rt>
                                    <#t><img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" alt="${expandedMenuTitle}" height="18" style="padding-right: 4px;"/>
                                </#if><#rt>
                            <#else><#rt>
                                <#t><i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                            </#if><#rt>
                            <#t>${expandedMenuTitle}
                        <#lt></a></li>
                    </#if>
                </#list>
            </ul>
        </li>
        <#-- move the menu to the header-menus container -->
        <script>$("#${.node["@header-menus-id"]!"header-menus"}").append($("#${menuId}"));</script>
    <#elseif .node["@type"]! == "popup-tree">
    <#else>
        <#-- default to type=tab -->
        <#if displayMenu!>
            <ul<#if .node["@id"]?has_content> id="${.node["@id"]}"</#if> class="nav nav-tabs" role="tablist">
                <#list sri.getActiveScreenDef().getMenuSubscreensItems() as subscreensItem>
                    <#assign urlInstance = sri.buildUrl(subscreensItem.name)>
                    <#if urlInstance.isPermitted()>
                        <li class="<#if urlInstance.inCurrentScreenPath>active</#if><#if urlInstance.disableLink> disabled</#if>"><#if urlInstance.disableLink>${ec.getResource().expand(subscreensItem.menuTitle, "")}<#else><a href="${urlInstance.minimalPathUrlWithParams}">${ec.getL10n().localize(subscreensItem.menuTitle)}</a></#if></li>
                    </#if>
                </#list>
            </ul>
        </#if>
        <#-- add to navbar bread crumbs too -->
        <a id="${menuId}-crumb" class="navbar-text" href="${sri.buildUrl(".")}">${ec.getResource().expand(menuTitle, "")} <i class="glyphicon glyphicon-chevron-right"></i></a>
        <script>$("#navbar-menu-crumbs").append($("#${menuId}-crumb"));</script>
    </#if>
</#if></#macro>


<#macro "subscreens-panel">
    <#assign dynamic = .node["@dynamic"]! == "true" && .node["@id"]?has_content>
    <#assign dynamicActive = 0>
    <#assign displayMenu = sri.activeInCurrentMenu!true && hideNav! != "true">
    <#assign menuId><#if .node["@id"]?has_content>${.node["@id"]}-menu<#else>subscreensPanelMenu</#if></#assign>
    <#assign menuTitle = .node["@title"]!sri.getActiveScreenDef().getDefaultMenuName()!"Menu">
    <#if .node["@type"]! == "popup">
        ${sri.renderSubscreen()}
    <#elseif .node["@type"]! == "stack">
        <h1>LATER stack type subscreens-panel not yet supported.</h1>
    <#elseif .node["@type"]! == "wizard">
        <h1>LATER wizard type subscreens-panel not yet supported.</h1>
    <#else>
        <#-- default to type=tab -->
        <div<#if .node["@id"]?has_content> id="${.node["@id"]}-tabpanel"</#if>>
            <#assign menuSubscreensItems=sri.getActiveScreenDef().getMenuSubscreensItems()>
            <#if menuSubscreensItems?has_content && (menuSubscreensItems?size > 1)>
                <#if displayMenu>
                    <ul<#if .node["@id"]?has_content> id="${.node["@id"]}-menu"</#if> class="nav nav-tabs" role="tablist">
                    <#list menuSubscreensItems as subscreensItem>
                        <#assign urlInstance = sri.buildUrl(subscreensItem.name)>
                        <#if urlInstance.isPermitted()>
                            <#if dynamic>
                                <#assign urlInstance = urlInstance.addParameter("lastStandalone", "true")>
                                <#if urlInstance.inCurrentScreenPath>
                                    <#assign dynamicActive = subscreensItem_index>
                                    <#assign urlInstance = urlInstance.addParameters(ec.getWeb().requestParameters)>
                                </#if>
                            </#if>
                            <li class="<#if urlInstance.disableLink>disabled<#elseif urlInstance.inCurrentScreenPath>active</#if>"><a href="<#if urlInstance.disableLink>#<#else>${urlInstance.minimalPathUrlWithParams}</#if>">${ec.getResource().expand(subscreensItem.menuTitle, "")}</a></li>
                        </#if>
                    </#list>
                    </ul>
                </#if>
            </#if>
            <#if !dynamic || !displayMenu>
            <#-- these make it more similar to the HTML produced when dynamic, but not needed: <div<#if .node["@id"]?has_content> id="${.node["@id"]}-active"</#if> class="ui-tabs-panel"> -->
            ${sri.renderSubscreen()}
            <#-- </div> -->
            </#if>
        </div>
        <#if dynamic && displayMenu>
            <#assign afterScreenScript>
                $("#${.node["@id"]}").tabs({ collapsible: true, selected: ${dynamicActive},
                    spinner: '<span class="ui-loading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>',
                    ajaxOptions: { error: function(xhr, status, index, anchor) { $(anchor.hash).html("Error loading screen..."); } },
                    load: function(event, ui) { <#-- activateAllButtons(); --> }
                });
            </#assign>
            <#t>${sri.appendToScriptWriter(afterScreenScript)}
        </#if>
    </#if>
</#macro>



