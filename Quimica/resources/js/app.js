/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

import $ from 'jquery';
window.$ = window.jQuery = $;
global.$ = global.jQuery = require('jquery');

import 'jquery-ui/ui/widgets/datepicker.js';

require('./bootstrap');
//require('chartist-plugin-axistitle');
//require('chartist-plugin-legend');
import Vue from 'vue'

import BootstrapVue from 'bootstrap-vue'
//import * as uiv from 'uiv'
window.Vue = require('vue');

//import Chartist from 'chartist';
//global.Chartist =require('chartist');

//import {GoogleCharts} from 'google-charts';
//global.GoogleCharts = GoogleCharts;


import * as d3 from "d3";
global.d3 =d3
Vue.use(BootstrapVue)
//Vue.use(uiv)



//Vue.use(Chartist)
//Vue.use(d3)
 

Vue.component('tablamodelo', require('./components/TablaModelo.vue').default);
Vue.component('moleculesabc',require('./components/BD_pk_Koverall/MoleculesABC.vue').default);
Vue.component('solventsabc',require('./components/BD_pk_Koverall/SolventsABC.vue').default);

Vue.component('k_overallabc',require('./components/BD_pk_Koverall/K_OverallABC.vue').default);
Vue.component('pk_sabc',require('./components/BD_pk_Koverall/pk_sABC.vue').default);
Vue.component('radicalsabc',require('./components/BD_pk_Koverall/radicalsABC.vue').default);
Vue.component('referencesabc',require('./components/BD_pk_Koverall/ReferencesABC.vue').default);

 

var app = new Vue({
    el: '#app',
});


$(function ($) {
    $(".sidebar-dropdown > a").click(function() {
  $(".sidebar-submenu").slideUp(200);
  if (
    $(this)
      .parent()
      .hasClass("active")
  ) {
    $(".sidebar-dropdown").removeClass("active");
    $(this)
      .parent()
      .removeClass("active");
  } else {
    $(".sidebar-dropdown").removeClass("active");
    $(this)
      .next(".sidebar-submenu")
      .slideDown(200);
    $(this)
      .parent()
      .addClass("active");
  }
});
    var x =$(window).scrollTop();
	if(x<$("header").height())
	$(".sidebar-wrapper").css("top",$("header").height()-x);
	else
	$(".sidebar-wrapper").css("top",0);

$("#close-sidebar").click(function() {
  $(".page-wrapper").removeClass("toggled");
});
$("#show-sidebar").click(function() {
  $(".page-wrapper").addClass("toggled");
});
$(window).scroll(function(){
	var x =$(window).scrollTop();
	if(x<$("header").height())
	$(".sidebar-wrapper").css("top",$("header").height()-x);
	else
	$(".sidebar-wrapper").css("top",0);
	
});
});


