Ext.require('Ext.chart.*');
Ext.require(['Ext.Window', 'Ext.layout.container.Fit', 'Ext.fx.target.Sprite']);

Ext.onReady(function () {

    Ext.define('Usage', {
        extend: 'Ext.data.Model',
        fields: ['datum', 'requests']
    });

    var store1 = Ext.create('Ext.data.Store', {
        model: 'Usage',
        proxy: {
            type: 'ajax',
            url : '/timelines.json',
            reader: {
                type: 'json'
            }
        }
    });

   
   store1.load();

    var donut = false,
        panel1 = Ext.create('widget.panel', {
        width: 700,
        height: 600,
        minHeight: 400,
        minWidth: 550,
        hidden: false,
        maximizable: true,
        title: 'Timeline',
        renderTo: 'kuchen',
        layout: 'fit',
        tbar: [{
            text: 'Reload Data',
            handler: function() {
                store1.load();
            }
        }],
        items: {
            id: 'chartCmp',
            xtype: 'chart',
            style: 'background:#fff',
            animate: true,
            shadow: true,
            store: store1,
            axes: [{
                type: 'Numeric',
                position: 'left',
                fields: ['requests'],
                label: {
                    renderer: Ext.util.Format.numberRenderer('0,0')
                },
                title: 'Anzahl Hits',
                grid: true,
                minimum: 0
            }, {
                type: 'Category',
                position: 'bottom',
                fields: ['datum'],
                title: 'Tag '
            }],
            series: [{
                type: 'column',
                axis: 'left',
                highlight: true,
                tips: {
                  trackMouse: true,
                  width: 140,
                  height: 28,
                  renderer: function(storeItem, item) {
                    this.setTitle(storeItem.get('datum') + ': ' + storeItem.get('requests') + ' Hits');
                  }
                },
                label: {
                  display: 'insideEnd',
                  'text-anchor': 'middle',
                    field: 'requests',
                    renderer: Ext.util.Format.numberRenderer('0'),
                    orientation: 'vertical',
                    color: '#333'
                },
                xField: 'datum',
                yField: 'requests'
            }]
        }
    });
});

