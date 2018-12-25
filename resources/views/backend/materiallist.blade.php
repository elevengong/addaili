@extends("backend.layout.layout")
@section("content")
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
                            <th width="10">创意ID</th>
                            <th width="50">广告用户ID</th>
                            <th width="50">广告用户帐号</th>
                            <th width="100">创意图</th>
                            <th width="100">创意图(base64)</th>
                            <th width="50">状态</th>
                            <th width="50">尺寸</th>
                            <th width="50">大小</th>
                            <th width="50">创建时间</th>
                            <th width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($materialArray as $material)
                            <tr class="text-c">
                                <td>{{$material['id']}}</td>
                                <td>{{$material['member_id']}}</td>
                                <td>{{$material['name']}}</td>
                                <td><a href="{{$website_domain[0]['value']}}{{$material['image']}}" target="_blank"><img src="{{$website_domain[0]['value']}}{{$material['image']}}" width="90"></a></td>
                                <td><img src="{{$material['base64']}}" width="90"></td>
                                <td>@if($material['status']==0)审核中@elseif($material['status']==1)已审核@elseif($material['status']==2)不通过@endif</td>
                                <td>{{$material['size']}}</td>
                                <td>{{$material['filesize']}}</td>
                                <td>{{$material['created_at']}}</td>
                                <td class="td-manage">&nbsp;
                                    @if($material['status']==0)
                                        <input type="button" onclick="verifymaterial('{{$material['id']}}',1)" class="btn btn-primary radius" value="通过" />
                                        <input type="button" onclick="verifymaterial('{{$material['id']}}',2)" class="btn btn-primary radius" value="不通过" />
                                    @endif
                                    @if($material['status']==1)
                                        <input type="button" onclick="setmaterial('{{$material['id']}}',2)" class="btn btn-primary radius" value="关闭素材" />
                                    @endif
                                    @if($material['status']==2)
                                        <input type="button" onclick="setmaterial('{{$material['id']}}',1)" class="btn btn-primary radius" value="开启素材" />
                                    @endif
                                </td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>

                <div class="ml-12" style="text-align: center;">
                    {{ $materialArray->links() }}
                </div>

            </article>
        </div>

        <hr />

    </section>
    <script>
        function setmaterial(id,status) {
            var msg = '';
            if(status == 1)
            {
                msg = '开启素材';
            }else{
                msg = '关闭素材';
            }
            layer.confirm( "是否"+msg+"ID为:"+id+"的广告素材？", function(){
                $.ajax({
                    type:"post",
                    url:"/backend/material/updatestatus",
                    dataType:'json',
                    headers:{'X-CSRF-TOKEN':$('input[name="_token"]').val()},
                    data:{'id':id, 'status':status},
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

        function verifymaterial(id,status) {
            var msg = '';
            if(status == 1)
            {
                msg = '审核通过';
            }else{
                msg = '不通过审核';
            }
            layer.confirm( "是否"+msg+"ID为:"+id+"的广告素材？", function(){
                $.ajax({
                    type:"post",
                    url:"/backend/material/updatestatus",
                    dataType:'json',
                    headers:{'X-CSRF-TOKEN':$('input[name="_token"]').val()},
                    data:{'id':id, 'status':status},
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