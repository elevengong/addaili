@extends("backend.layout.layout")
@section("content")
    <section class="Hui-article-box">
        <div class="Hui-article">
            <input type="hidden" id="hid_tid" value="0" />
            <article class="cl pd-20">

                <div class="text-c">
                    <form id="frm_admin" action="/backend/today/adsmemberadslist" method="post" >
                        {{csrf_field()}}
                        日期：
                        <input type="text" name="stime" value="{{isset($stime)?$stime:date('Y-m-d'),time()}}" id="stime" class="input-text" style="width:100px">
                        &nbsp;
                        <input type="text" class="input-text" style="width:200px" placeholder="输入广告商广告ID" id="adsmemberadsid" name="adsmemberadsid" value="{{isset($adsmemberadsid)?$adsmemberadsid:''}}">

                        <button type="submit" class="btn btn-success radius" id="btn_seach" name="btn_seach">
                            <i class="Hui-iconfont">&#xe665;</i> 搜
                        </button>
                    </form>
                </div>

                <div class="mt-20">
                    <table class="table table-border table-bordered table-hover table-bg table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="50">广告ID</th>
                            <th width="50">广告名称</th>
                            <th width="50">广告商ID</th>
                            <th width="50">总请求数</th>
                            <th width="50">实际展示数(PV)</th>
                            <th width="50">展示率</th>
                            <th width="50">实际扣除金额</th>
                            <th width="50">计费率</th>
                            <th width="50">点击数</th>
                            <th width="50">点击率</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($adsmasterAdsArray as $ads)
                            <tr class="text-c">
                                <td>{{$ads['ads_id']}}</td>
                                <td>{{$ads['ads_name']}}</td>
                                <td>{{$ads['member_id']}}</td>
                                <td>{{$ads['pv']}}</td>
                                <td>{{$ads['view']}}</td>
                                <td>{{$ads['pv']!=0?round($ads['view']/$ads['pv'],6):0}}</td>
                                <td>{{$ads['spant']}}</td>
                                <td>?</td>
                                <td>{{$ads['click']}}</td>
                                <td>{{$ads['pv']!=0?round($ads['click']/$ads['view'],6):0}}</td>

                            </tr>
                        @endforeach


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