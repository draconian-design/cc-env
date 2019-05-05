{% include 'copyright' %}
  {%- set ENV = 'env' -%}
  {%- set CFG = 'cfg' -%}
  {%- set SB = 'sb' -%}                

`ifndef __{{ cookiecutter.package | upper }}_{{ ENV | upper }}_SV__
 `define __{{ cookiecutter.package | upper }}_{{ ENV | upper }}_SV__

 `include "{{ cookiecutter.package }}_{{ CFG }}.sv"
 `include "{{ cookiecutter.package }}_{{ SB }}.sv"
                      
class {{ ENV }}_c extends uvm_component;

   {{ CFG }}_c {{ CFG }};
   {{ SB }}_c {{ SB }};   

   `uvm_component_utils_begin({{ cookiecutter.package }}_pkg::{{ ENV }}_c)
    `uvm_field_object({{ CFG }}, UVM_REFERENCE)
   `uvm_component_utils_end({{ cookiecutter.package }}_pkg::{{ ENV }}_c)
   
   function new(string name="{{ ENV }}", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   virtual task build_phase(uvm_phase phase);
      super.build_phase(phase);
      if (! this.cfg) begin
         `cmn_fatal(("cfg was null"))
      end
      {{ SB }} = {{ SB }}_c::type_id::create("{{ SB }}", this);
   endtask : build_phase

endclass :  {{ ENV }}_c

`endif // guard  
