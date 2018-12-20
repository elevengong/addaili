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
                            <th width="10">广告位ID</th>
                            <th width="10">站长ID</th>
                            <th width="50">站长名</th>
                            <th width="50">广告位名称</th>
                            <th width="50">广告类型</th>
                            <th width="50">计费类型</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($siteMemberAdsArray as $ads)
                            <tr class="text-c">
                                <td>{{$ads['webmaster_ads_id']}}</td>
                                <td>{{$ads['webmaster_id']}}</td>
                                <td>{{$ads['webmaster_name']}}</td>
                                <td>{{$ads['name']}}</td>
                                <td>{{isset($settingArray[$ads['ads_type']])?$settingArray[$ads['ads_type']]:$ads['ads_type']}}</td>
                                <td>{{isset($settingArray[$ads['ads_count_type']])?$settingArray[$ads['ads_count_type']]:$ads['ads_count_type']}}</td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>

                <div class="ml-12" style="text-align: center;">
                    {{ $siteMemberAdsArray->links() }}
                </div>

            </article>
        </div>

        <hr />

    </section>
    <script>
    </script>



@endsection