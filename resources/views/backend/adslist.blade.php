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
                            <th width="50">广告类型</th>
                            <th width="100">计费类型</th>
                            <th width="50">单价(千次)</th>
                            <th width="50">总预算</th>
                            <th width="50">每日预算</th>
                            <th width="50">总剩余预算</th>
                            <th width="50">每日剩余预算</th>
                            <th width="50">状态</th>
                            <th width="50">查看</th>
                            <th width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($adsArray as $ads)
                            <tr class="text-c">
                                <td>{{$ads['ads_id']}}</td>
                                <td>{{$ads['ads_name']}}</td>
                                <td>{{$setting[$ads['ads_type']]}}</td>
                                <td>{{$setting[$ads['ads_count_type']]}}</td>
                                <td>{{$ads['per_cost']*1000}}元</td>
                                <td>{{$ads['total_budget']}}</td>
                                <td>{{$ads['daily_budget']}}</td>
                                <td>{{$ads['total_budget']}}</td>
                                <td>{{$ads['daily_budget']}}</td>
                                <td class=" br-table" id="state_{{$ads['ads_id']}}">
                                    @if($ads['status']==0)待审 @elseif($ads['status']==1)已审核 @elseif($ads['status']==2)已暂停 @elseif($ads['status']==3)账户余额不足 @elseif($ads['status']==4)当天预算用完 @elseif($ads['status']==5)已关闭@endif
                                </td>
                                <td>查看</td>
                                <td class="td-manage">&nbsp;
                                    @if($ads['status']==0)
                                        <input type="button" onclick="verifyads('{{$ads['ads_id']}}',1)" class="btn btn-primary radius" value="审核广告" />
                                    @endif
                                    @if($ads['status']!=2)
                                    <input type="button" onclick="verifyads('{{$ads['ads_id']}}',3)" class="btn btn-primary radius" value="禁止广告" />
                                    @endif
                                    @if($ads['status']==2)
                                    <input type="button" onclick="verifyads('{{$ads['ads_id']}}',1)" class="btn btn-primary radius" value="开始广告" />
                                    @endif
                                </td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>

                <div class="ml-12" style="text-align: center;">
                    {{ $adsArray->links() }}
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