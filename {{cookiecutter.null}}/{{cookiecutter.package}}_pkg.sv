{% include 'copyright' %}
  {%- set NAME = cookiecutter.package -%}
  {%- set MON  = 'mon'   -%}
  {%- set DRV  = 'drv'   -%}
  {%- set SQR  = 'sqr'   -%}
  {%- set INTF = cookiecutter.package + '_intf' %}

`ifndef __{{ cookiecutter.package | upper }}_PACKAGE_SV__
 `define __{{ cookiecutter.package | upper }}_PACKAGE_SV__

 `include "uvm_macros.svh"


package {{ NAME }}_pkg;
   import uvm_pkg::*;

   // `uvm_analysis_imp_decl()
   `include "{{ cookiecutter.package }}_cfg.sv"
   `include "{{ cookiecutter.package }}_sb.sv"
   `include "{{ cookiecutter.package }}_env.sv"

endpackage :  {{ NAME }}_pkg

`endif // guard
