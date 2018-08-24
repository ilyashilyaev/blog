if (!window.Application)            { window.Application            = {}; }
if (!window.Application.Classes)    { window.Application.Classes    = {}; }

Application.Core = class Core {

    constructor() {
        this.afterRenderPage = this.afterRenderPage.bind(this);
        this.bindClasses     = this.bindClasses.bind(this);
    }

    start() {
        return $(document).on('load turbolinks:load', this.afterRenderPage);
    }

    afterRenderPage() {
        return this.bindClasses();
    }

    bindClasses($parent) {
        if ($parent == null) { $parent = $('body'); }
        return $parent.find("[data-controller]").each((k, el) => {
            return $.each($(el).data("controller").split(" "), (index, className) => {
                if (!$(el).hasClass(className)) {
                    new (Application.Classes[className])($(el));
                    return $(el).addClass(className);
                }
            });
        });
    }

};