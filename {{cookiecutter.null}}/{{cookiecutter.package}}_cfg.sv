{% include 'copyright' %}
{% set NAME = 'cfg' %}

`ifndef __{{ cookiecutter.package | upper }}_{{ NAME | upper }}_SV__
 `define __{{ cookiecutter.package | upper }}_{{ NAME | upper }}_SV__

class {{ NAME }}_c extends uvm_object;

   `uvm_object_utils_begin({{ cookiecutter.package }}_pkg::{{ NAME }}_c)
   `uvm_object_utils_end({{ cookiecutter.package }}_pkg::{{ NAME }}_c)

   function new(string name="{{ NAME }}");
      super.new(name);
   endfunction : new

endclass :  {{ NAME }}_c

`endif // guard
