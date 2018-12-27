@extends("backend.layout.layout")
@section("content")
    <section class="Hui-article-box">
        <div class="Hui-article">
            <input type="hidden" id="hid_tid" value="0" />
            <article class="cl pd-20">

                <div class="text-c">
                    <form id="frm_admin" action="/backend/money/deposit" method="post" >
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
                            <th width="50">广告主</th>
                            <th width="50">充值金额</th>
                            <th width="50">订单号</th>
                            <th width="50">支付类型</th>
                            <th width="50">收款银行</th>
                            <th width="50">收款帐号</th>
                            <th width="50">收款人</th>
                            <th width="50">付款人</th>
                            <th width="50">支付IP</th>
                            <th width="50">状态</th>
                            <th width="100">备注</th>
                            <th width="30">创建时间</th>
                            <th width="30">处理时间</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($DepositArray as $data)
                            <tr class="text-c">
                                <td>{{$data['deposit_id']}}</td>
                                <td>{{$data['name']}}</td>
                                <td>{{$data['money']}}</td>
                                <td>{{$data['order_no']}}</td>
                                <td>@if($data['type']==1)银行转帐@elseif($data['type']==2)支付宝转帐@else微信转帐@endif</td>
                                <td>{{$data['bank']}}</td>
                                <td>{{$data['account_number']}}</td>
                                <td>{{$data['account_name']}}</td>
                                <td>{{$data['payer_account_name']}}</td>
                                <td>{{$data['pay_ip']}}</td>
                                <td>@if($data['status']==1)充值成功@elseif($data['status']==2)用户未充值@elseif($data['status']==3)订单已关闭@endif</td>
                                <td>{{$data['remark']}}</td>
                                <td>{{$data['created_at']}}</td>
                                <td>{{$data['updated_at']}}</td>

                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>

                <div class="ml-12" style="text-align: center;">
                    {{ $DepositArray->links() }}
                </div>


            </article>
        </div>

        <hr />

    </section>
    <script>

    </script>



@endsection