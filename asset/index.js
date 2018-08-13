define(['oxjs','oxm/wurui/image-uploader/0.3.0/asset/main'],function(OXJS,Uploader){
  return {
    init:function($mod){
    	//$mod.OXRefresh();
    	var uploader;
    	$('form',$mod).on('submit',function(e){

    		var data={
    			uid:this.uid.value,
    			ref:this.ref.value,
    			message:this.message.value,
    			imgs:uploader && uploader.fileQ.map(x=>x._data),
    		}
    		$mod.OXPost(data,function(){
    			$mod.OXRefresh();
    		})

    		return false
    	}).on('change',function(e){
    		//console.log(e.tar.name,'---')
    		var tar=e.target;
    		if(e.target.type=='file'){
    			var name = tar.getAttribute('data-name');
                if (!uploader) {
                    uploader =  new Uploader()
                    uploader.onUploadProgress = function() {
                        $(tar).parent().children('.imgpreview:not(.upload-done)').eq(0).addClass('upload-done')
                    }
                }

                var file_id = tar.id;
                uploader.addToQ(tar.files, function(arr) {
                    for (var i = 0; i < arr.length; i++) {
                        $('label[for=' + file_id + ']').before('<span id="'+arr[i]._id+'" class="imgpreview" style="background-image:url('+arr[i]._data+');"><b class="J_Del btn-x">&times;</b></span>');
                    }
                });
    		}
    	});
    	$mod.on('click', '.J_Del', function(e) {
            var span = e.target.parentNode,
                name = span.parentNode.getAttribute('data-name');
            var uploader = uploaders[name];
            uploader.delFromQ(span.id);
            $(span).remove();
        });
    }
  }
})
