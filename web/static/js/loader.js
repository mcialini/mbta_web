import MainView    from './main';
import DepartureView from './main';

// Collection of specific view modules
const views = {
    "index.html": DepartureView,
    "origin.html": DepartureView,
};

export default function loadView(viewName) {
  	return views[viewName] || MainView;
};