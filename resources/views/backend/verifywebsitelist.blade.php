@extends("backend.layout.layout")
@section("content")
    <script type="text/javascript" src="<?php echo asset( "/resources/views/backend/js/include/website.js?ver=1.1"); ?>"></script>
    <section class="Hui-article-box">
        <div class="Hui-article">
            <input type="hidden" id="hid_tid" value="0" />
            <article class="cl pd-20">

                <div class="text-c">
                    <form id="frm_admin" action="/backend/ads/verifylist" method="post" >
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
                            <th width="10">ID</th>
                            <th width="50">站长</th>
                            <th width="50">网站名称</th>
                            <th width="100">网址</th>
                            <th width="50">备案号</th>
                            <th width="50">状态</th>
                            <th width="50">网站类型</th>
                            <th width="30">审核时间</th>
                            <th width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($WebsitesArray as $data)
                            <tr class="text-c">
                                <td>{{$data['web_id']}}</td>
                                <td>{{$data['name']}}</td>
                                <td>{{$data['web_name']}}</td>
                                <td><a href="{{$data['domain']}}" target="_blank" style="color: red;">{{$data['domain']}}</a></td>
                                <td>{{$data['icp']}}</td>
                                <td>@if($data['status']==0)等待审核@elseif($data['status']==1)通过@else没有通过审核@endif</td>
                                <td>{{$setting[$data['webtype']]}}</td>
                                <td>{{$data['created_at']}}</td>
                                <td class="td-manage">
                                    @if($data['status']==0)
                                    <input type="button" onclick="verifywebsite('{{$data['web_id']}}')" class="btn btn-primary radius" value="审核网站" />
                                        @elseif($data['status']==1)
                                        <input type="button" onclick="verifywebsite('{{$data['web_id']}}')" class="btn btn-primary radius" value="关闭网站" />
                                        @endif
                                </td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>

                <div class="ml-12" style="text-align: center;">
                    {{ $WebsitesArray->links() }}
                </div>

            </article>
        </div>

        <hr />

    </section>
    <script>


    </script>



@endsection