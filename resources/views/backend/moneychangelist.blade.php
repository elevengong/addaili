@extends("backend.layout.layout")
@section("content")
    <section class="Hui-article-box">
        <div class="Hui-article">
            <input type="hidden" id="hid_tid" value="0" />
            <article class="cl pd-20">

                <div class="text-c">
                    <form id="frm_admin" action="/backend/money/moneychange" method="post" >
                        {{csrf_field()}}
                        <input type="text" class="input-text" style="width:250px" placeholder="输入广告主" id="member" name="member" value="">
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
                            <th width="50">用户ID</th>
                            <th width="50">用户名</th>
                            <th width="50">帐变类型</th>
                            <th width="50">操作</th>
                            <th width="50">帐变前余额</th>
                            <th width="50">帐变后余额</th>
                            <th width="50">备注</th>
                            <th width="50">details</th>
                            <th width="50">相关ID</th>
                            <th width="30">创建时间</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($moneyChangeArray as $data)
                            <tr class="text-c">
                                <td>{{$data['id']}}</td>
                                <td>{{$data['memberId']}}</td>
                                <td>{{$data['name']}}（@if($data['member_type']==1)广告商@else站长@endif）</td>
                                <td>{{$acType[$data['acType']]}}</td>
                                <td>@if($data['moreorless']==0)-@else+@endif</td>
                                <td>{{$data['balanceBeforeChange']}}</td>
                                <td>{{$data['balance']}}</td>
                                <td>{{$data['remark']}}</td>
                                <td>{{$data['details']}}</td>
                                <td>{{$data['relateId']}}</td>
                                <td>{{$data['created_at']}}</td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>

                <div class="ml-12" style="text-align: center;">
                    {{ $moneyChangeArray->links() }}
                </div>


            </article>
        </div>

        <hr />

    </section>
    <script>

    </script>



@endsection