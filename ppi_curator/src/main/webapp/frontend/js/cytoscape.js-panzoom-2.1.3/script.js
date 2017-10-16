// Code goes here

			$(function(){

				var cy = window.cy = cytoscape({
				
					container: document.getElementById('cy'),
					
					ready:function(){
					
					$("#png").click(function(e) {
	      var png64 = cy.png({ full: false });

	      //$('#png-eg').attr('src', png64);
	      //$('#png-eg')[0].src = cy.png()
	      
	   var blob = dataURLtoBlob(png64);
	   saveAs(blob, "untitled.png","image/png");		    
	   });
	    
	    $("#jpg").click(function(e) {
		      var jpg64 = cy.jpg({ full: true });

		      //$('#png-eg').attr('src', png64);
		      //$('#png-eg')[0].src = cy.png()
		      
		   var blob = dataURLtoBlob(jpg64);
		   saveAs(blob, "untitled.jpg","image/jpg");		    
		});
					
					},

                        style: [
                            {
                                selector: 'node',
                                css: {
                                    'content': 'data(name)'
                                }
                            },

                            {
                                selector: 'edge',
                                css: {
                                    'target-arrow-shape': 'triangle'
                                }
                            }
                        ],

                        elements: {
                            nodes: [
                                {data: {id: 'j', name: 'Jerry'}},
                                {data: {id: 'e', name: 'Elaine'}},
                                {data: {id: 'k', name: 'Kramer'}},
                                {data: {id: 'g', name: 'George'}}
                            ],
                            edges: [
                                {data: {source: 'j', target: 'e'}},
                                {data: {source: 'j', target: 'k'}},
                                {data: {source: 'j', target: 'g'}},
                                {data: {source: 'e', target: 'j'}},
                                {data: {source: 'e', target: 'k'}},
                                {data: {source: 'k', target: 'j'}},
                                {data: {source: 'k', target: 'e'}},
                                {data: {source: 'k', target: 'g'}},
                                {data: {source: 'g', target: 'j'}}
                            ]
                        }
                                                
                    });
									
									
				cy.panzoom({
					// options here...
			});
                    
        });
        
        			function dataURLtoBlob(dataurl) {
			    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
			        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
			    while(n--){
			        u8arr[n] = bstr.charCodeAt(n);
			    }
			    return new Blob([u8arr], {type:mime});
			}
        