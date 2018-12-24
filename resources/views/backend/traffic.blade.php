@extends("backend.layout.layout")
@section("content")
    <script type="text/javascript" src="<?php echo asset( "/resources/views/backend/js/include/traffic.js?ver=1.1"); ?>"></script>
    <section class="Hui-article-box">
        <div class="Hui-article">
            <input type="hidden" id="hid_tid" value="0" />
            <article class="cl pd-20">

                <div class="text-c">
                    <form id="frm_admin" action="#" method="post" >
                        {{csrf_field()}}
                        <input type="text" class="input-text" style="width:250px" placeholder="输入站长" id="member" name="member" value="">
                        <button type="submit" class="btn btn-success radius" id="btn_seach" name="btn_seach">
                            <i class="Hui-iconfont">&#xe665;</i> 搜
                        </button>
                    </form>
                </div>

                <div class="mt-20">
                    <table class="table table-border table-bordered table-hover table-bg table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="50">IP</th>
                            <th width="50">来路</th>
                            <th width="50">广告主广告ID</th>
                            <th width="50">站长广告位ID</th>
                            <th width="50">是否点击</th>
                            <th width="50">省(地区)</th>
                            <th width="50">访问时间</th>
                            <th width="50">是否手机</th>
                            <th width="50">访客系统</th>
                            <th width="50">来源种类</th>
                            <th width="50">来源媒介</th>
                            <th width="50">设备型号</th>
                            <th width="50">设备品牌</th>
                            <th width="50">运营商</th>
                            <th width="50">广告商扣费</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($traffics as $data)
                            <tr class="text-c">
                                <td>{{$data['ip']}}</td>
                                <td>{{$data['come_url']}}</td>
                                <td>{{$data['ads_id']}}</td>
                                <td>{{$data['adspaceId']}}</td>
                                <td>{{$data['click_status']}}</td>
                                <td>{{$data['region']}}</td>
                                <td>{{date('Y-m-d H:i:s',$data['visit_time'])}}</td>
                                <td>{{$data['ismobile']}}</td>
                                <td>{{$data['os']}}</td>
                                <td>{{$data['client_type']}}</td>
                                <td>{{isset($setting[$data['client_name']])?$setting[$data['client_name']]:''}}</td>
                                <td>{{isset($setting[$data['model']])?$setting[$data['model']]:''}}</td>
                                <td>{{isset($setting[$data['brand']])?$setting[$data['brand']]:''}}</td>
                                <td>{{$data['operator']}}</td>
                                <td>{{$data['earn_money']}}</td>

                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>

                <div class="ml-12" style="text-align: center;">
                    {{ $traffics->links() }}
                </div>

            </article>
        </div>

        <hr />

    </section>
    <script>
        function verifyads(ads_id,status) {
            var msg = '';
            if(status == 1)
            {
                msg = '审核通过';
            }else{
                msg = '禁止';
            }
            layer.confirm( "是否审核通过ID为:"+ads_id+"的广告位？", function(){
                $.ajax({
                    type:"post",
                    url:"/backend/ads/verifyads",
                    dataType:'json',
                    headers:{'X-CSRF-TOKEN':$('input[name="_token"]').val()},
                    data:{'ads_id':ads_id, 'status':status},
                    success:function(data){
                        if(data.status == 0)
                        {
                            layer.msg( data.msg );

                        }else{
                            window.location.reload();
                            layer.msg( data.msg );
                        }

                    },
                    error:function (data) {
                        layer.msg(data.msg);
                    }
                });
            });
        }

    </script>



@endsection