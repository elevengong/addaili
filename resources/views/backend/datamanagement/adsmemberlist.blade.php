@extends("backend.layout.layout")
@section("content")
    <section class="Hui-article-box">
        <div class="Hui-article">
            <input type="hidden" id="hid_tid" value="0" />
            <article class="cl pd-20">

                <div class="text-c">
                    <form id="frm_admin" action="/backend/today/adsmemberlist" method="post" >
                        {{csrf_field()}}
                        日期范围：
                        <input type="text" name="stime" value="{{$stime}}" id="stime" class="input-text" style="width:100px">
                        至
                        <input type="text" name="etime" value="{{$etime}}" id="etime" class="input-text" style="width:100px">
                        &nbsp;
                        <input type="text" class="input-text" style="width:200px" placeholder="输入广告商ID" id="adsmemberid" name="adsmemberid" value="{{$adsmemberid}}">

                        <button type="submit" class="btn btn-success radius" id="btn_seach" name="btn_seach">
                            <i class="Hui-iconfont">&#xe665;</i> 搜
                        </button>
                    </form>
                </div>

                <div class="mt-20">
                    <table class="table table-border table-bordered table-hover table-bg table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="20">广告商ID</th>
                            <th width="50">广告帐号</th>
                            <th width="50">总被请求数</th>
                            <th width="50">总展示数(PV)</th>
                            <th width="50">总IP数</th>
                            <th width="50">总点击数</th>
                            <th width="50">点击IP</th>
                            <th width="50">点击率</th>
                            <th width="50">实际消耗金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($adsmemberSpentArray as $data)
                            <tr class="text-c">
                                <td>{{$data['adsmember_id']}}</td>
                                <td>{{$data['name']}}</td>
                                <td>{{$data['totalPv']}}</td>
                                <td>{{$data['totalView']}}</td>
                                <td>{{$data['totalIp']}}</td>
                                <td>{{$data['totalClick']}}</td>
                                <td>{{$data['totalClickIp']}}</td>
                                <td>{{empty($data['totalView'])?0:round($data['totalIp']/$data['totalView'],5)}}</td>
                                <td>{{$data['totalSpent']}}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>

                <div class="ml-12" style="text-align: center;">
                    {!! $adsmemberSpentArray->appends(array('stime'=>$stime,'etime'=>$etime))->render() !!}
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