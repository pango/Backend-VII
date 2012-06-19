/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

Ext.require('Ext.chart.*');
Ext.require('Ext.layout.container.Fit');

Ext.onReady(function () {

    Ext.define('Usage', {
        extend: 'Ext.data.Model',
        fields: ['resolution', 'requests']
    });

    var store1 = Ext.create('Ext.data.Store', {
        model: 'Usage',
        proxy: {
            type: 'ajax',
            url : '/resolutions.json',
            reader: {
                type: 'json'
            }
        }
    });

   /* store1 = Ext.create('Ext.data.JsonStore', {
        fields: ['browser', 'requests'],
        proxy: {
            type: 'jsonp',
            url : '/frontends.json'
    }
    });  */
 
   store1.load();

    var donut = false,
        panel1 = Ext.create('widget.panel', {
        width: 700,
        height: 600,
        title: 'Resolution Trends',
        renderTo: 'kuchen',
        layout: 'fit',
        tbar: [{
            text: 'Reload Data',
            handler: function() {
                store1.load();
            }
        }, {
            enableToggle: true,
            pressed: false,
            text: 'Donut',
            toggleHandler: function(btn, pressed) {
                var chart = Ext.getCmp('chartCmp');
                chart.series.first().donut = pressed ? 35 : false;
                chart.refresh();
            }
        }],
        items: {
            xtype: 'chart',
            id: 'chartCmp',
            animate: true,
            store: store1,
            shadow: true,
            legend: {
                position: 'right'
            },
            insetPadding: 60,
            theme: 'Base:gradients',
            series: [{
                type: 'pie',
                field: 'requests',
                showInLegend: true,
                donut: donut,
                tips: {
                  trackMouse: true,
                  width: 140,
                  height: 28,
                  renderer: function(storeItem, item) {
                    //calculate percentage.
                    var total = 0;
                    store1.each(function(rec) {
                        total += rec.get('requests');
                    });
                    this.setTitle(storeItem.get('resolution') + ': ' + Math.round(storeItem.get('requests') / total * 100) + '%');
                  }
                },
                highlight: {
                  segment: {
                    margin: 20
                  }
                },
                label: {
                    field: 'resolution',
                    display: 'rotate',
                    contrast: true,
                    font: '18px Arial'
                }
            }]
        }
    });
});

