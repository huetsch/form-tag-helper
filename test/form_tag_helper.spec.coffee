FormTagHelper = require '../form_tag_helper.coffee'

describe "FormTagHelper", ->
  
  it "select_tag works with a simple string value", ->
    expect(FormTagHelper.select_tag "people", "<option>David</option>".html_safe()).toEqual "<select id=\"people\" name=\"people\"><option>David</option></select>"

  it "select_tag works with a more complex string value", ->
    expect(FormTagHelper.select_tag "count", "<option>1</option><option>2</option><option>3</option><option>4</option>".html_safe()).toEqual "<select id=\"count\" name=\"count\"><option>1</option><option>2</option><option>3</option><option>4</option></select>"

  it "select_tag works with multiple set to true", ->
    expect(FormTagHelper.select_tag("colors", "<option>Red</option><option>Green</option><option>Blue</option>".html_safe(), multiple: true)).toEqual "<select id=\"colors\" multiple=\"multiple\" name=\"colors[]\"><option>Red</option><option>Green</option><option>Blue</option></select>"
