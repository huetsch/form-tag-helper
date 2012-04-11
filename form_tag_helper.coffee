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

  label_tag: (name, content_or_options = null, block) =>
    if block and Object.isPlainObject(content_or_options)
      options = content_or_options
    else
      options ||= {}
    options.for = @sanitize_to_id(name) unless name.trim().length is 0 or options.for?
    TagHelper.content_tag('label', content_or_options or String(name).humanize(), options, block)

  sanitize_to_id: (name) =>
    new String(name).replace(/]/g, '').replace(/[^-a-zA-Z0-9:.]/g, "_")

helper = new FormTagHelper()

exports.select_tag = helper.select_tag
