/** @scratch /configuration/config.js/1
 * == Configuration
 * config.js is where you will find the core Grafana configuration. This file contains parameter that
 * must be set before Grafana is run for the first time.
 */
define(['settings'],
function (Settings) {
  "use strict";

  return new Settings({
      datasources: {
        graphite: {
          type: 'graphite',
          url: "http{{ 's' if grafana_https_enabled or grafana_https_proxy_enabled }}://{{ grafana_server_name }}/graphite",
        },
        elasticsearch: {
          type: 'elasticsearch',
          url: "http{{ 's' if grafana_https_enabled or grafana_https_proxy_enabled }}://{{ grafana_http_user }}:{{ es_password }}@{{ grafana_server_name }}/elasticsearch",
          index: 'grafana-dash',
          grafanaDB: true,
        }
      },
      
      // specify the limit for dashboard search results
      search: {
        max_results: 100
      },
      
      // default home dashboard
      default_route: '/dashboard/file/default.json',
      
      // set to false to disable unsaved changes warning
      unsaved_changes_warning: true,
      
      // timezoneOffset: "-0500",
      //
      // grafana_index: "{{ grafana_index_name }}",
      
      // Add your own custom panels
      plugins: {
        // list of plugin panels
        panels: [],
        // requirejs modules in plugins folder that should be loaded
        // for example custom datasources
        dependencies: [],
      }
  });
});
