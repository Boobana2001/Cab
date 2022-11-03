	$(document).ready(function() 
		  {
		      $('#creg ').click(function(e)
		      {
			e.preventDefault();
		  var name = $.trim($("#name").val());
		   var phone = $.trim($("#phone").val());
		   var email= $.trim($("#email").val());
		   var npwd = $.trim($("#npwd").val());
		   var rpwd = $.trim($("#rpwd").val());
	    $.ajax({
	        type: "POST",
	        url: "Creg",
	        data: "&name=" + name + "&phone=" + phone + "&email=" + email + "&npwd=" + npwd + "&rpwd=" + rpwd, 
	        dataType: "html",
	        success: function(response) {

	            if(response != null && response !="" && response !="null"){
		        
                   $('#content').load('display.jsp?cid='+response);
                 
	     }

	   },
	        
	 });
  });
  
  
  
  
	 $('#login ').click(function(e)
		      {
			e.preventDefault();
			 $('#content').load('clogin.jsp');
				});
				
				
				
				
	$('#clogin').click(function(e){
					e.preventDefault();
				 var email= $.trim($("#email").val());
		        var pwd = $.trim($("#pwd").val());
		   //var data=$("#myform").serialize();
	    $.ajax({
	        type: "POST",
	        url: "Login",
	        data: "&email=" + email + "&pwd=" + pwd , 
	        //data : data,
	        dataType: "html",
	        success: function(response) {
	        	if( response !=0 ){
	            	
	                   $('#content').load('display.jsp?cid='+response);
	                   }
	            else {
	            	alert("Email and Password do not Match");
	            }

	        }
	    });
	    
	    });
	    
	    
	    
	    
	    $('#submit').click(function(e)
		      {
			e.preventDefault();
				   var pickuppoint= $.trim($("#pickuppoint").val());
				   var destination = $.trim($("#destination").val());
				   var pickupTime = $.trim($("#pickupTime").val());
				   var pickupDate= $.trim($("#pickupDate").val());
				   var cid = $.trim($("#cid").val());
				   var did = $.trim($("#did").val());
			    $.ajax({
			        type: "POST",
			        url: "Booking",
			        data: "&cid="+cid+"&did="+did+"&pickuppoint=" + pickuppoint + "&destination=" + destination + "&pickupTime=" + pickupTime +"&pickupDate="+ pickupDate, 
			        dataType: "html",
			        success: function(response) {
				 alert("Cab Booked Successfully");
			            if(response != null && response !="" && response !="null"){
			            	 $('#content').load('welcome.jsp?cid='+response);
			            }
			        }
			    });

		      });
		      
		      
		      
		      
		  $('#about').click(function(e)
		      {
			e.preventDefault();
			$('#content').load('info.html #abt');
			});
			
			
			
	     $('#news').click(function(e)
		      {
			e.preventDefault();
			$('#content').load('info.html #news');
			}); 
			
			
			 
		 $('#contact').click(function(e)
		      {
			e.preventDefault();
			$('#content').load('info.html #con');
			});
			
			
			      
	     $('#logout').click(function(e)
		      {
			e.preventDefault();
			$('#content').load('logout.jsp');
			});
			
			
			
		$('#goback').click(function(e)
		      {
			e.preventDefault();
			$('#content').load('index.html #content');
			});
			
			
			
	   $('#driver').click(function(e)
		      {
			e.preventDefault();
			$('#content').load('dreg.html');
			});
			
			
			
		$('#dlogin').click(function(e)
		      {
			e.preventDefault();
			$('#content').load('dlogin.html');
			});
			
			
			
		var files;
       $("input[type='file']").on("change",function(e) {
          files = e.target.files;
           });
           
           
           
		$('#dreg').click(function(e)
		      {
		e.preventDefault();
		 var form = $('#myform')[0];
        var data = new FormData(form);
		  $.ajax({
		        type: "POST",
		        url: "Addcar",
		        enctype : 'multipart/form-data',
		        contentType: false,
		        processData: false,
		        cache:false,
		         data: data,
		        //data: "&opan="+opan+"&opb="+opb+"&oaadhar="+oaadhar+"&oaddproof="+oaddproof+"&rc="+rc+"&insurance="+insurance+"&permit="+permit+"&license="+license+"&daadhar ="+daadhar +"&daddproof="+daddproof, 
		       //data: form.serialize(),
	          dataType: "html",
	          timeout: 600000,
	         success: function(response) {
			alert("Registered Successfully !");
		        	if(response != null && response !="" && response !="null"){
	            	
	                $('#content').load('driverwelcome.jsp');
	            }
		        },
		    });
		            
	      });
	      
	      
	      
	      
	      
		$('#dloginsubmit').click(function(e)
		      {
			e.preventDefault();	
			var email= $.trim($("#email").val());
		  var pwd = $.trim($("#pwd").val());
		   //var data=$("#myform").serialize();
	    $.ajax({
	        type: "POST",
	        url: "Dlogin",
	        data: "&email=" + email + "&pwd=" + pwd , 
	        //data : data,
	        dataType: "html",
	        success: function(response) {
	        	if(response != 0){
	            	
	                $('#content').load('driverwelcome.jsp');
	            }
	            else {
	            	alert("Email and Password do not Match");
	            }

	        },
	        error: function(e) {
	            alert('Error: ' + e.message);
	        }
	    });
			});
			
			
			
			
			$('#mybooking').click(function(e)
		      {
			e.preventDefault();
			var cid = $.trim($("#cid").val());
			$('#content').load('mybooking.jsp?cid='+cid);
			});
			
			
			
			
			$('#back').click(function(e)
		      {
			e.preventDefault();
			var cid = $.trim($("#cid").val());
			$('#content').load('display.jsp?cid='+cid);
			});
			
			
		  });
