require 'cream'
TagHelper = require 'tag-helper'

class FormTagHelper
  select_tag: (name, option_tags = null, options = {}) =>
    html_name = if (options.multiple is true and (not new String(name).endsWith("[]"))) then "#{name}[]" else name

    if Object.delete(options, 'include_blank')
      option_tags = "<option value=\"\"></option>".html_safe().concat(option_tags)

    if prompt = Object.delete(options, 'prompt')
      option_tags = "<option value=\"\">#{prompt}</option>".html_safe().concat(option_tags)

    TagHelper.content_tag('select', option_tags, Object.update({ name: html_name, id: @sanitize_to_id(name) }, options))

  sanitize_to_id: (name) =>
    new String(name).replace(/]/g, '').replace(/[^-a-zA-Z0-9:.]/g, "_")

helper = new FormTagHelper()

exports.select_tag = helper.select_tag
