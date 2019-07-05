import "bootstrap";
import "../plugins/flatpickr";
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../plugins/init_select2';
import { removeTag } from '../components/remove_tag';
import { initAjax } from '../components/init_ajax';

initSelect2();
removeTag();
global.initAjax = initAjax;
global.removeTag = removeTag;

import $ from 'jquery';

window.$ = $

