(function() {
  var FormTagHelper, TagHelper, helper,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  require('cream');

  TagHelper = require('tag-helper');

  FormTagHelper = (function() {

    function FormTagHelper() {
      this.sanitize_to_id = __bind(this.sanitize_to_id, this);
      this.label_tag = __bind(this.label_tag, this);
      this.select_tag = __bind(this.select_tag, this);
    }

    FormTagHelper.prototype.select_tag = function(name, option_tags, options) {
      var html_name, prompt;
      if (option_tags == null) option_tags = null;
      if (options == null) options = {};
      html_name = options.multiple === true && (!new String(name).endsWith("[]")) ? "" + name + "[]" : name;
      if (Object["delete"](options, 'include_blank')) {
        option_tags = "<option value=\"\"></option>".html_safe().concat(option_tags);
      }
      if (prompt = Object["delete"](options, 'prompt')) {
        option_tags = ("<option value=\"\">" + prompt + "</option>").html_safe().concat(option_tags);
      }
      return TagHelper.content_tag('select', option_tags, Object.update({
        name: html_name,
        id: this.sanitize_to_id(name)
      }, options));
    };

    FormTagHelper.prototype.label_tag = function(name, content_or_options, block) {
      var options;
      if (content_or_options == null) content_or_options = null;
      if (block && Object.isPlainObject(content_or_options)) {
        options = content_or_options;
      } else {
        options || (options = {});
      }
      if (!(name.trim().length === 0 || (options["for"] != null))) {
        options["for"] = this.sanitize_to_id(name);
      }
      return TagHelper.content_tag('label', content_or_options || String(name).humanize(), options, block);
    };

    FormTagHelper.prototype.sanitize_to_id = function(name) {
      return new String(name).replace(/]/g, '').replace(/[^-a-zA-Z0-9:.]/g, "_");
    };

    return FormTagHelper;

  })();

  helper = new FormTagHelper();

  exports.select_tag = helper.select_tag;

}).call(this);
