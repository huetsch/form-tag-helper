FormTagHelper = require '../form_tag_helper.coffee'

describe "FormTagHelper", ->
  
  it "select_tag works with a simple string value", ->
    expect(FormTagHelper.select_tag "people", "<option>David</option>".html_safe()).toEqual "<select id=\"people\" name=\"people\"><option>David</option></select>"
