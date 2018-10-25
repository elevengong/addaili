@extends("backend.layout.layout")
@section("content")
    <script type="text/javascript" src="<?php echo asset( "/resources/views/backend/js/include/ads.js?ver=1.1"); ?>"></script>
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
                            <th width="10">广告位ID</th>
                            <th width="50">广告位名称</th>
                            <th width="50">链接</th>
                            <th width="100">广告图</th>
                            <th width="50">广告类型</th>
                            <th width="50">计费类型</th>
                            <th width="50">展示平台</th>
                            <th width="50">余额</th>
                            <th width="50">广告单价</th>
                            <th width="50">总花费</th>
                            <th width="50">展示数</th>
                            <th width="50">点击数</th>
                            <th width="50">展示时间段</th>
                            <th width="50">广告主ID</th>
                            <th width="50">广告主</th>
                            <th width="30">状态</th>
                            <th width="30">申请时间</th>
                            <th width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($adsListArray as $data)
                            <tr class="text-c">
                                <td>{{$data['ads_id']}}</td>
                                <td>{{$data['ads_name']}}</td>
                                <td>{{$data['ads_link']}}</td>
                                <td><a href="{{$data['ads_photo']}}" target="_blank"><img style="max-width: 100px;" src="{{$data['ads_photo']}}"></a></td>
                                <td>{{$adsTypeArray[$data['ads_type']]}}</td>
                                <td>{{$adsCountTypeArray[$data['ads_count_type']]}}</td>
                                <td>@if($data['ismobile']==0)PC @else 手机 @endif</td>
                                <td>{{$data['ads_balance']}}</td>
                                <td>{{$data['ads_per_cost']}}</td>
                                <td>{{$data['ads_amount_cost']}}</td>
                                <td>{{$data['show_times']}}</td>
                                <td>{{$data['click_times']}}</td>
                                <td>@if($data['ads_time_period']=='')全天24小时 @else $data['ads_time_period'] @endif</td>
                                <td>{{$data['member_id']}}</td>
                                <td>{{$data['member_name']}}</td>
                                <td>@if($data['status']==0)等待审核 @elseif($data['status']==1) 通过 @elseif($data['status']==2) 暂停 @elseif($data['status']==3) 禁止 @endif</td>
                                <td>{{$data['created_at']}}</td>

                                <td class="td-manage">&nbsp;
                                    @if($data['status']==0)
                                        <input type="button" onclick="verifyads('{{$data['ads_id']}}',1)" class="btn btn-primary radius" value="审核广告" />
                                    @endif
                                    @if($data['status']!=3)
                                    <input type="button" onclick="verifyads('{{$data['ads_id']}}',3)" class="btn btn-primary radius" value="禁止广告" />
                                    @endif
                                    @if($data['status']==3)
                                    <input type="button" onclick="verifyads('{{$data['ads_id']}}',1)" class="btn btn-primary radius" value="开始广告" />
                                    @endif
                                </td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>

                <div class="ml-12" style="text-align: center;">
                    {{ $adsListArray->links() }}
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