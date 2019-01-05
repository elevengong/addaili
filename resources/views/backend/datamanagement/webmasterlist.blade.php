@extends("backend.layout.layout")
@section("content")
    <section class="Hui-article-box">
        <div class="Hui-article">
            <input type="hidden" id="hid_tid" value="0" />
            <article class="cl pd-20">

                <div class="text-c">
                    <form id="frm_admin" action="/backend/today/webmasterlist" method="post" >
                        {{csrf_field()}}
                        日期范围：
                        <input type="text" name="stime" value="{{date('Y-m-d'),time()}}" id="stime" class="input-text" style="width:100px">
                        至
                        <input type="text" name="etime" value="{{date('Y-m-d'),time()}}" id="etime" class="input-text" style="width:100px">
                        &nbsp;
                        <input type="text" class="input-text" style="width:200px" placeholder="输入站长ID" id="mid" name="mid" value="">

                        <button type="submit" class="btn btn-success radius" id="btn_seach" name="btn_seach">
                            <i class="Hui-iconfont">&#xe665;</i> 搜
                        </button>
                    </form>
                </div>

                <div class="mt-20">
                    <table class="table table-border table-bordered table-hover table-bg table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="20">站长ID</th>
                            <th width="50">站长帐号</th>
                            <th width="50">请求数</th>
                            <th width="50">展示数(PV)</th>
                            <th width="50">点击数</th>
                            <th width="50">点击率</th>
                            <th width="50">理论成交金额</th>
                            <th width="50">实际成交金额</th>
                            <th width="50">计费率</th>
                            <th width="50">操作</th>
                        </tr>
                        </thead>
                        <tbody>


                            {{--<tr class="text-c">--}}
                                {{--<td>{{$ads['ads_id']}}</td>--}}
                                {{--<td>{{$ads['ads_name']}}</td>--}}
                                {{--<td>{{$setting[$ads['ads_type']]}}</td>--}}
                                {{--<td>{{$setting[$ads['ads_count_type']]}}</td>--}}
                                {{--<td>{{$ads['per_cost']*1000}}元</td>--}}
                                {{--<td>{{$ads['total_budget']}}</td>--}}
                                {{--<td>{{$ads['daily_budget']}}</td>--}}
                                {{--<td>{{$ads['total_budget']}}</td>--}}
                                {{--<td>{{$ads['daily_budget']}}</td>--}}
                                {{--<td class=" br-table" id="state_{{$ads['ads_id']}}">--}}
                                    {{--@if($ads['status']==0)待审 @elseif($ads['status']==1)已审核 @elseif($ads['status']==2)已暂停 @elseif($ads['status']==3)账户余额不足 @elseif($ads['status']==4)当天预算用完 @elseif($ads['status']==5)已关闭@endif--}}
                                {{--</td>--}}
                                {{--<td>查看</td>--}}
                                {{--<td class="td-manage">&nbsp;--}}
                                  {{--1--}}
                                {{--</td>--}}
                            {{--</tr>--}}


                        </tbody>
                    </table>
                </div>

                <div class="ml-12" style="text-align: center;">

                </div>

            </article>
        </div>

        <hr />

    </section>
    <script src="<?php echo asset( "/resources/views/backend/js/laydate/laydate.js") ?>" type="text/javascript"></script>
    <script src="<?php echo asset( "/resources/views/backend/js/baseCheck.js?ver=1.0") ?>" type="text/javascript"></script>

    <script>
        laydate.render({
            elem: '#stime'
        });
        laydate.render({
            elem: '#etime'
        });
    </script>



@endsection