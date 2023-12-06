define(['jquery','jquery/jquery.cookie','jquery/jquery.storageapi.min'],function($){'use strict';function _extend(storage){var cookiesConfig=window.cookiesConfig||{};$.extend(storage,{_secure:!!cookiesConfig.secure,_samesite:cookiesConfig.samesite?cookiesConfig.samesite:'lax',setItem:function(name,value,options){var _default={expires:this._expires,path:this._path,domain:this._domain,secure:this._secure,samesite:this._samesite};$.cookie(this._prefix+name,value,$.extend(_default,options||{}));},setConf:function(c){if(c.path){this._path=c.path;}
if(c.domain){this._domain=c.domain;}
if(c.expires){this._expires=c.expires;}
if(typeof c.secure!=='undefined'){this._secure=c.secure;}
if(typeof c.samesite!=='undefined'){this._samesite=c.samesite;}
return this;}});}
if(window.cookieStorage){_extend(window.cookieStorage);}});