$(document).ready(function() {

    var sidebar = $('[data-sidebar]');
    var button = $('[data-sidebar-button]');
    var overlay = $('[data-sidebar-overlay]');

    function showSidebar() {
        sidebar.css('margin-left', '0');

        overlay.show(0, function() {
            overlay.fadeTo('500', 0.5);
        });   
    }

    function hideSidebar() {
        sidebar.css('margin-left', sidebar.width() * -1 + 'px');

        overlay.fadeTo('500', 0, function() {
            overlay.hide();
        });;
    }

    overlay.parent().css('min-height', 'inherit');
    sidebar.css('margin-left', sidebar.width() * -1 + 'px');

    sidebar.show(0, function() {
        sidebar.css('transition', 'all 0.5s ease');
    });

    button.click(function() {
        if (overlay.is(':visible')) {
            hideSidebar();
        } else {
            showSidebar();
        }

        return false;
    });

    overlay.click(function() {
        hideSidebar();
    });
});