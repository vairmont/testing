$(function() {
    $.ajax({
            url: "http://119.110.87.250/minigrosir/webservice/public/api/v1/dashboard1",
            type: 'GET',
            success: function(res) {
                console.log(res);
            var datas = [];
                for (var i =0;i < res.data.query.length;i++) {
                    data = {
                            period: res.data.query[i]['period'],
                            GrosirOne_Serang : (res.data.query[i]['store'][0]['Serang']) ? res.data.query[i]['store'][0]['Serang'] : 0,
                            GrosirOne_Cikupamas: (res.data.query[i]['store'][1]['Cikupamas']) ? res.data.query[i]['store'][1]['Cikupamas'] : 0,
                            GrosirOne_Panti_Asuhan_Muslimin : (res.data.query[i]['store'][2]['Panti Asuhan Muslimin']) ? res.data.query[i]['store'][2]['Panti Asuhan Muslimin'] : 0,
                            GrosirOne_Alam_Sutera: (res.data.query[i]['store'][3]['Alam Sutera']) ? res.data.query[i]['store'][4]['Alam Sutera'] : 0
                        }
                    datas.push(data);
                    }
                    console.log(datas);
                    Morris.Area({
                    element: 'morris-area-chart',
                    data: datas,
                    xkey: 'period',
                    ykeys: ['GrosirOne_Serang','GrosirOne_Cikupamas','GrosirOne_Panti_Asuhan_Muslimin','GrosirOne_Alam_Sutera'],
                    labels: ['GrosirOne_Serang','GrosirOne_Cikupamas','GrosirOne_Panti_Asuhan_Muslimin','GrosirOne_Alam_Sutera'],
                    xLabels: 'month',
                    pointSize: 2,
                    fillOpacity: 0.4,
                    hideHover: 'auto',
                    resize: true,
                    lineColors: ['green', 'blue','red','black']
                });

                Morris.Donut({
                    element: 'morris-donut-chart',
                    data: [{
                        label: "Agen",
                        value: res.data.agen
                    }, {
                        label: "Customer",
                        value: res.data.customer
                    }, {
                        label: "InActive",
                        value: res.data.inactive
                    }],
                    resize: true,
                    colors: ['green', 'blue','red']
                });

            }
        });


   

    

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '2006',
            a: 100,
            b: 90
        }, {
            y: '2007',
            a: 75,
            b: 65
        }, {
            y: '2008',
            a: 50,
            b: 40
        }, {
            y: '2009',
            a: 75,
            b: 65
        }, {
            y: '2010',
            a: 50,
            b: 40
        }, {
            y: '2011',
            a: 75,
            b: 65
        }, {
            y: '2012',
            a: 100,
            b: 90
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        hideHover: 'auto',
        resize: true
    });
    
});
