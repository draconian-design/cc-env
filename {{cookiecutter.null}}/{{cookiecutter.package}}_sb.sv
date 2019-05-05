{% include 'copyright' %}
  {%- set SB  = 'sb' -%}
  {%- set CFG = 'cfg' -%}

`ifndef __{{ cookiecutter.package | upper }}_{{ SB | upper }}_SV__
 `define __{{ cookiecutter.package | upper }}_{{ SB | upper }}_SV__

 `include "{{ cookiecutter.package }}_{{ CFG }}.sv"

class {{ SB }}_c extends uvm_component;

   {{ CFG }}_c {{ CFG }};

   `uvm_component_utils_begin({{ cookiecutter.package }}_pkg::{{ SB }}_c)
    `uvm_field_object(cfg, UVM_REFERENCE)
   `uvm_component_utils_end({{ cookiecutter.package }}_pkg::{{ SB }}_c)

   function new(string name="{{ SB }}", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   virtual task build_phase(uvm_phase phase);
      super.build_phase(phase);
      if (! this.cfg) begin
         `cmn_fatal(("cfg was null"))
      end
   endtask : build_phase

endclass : {{ SB }}_c

`endif // guard
