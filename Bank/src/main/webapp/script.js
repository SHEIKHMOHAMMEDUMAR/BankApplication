function generate() {
    var doc = new jsPDF('p', 'pt', 'a4');
    var htmlstring = '';
    var tempVarToCheckPageHeight = 0;
    var pageHeight = 0;
    pageHeight = doc.internal.pageSize.height;
    specialElementHandlers = { 
        '#bypassme': function (element, renderer) {
            return true
        }
    };
    margins = {
        top: 150,
        bottom: 60,
        left: 40,
        right: 40,
        width: 600
    };
    var y = 20;
    doc.setLineWidth(2);
    doc.text(200, y = y + 30, "Transactions");
    doc.autoTable({
        html: '#transactions',
        startY: 70,
        theme: 'grid',
        columnStyles: {
            0: {
                cellWidth: 90,
            },
            1: {
                cellWidth: 90,
            },
            2: {
                cellWidth: 60,
            },
            3: {
                cellWidth: 100,
            },
            4: {
                cellWidth: 110,
            },
            5: {
                cellWidth: 50,
            },
            6: {
                cellWidth: 50,
            }
        },
        styles: {
            minCellHeight: 40
        }
    })
    doc.save('Transactions.pdf');
}